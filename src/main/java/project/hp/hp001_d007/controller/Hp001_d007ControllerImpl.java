package project.hp.hp001_d007.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.hp.hp001_d007.service.Hp001_d007Service;
import project.standardCode.service.StandardCodeService;

@Controller
public class Hp001_d007ControllerImpl implements Hp001_d007Controller {
	@Autowired
	Hp001_d007Service hp001_d007Service;
	@Autowired
	StandardCodeService standardCodeService;
	
	@Override
	@RequestMapping(value = "hp/hp001_d007/insertInit.do")
	public ModelAndView insertInit(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = null;
		HashMap<String, String> user = (HashMap<String,String>)session.getAttribute("user");
		String user_id = user.get("USER_ID");
		List<HashMap<String, String>> applyList = hp001_d007Service.selectFarmApply(user_id);
		if(applyList.isEmpty()) {
			mav = new ModelAndView("hp/hp001_d007_insert");
			mav.addObject("contractDate", standardCodeService.selectCodeList("014"));
			mav.addObject("areaSize", standardCodeService.selectCodeList("026"));
		} else {
			mav = new ModelAndView("hp/hp001_d007_resultList");
			mav.addObject("applyList", applyList);
		}
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "hp/hp001_d007/insertFarm.do", method= {RequestMethod.POST})
	public String insertFarm(@RequestParam HashMap<String, Object> map, MultipartFile[] file, HttpServletRequest request, HttpSession session) throws Exception {
		/*
		 * if(map.get("contractDate").equals("6개월")) { map.put("contractDate", "6"); }
		 * else if(map.get("contractDate").equals("12개월")) { map.put("contractDate",
		 * "12"); }
		 */
		
		String address = map.get("roadAddress") + " " + map.get("detailAddress");
		map.put("address", address);
		
		System.out.println(file.length);
		System.out.println("--농장등록 map 값 확인--");
		map.forEach((k,v) -> System.out.println(k + "//" + v));
		
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println(path);
		
		Map<String, String> user = (Map<String, String>) session.getAttribute("user");
		map.put("farmer_id", user.get("USER_ID"));
		
		hp001_d007Service.insertFarm(map, file, path);
		return "redirect:/hp/hp001_d007/insertInit.do";
	}
	
	@Override
	@RequestMapping(value = "hp/hp001_d007/insertFarmResult.do", method= { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insertFarmResult(@RequestParam String farm_no, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("nw/hp001_d007_result");
		mav.addObject("farmInfo", hp001_d007Service.selectFarmInfo(farm_no));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "hp/hp001_d007/insertFarmResultList.do", method= { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insertFarmResultList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("nw/hp001_d007_resultList");
		HashMap<String, String> user = (HashMap<String,String>)session.getAttribute("user");
		String user_id = user.get("USER_ID");
		mav.addObject("applyList", hp001_d007Service.selectFarmApply(user_id));
		return mav;
}
}
