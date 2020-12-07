package project.kp.kp001_d009.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import project.kp.kp001_d009.service.Kp001_d009Service;
import project.standardCode.service.StandardCodeService;

@Controller
public class Kp001_d009ControllerImpl implements Kp001_d009Controller {
	@Autowired
	Kp001_d009Service kp001_d009Service;
	@Autowired
	StandardCodeService standardCodeService;
	
	@Override
	@RequestMapping(value = "kp/kp001_d009/insertInit.do")
	public ModelAndView insertInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("kp/kp001_d009_insert");
		mav.addObject("contractDate", standardCodeService.selectCodeList("014"));
		return mav;
	}
	
	@Override
	@RequestMapping(value = "kp/kp001_d009/insertFarm.do", method= {RequestMethod.POST})
	public String insertFarm(@RequestParam HashMap<String, Object> map, MultipartFile[] file, HttpServletRequest request) throws Exception {
		if(map.get("contractDate").equals("6개월")) {
			map.put("contractDate", "6");
		} else if(map.get("contractDate").equals("12개월")) {
			map.put("contractDate", "12");
		}
		
		String address = map.get("roadAddress") + " " + map.get("detailAddress");
		map.put("address", address);
		
		System.out.println("--농장등록 map 값 확인--");
		map.forEach((k,v) -> System.out.println(k + "//" + v));
		
		String path = request.getSession().getServletContext().getRealPath("/");
		System.out.println(path);
		
		
		kp001_d009Service.insertFarm(map, file, path);
		return "redirect:/kp/kp001_d009/insertInit.do";
	}
	
	@Override
	@RequestMapping(value = "kp/kp001_d009/listInit.do")
	public ModelAndView listInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("kp/kp001_d009_list");
		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "kp/kp001_d009/productList.do", produces = "application/text; charset=UTF-8")
	public String list() throws Exception {
		List<HashMap<String, String>> farmList = kp001_d009Service.selectFarms();
		String farmListJson = new Gson().toJson(farmList);
		System.out.println(farmListJson);
		return farmListJson;
	}
}
