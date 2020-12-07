package project.kp.kp001_d011.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import project.kp.kp001_d011.service.Kp001_d011Service;
import project.standardCode.service.StandardCodeService;
import project.standardCode.vo.StandardCodeVO;

@Controller
public class Kp001_d011ControllerImpl implements Kp001_d011Controller{
	@Autowired
	Kp001_d011Service kp001_d011Service;
	@Autowired
	StandardCodeService standardCodeService;
	
	@Override
	@RequestMapping(value = "/kp/kp001_d011/init.do",  method = {RequestMethod.GET })
	public ModelAndView init(@RequestParam HashMap<String, String> map)  throws Exception {
		ModelAndView mav = new ModelAndView("kp/kp001_d011_init");
		List<StandardCodeVO> gardenList = standardCodeService.selectCodeList("022");
		mav.addObject("farm_no", map.get("farm_no"));
		mav.addObject("farm_nm", map.get("farm_nm"));
		mav.addObject("gardenList", gardenList);
		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/kp/kp001_d011/gardenList.do", produces = "application/text; charset=UTF-8")
	public String gardenList(@RequestParam HashMap<String, String> map) throws Exception {
		List<HashMap<String, String>> gardenList = kp001_d011Service.selectGardenList(map);
		String gardenListJson = new Gson().toJson(gardenList);
		return gardenListJson;
	}
	
	@Override
	@RequestMapping(value = "/kp/kp001_d011/insertGarden.do", method= {RequestMethod.POST})
	public String insertGarden(@RequestParam HashMap<String, String> map) throws Exception {
		System.out.println("insertGarden.do=======================");
		map.forEach((k, v) -> System.out.println((k + ":" + v)));
		
		int garden_cnt = Integer.parseInt(map.get("garden_cnt"));
		HashMap<String, String> pmap = new HashMap<String, String>();
		pmap.put("farmer_id", map.get("farmer_id"));
		pmap.put("farm_no", map.get("farm_no"));
		pmap.put("garden_nm", map.get("garden_nm"));
		for(int i=1; i<=garden_cnt; i++) {
			pmap.put("garden_no", String.valueOf(i));
			pmap.put("latitude", map.get("latitude"+i));
			pmap.put("longitude", map.get("longitude"+i));
			pmap.forEach((k, v) -> System.out.println((k + ":" + v)));
			kp001_d011Service.insertGarden(pmap);
		}
		return "redirect:/kp/kp001_d011/init.do?farm_no="+map.get("farm_no");
	}
}
