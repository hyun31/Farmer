package project.ep.ep001_d004.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import project.ep.ep001_d004.service.Ep001_d004Service;
import project.standardCode.service.StandardCodeService;
import project.standardCode.vo.StandardCodeVO;

@Controller
public class Ep001_d004ControllerImpl implements Ep001_d004Controller{
	@Autowired
	Ep001_d004Service ep001_d004Service;
	@Autowired
	StandardCodeService standardCodeService;
	
	@Override
	@RequestMapping(value = "/ep/ep001_d004/init.do")
	public ModelAndView init(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("ep/ep001_d004_init");
		HashMap<String, String> user = (HashMap<String, String>)session.getAttribute("user");
		List<HashMap<String, String>> farmList = ep001_d004Service.selectFarmList(user.get("USER_ID"));
		mav.addObject("farmList", farmList);
		
		// 상품분류
		List<StandardCodeVO> productGroup = standardCodeService.selectCodeList("006");
		mav.addObject("productGroup", productGroup);
		// 사용구분
		List<StandardCodeVO> useType = standardCodeService.selectCodeList("025");
		mav.addObject("useType", useType);
		
		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/ep/ep001_d004/selectGardenList.do", produces = "application/text; charset=UTF-8")
	public String selectGardenList(@RequestParam String farm_no, HttpSession session) throws Exception {
		HashMap<String, String> user = (HashMap<String,String>)session.getAttribute("user");
		String user_id = user.get("USER_ID");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cust_id", user_id);
		map.put("farm_no", farm_no);
		
		List<HashMap<String, String>> gardenList = ep001_d004Service.selectGardenList(map);
		String json = new Gson().toJson(gardenList);
		return json;
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/ep/ep001_d004/selectProductList.do", produces = "application/text; charset=UTF-8")
	public String selectProductList(@RequestParam HashMap<String, String> map) throws Exception {
		List<HashMap<String, String>> prodList = ep001_d004Service.selectProductList(map);
		String json = new Gson().toJson(prodList);
		return json;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/ep/ep001_d004/selectProdInfo.do", produces = "application/text; charset=UTF-8")
	public String selectProdInfo(@RequestParam HashMap<String, String> map) throws Exception {
		System.out.println(map);
		HashMap<String, String> prodInfo = ep001_d004Service.selectProdInfo(map);
		System.out.println(prodInfo);
		String json = new Gson().toJson(prodInfo);
		return json;
	}
	
	@Override
	@RequestMapping(value = "/ep/ep001_d004/pay.do", method= {RequestMethod.POST})
	public ModelAndView pay(@RequestParam HashMap<String, String> map) throws Exception {
		System.out.println("--------ep001d004 pay map 확인--------------");
		map.forEach((k,v)->System.out.println(k+" : "+v));
		System.out.println("**************************끝************************");
		
		ModelAndView mav = new ModelAndView("ep/ep001_d004_pay");
		// 결제수단 공통코드
		List<StandardCodeVO> paymentList = standardCodeService.selectCodeList("007");
		mav.addObject("paymentList", paymentList);
		
		List<HashMap<String, String>> productList = new ArrayList<HashMap<String,String>>();
		int total_price = 0;
		int total_count = 0;
		for(int i=1; i <= Integer.parseInt(map.get("index")); i++) {
			if(map.get("prod_no_"+i) != null) {
				HashMap<String, String> newmap = new HashMap<String, String>();
				// 총 가격
				int price =  Integer.parseInt(map.get("prod_price_"+i)) * Integer.parseInt(map.get("prod_count_"+i));
				total_price += price;
				String prod_price = Integer.toString(price);
				int count = Integer.parseInt(map.get("prod_count_"+i));
				total_count += count;
				newmap.put("index", Integer.toString(i));
				newmap.put("prod_no", map.get("prod_no_"+i));
				newmap.put("prod_type_cd", map.get("prod_type_cd_"+i));
				newmap.put("prod_price", prod_price);
				newmap.put("prod_option", map.get("prod_option_"+i));
				newmap.put("prod_count", map.get("prod_count_"+i));
				// 상품 이름
				String prod_name = ep001_d004Service.selectProdInfo(newmap).get("PROD_NAME");
				newmap.put("prod_name", prod_name);
				productList.add(newmap);
			}
		}
		mav.addObject("productList", productList);
		
		HashMap<String, Object> payInfo = new HashMap<String, Object>();
		payInfo.put("total_price", total_price);
		payInfo.put("total_count", total_count);
		payInfo.put("farm_no", map.get("farm_no"));
		payInfo.put("garden_no", map.get("garden_no"));
		mav.addObject("payInfo", payInfo);
		
		System.out.println(productList);
		
		return mav;
	}
}
