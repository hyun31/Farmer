package project.kp.kp001_d004.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import project.kp.kp001_d004.service.Kp001_d004Service;
import project.standardCode.service.StandardCodeService;
import project.standardCode.vo.StandardCodeVO;

@Controller
public class Kp001_d004ControllerImpl implements Kp001_d004Controller{
	@Autowired
	StandardCodeService standardCodeService;
	@Autowired
	Kp001_d004Service kp001_d004Service;
	
	@Override
	@RequestMapping(value = "/kp/kp001_d004/init.do")
	public ModelAndView init() throws Exception {
		ModelAndView mav = new ModelAndView("kp/kp001_d004_init");
		List<StandardCodeVO> productGroup = standardCodeService.selectCodeList("006");
		mav.addObject("productGroup", productGroup);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/kp/kp001_d004/insertProduct.do")
	public String insertProduct(@RequestParam HashMap<String, String> map) throws Exception {
		map.forEach((k, v) -> System.out.println(k +"//" + v));
		kp001_d004Service.insertProduct(map);
		
		return "redirect:/kp/kp001_d004/init.do";
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/kp/kp001_d004/productList.do", produces = "application/text; charset=UTF-8")
	public String selectProducts() throws Exception {
		List<HashMap<String, String>> list = kp001_d004Service.selectProducts();
		System.out.println(list);
		return new Gson().toJson(list);
	}
}
