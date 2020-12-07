package project.ep.ep001_d007.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.ep.ep001_d007.service.Ep001_d007Service;
import project.utils.kakaopay.KakaoPay;
import project.utils.kakaopay.KakaoPayApprovalVO;

@Controller
public class Ep001_d007ControllerImpl implements Ep001_d007Controller{
	@Autowired
	private Ep001_d007Service ep001_d007Service;
	@Autowired
	private KakaoPay kakaopay;
	
	// 결제버튼 눌렀을 때
	@Override
	@RequestMapping(value = "/ep/ep001_d007/kakaoPay", method= {RequestMethod.POST})
	public String kakaoPay(@RequestParam HashMap<String, String> map, HttpSession session) throws Exception {
		//partner_order_id
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String order_date = sdf.format(now);
		String order_seq = ep001_d007Service.selectSequence();
		String order_no = order_date + order_seq;
		map.put("partner_order_id", order_no);
		//partner_user_id
		HashMap<String, String> user = (HashMap<String, String>)session.getAttribute("user");
		map.put("partner_user_id", user.get("USER_ID"));
		// 텃밭 분양신청, 연장신청 일 때
		if(map.get("order_code").equals("01") || map.get("order_code").equals("02")) {
			//map item_name 추가
			String item_name = map.get("farm_nm") + "/" + map.get("garden_nm") + map.get("garden_no");
			map.put("item_name", item_name);
			//map에 total_amount 추가
			if(map.get("area_size").equals("01")) {
				if(map.get("contract_term").equals("3")) {
					map.put("total_amount", "60000");
				} else if(map.get("contract_term").equals("6")) {
					map.put("total_amount", "80000");
				}
			} else if(map.get("area_size").equals("02")) {
				if(map.get("contract_term").equals("3")) {
					map.put("total_amount", "100000");
				} else if(map.get("contract_term").equals("6")) {
					map.put("total_amount", "120000");
				}
			}
				
			map.put("harvest_type", "");
		// 씨앗, 모장 상품구매일 때
		} else if(map.get("order_code").equals("03")) {
			String item_name = map.get("prod_name_1") + " 등 " + map.get("quantity")+"개";
			map.put("item_name", item_name);
			map.put("harvest_type", "");
			map.put("contract_term", "");
			// 주문상품테이블에 insert 해야함!!!!!!!!
			System.out.println("************************************");
			map.forEach((k,v) -> System.out.println(k + ":" + v));
			System.out.println("************************************");
			int i = 1;
			while(map.get("prod_no_"+i) != null) {
				HashMap<String, String> item = new HashMap<String, String>();
				item.put("order_no", order_no);
				item.put("prod_gr_id", map.get("prod_type_cd_"+i));
				item.put("prod_no", map.get("prod_no_"+i));
				item.put("prod_cnt", map.get("prod_count_"+i));
				item.put("plant_type", map.get("prod_option_"+i));
				item.put("price", map.get("prod_price_"+i));
				item.put("farm_no", map.get("farm_no"));
				ep001_d007Service.insertOrderItem(item);
				i++;
			}
		// 수확 결제 일 때
		} else if(map.get("order_code").equals("04")) {
			if(map.get("harvest_type").equals("01")) {
				map.put("total_amount", "0");
				map.put("item_name", "직접방문");
			} else if (map.get("harvest_type").equals("02")) {
				map.put("total_amount", "20000");
				map.put("item_name", "택배수령");
			}
			map.put("contract_term", "");
		}
		String address = map.get("postcode") + " " + map.get("roadAddress") + " " + map.get("detailAddress");
		map.put("address", address);
		
		System.out.println("------------------------insertOrder map 확인------------------------------");
		map.forEach((k,v)->System.out.println(k+"///"+v));
		System.out.println("------------------------insertOrder map 확인 끝------------------------------");
		
		// 주문상태 대기로 테이블에 INSERT
		ep001_d007Service.insertOrder(map);
		
		return "redirect:" + kakaopay.kakaoPayReady(map);
	}
	// 카카오페이 성공시
	@Override
	@RequestMapping(value = "/ep/ep001_d007/kakaoPaySuccess")
	public ModelAndView kakaoPaySuccess(@RequestParam String pg_token, @RequestParam String order_id, @RequestParam String user_id ) throws Exception {
		ModelAndView mav = new ModelAndView("ep/ep001_d007_success");
		
		KakaoPayApprovalVO vo = kakaopay.kakaoPayInfo(pg_token, order_id, user_id);
		String order_no = vo.getPartner_order_id();
		// ORDERS테이블 주문 상태를 결제완료 상태로 변환
		ep001_d007Service.updateStatus(order_no);
		// 결제테이블에 입력
		HashMap<String, String> payment_map = new HashMap<String, String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String order_date = sdf.format(vo.getApproved_at()); // 승인날짜 Date -> String 변환
		payment_map.put("order_no", vo.getPartner_order_id());
		payment_map.put("order_date", order_date);
		payment_map.put("total_price", Integer.toString(vo.getAmount().getTotal()));
		ep001_d007Service.insertPayment(payment_map);
		
		// 주문정보 가져오기
		HashMap<String, String> orderInfo = ep001_d007Service.selectOrderInfo(order_no);
		System.out.println("-------orderInfo-------------");
		System.out.println(orderInfo);
		// 텃밭분양신청 일때
		if("01".equals(orderInfo.get("ORDER_CODE"))) {
			// 텃밭 소비자ID, 대여유무, 대여기간 대여시작일 대여만료일 설정
			ep001_d007Service.updateGarden(orderInfo);
		// 텃반연장신청 일때
		}else if("02".equals(orderInfo.get("ORDER_CODE"))) {
			ep001_d007Service.extensionGarden(orderInfo);
		// 씨앗/모종 상품구매 일때
		}else if(("03".equals(orderInfo.get("ORDER_CODE")))) {
			List<HashMap<String,String>> items = ep001_d007Service.selectItemInfo(order_no);
			mav.addObject("items", items);
		// 수확/기타 상품 구매일때
		}else if("04".equals(orderInfo.get("ORDER_CODE"))) {
			// 할거 없음.
		}
		System.out.println(vo.getItem_name());
		orderInfo.put("product_name", vo.getItem_name());
		mav.addObject("orderInfo", orderInfo);
		
		return mav;
	}
	
	//카카오페이 결제취소시
	@Override
	@RequestMapping(value = "/ep/ep001_d007/kakaoPayCancel")
	public String kakaoPayCancel() throws Exception {
		System.out.println("kakaoPayCancel....................................");
		return "redirect:/ep/ep001_d002/init.do";
	}
	
	@RequestMapping(value = "/ep/ep001_d007/aa")
	public ModelAndView aa() throws Exception {
		ModelAndView mav = new ModelAndView("ep/ep001_d007_success");
		return mav;
	}
}
