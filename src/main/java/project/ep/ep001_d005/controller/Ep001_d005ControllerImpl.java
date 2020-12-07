package project.ep.ep001_d005.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import project.ep.ep001_d005.service.Ep001_d005Service;
import project.standardCode.service.StandardCodeService;
import project.standardCode.vo.StandardCodeVO;

@Controller
public class Ep001_d005ControllerImpl implements Ep001_d005Controller{
	@Autowired
	Ep001_d005Service ep001_d005Service;
	@Autowired
	StandardCodeService standardCodeService;
	
	@Override
	@RequestMapping(value = "ep/ep001_d005/init.do")
	public ModelAndView init(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("ep/ep001_d005_init");
		HashMap<String, String> user = (HashMap<String, String>)session.getAttribute("user");
		List<HashMap<String, String>> farmList = ep001_d005Service.selectFarmList(user.get("USER_ID"));
		mav.addObject("farmList", farmList);
		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/ep/ep001_d005/selectGardenList.do", produces = "application/text; charset=UTF-8")
	public String selectGardenList(@RequestParam String farm_no, HttpSession session) throws Exception {
		HashMap<String, String> user = (HashMap<String,String>)session.getAttribute("user");
		String user_id = user.get("USER_ID");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cust_id", user_id);
		map.put("farm_no", farm_no);
		
		List<HashMap<String, String>> gardenList = ep001_d005Service.selectGardenList(map);
		String json = new Gson().toJson(gardenList);
		return json;
	}
	
	@Override
	@RequestMapping(value = "ep/ep001_d005/pay.do")
	public ModelAndView pay(@RequestParam HashMap<String, String> map) throws Exception {
		ModelAndView mav = new ModelAndView("ep/ep001_d005_pay");
		map.put("farm_address", ep001_d005Service.selectFarmAddress(map.get("farm_no")));
		// 결제수단 공통코드
		List<StandardCodeVO> paymentList = standardCodeService.selectCodeList("007");
		mav.addObject("paymentList", paymentList);
		mav.addObject("harvestInfo", map);
		return mav;
	}
}
