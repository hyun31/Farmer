package project.ep.ep001_d002.controller;

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

import project.ep.ep001_d002.service.Ep001_d002Service;
import project.standardCode.service.StandardCodeService;
import project.standardCode.vo.StandardCodeVO;
import project.utils.area.service.AreaService;

@Controller
public class Ep001_d002ControllerImpl implements Ep001_d002Controller{
	@Autowired
	Ep001_d002Service ep001_d002Service;
	@Autowired
	StandardCodeService standardCodeService;
	@Autowired
	AreaService areaService;

	@Override
	@RequestMapping(value = "ep/ep001_d002/init.do")
	public ModelAndView init() throws Exception {
		ModelAndView mav = new ModelAndView("ep/ep001_d002_init");
		
		List<StandardCodeVO> stateList = standardCodeService.selectCodeList("020");
		mav.addObject("stateList", stateList);

		// 지역 select list
		List<HashMap<String, String>> seoul = areaService.selectArea("01");
		List<HashMap<String, String>> busan = areaService.selectArea("02");
		List<HashMap<String, String>> incheon = areaService.selectArea("03");
		List<HashMap<String, String>> daegu = areaService.selectArea("04");
		List<HashMap<String, String>> gwangju = areaService.selectArea("05");
		List<HashMap<String, String>> daejeon = areaService.selectArea("06");
		List<HashMap<String, String>> ulsan = areaService.selectArea("07");
		List<HashMap<String, String>> gg = areaService.selectArea("09");
		List<HashMap<String, String>> gw = areaService.selectArea("10");
		List<HashMap<String, String>> cn = areaService.selectArea("11");
		List<HashMap<String, String>> cb = areaService.selectArea("12");
		List<HashMap<String, String>> gb = areaService.selectArea("13");
		List<HashMap<String, String>> gn = areaService.selectArea("14");
		List<HashMap<String, String>> jb = areaService.selectArea("15");
		List<HashMap<String, String>> jn = areaService.selectArea("16");
		List<HashMap<String, String>> jj = areaService.selectArea("17");

		// 세부지역
		mav.addObject("seoul", new Gson().toJson(seoul));
		mav.addObject("busan", new Gson().toJson(busan));
		mav.addObject("incheon", new Gson().toJson(incheon));
		mav.addObject("daegu", new Gson().toJson(daegu));
		mav.addObject("gwangju", new Gson().toJson(gwangju));
		mav.addObject("daejeon", new Gson().toJson(daejeon));
		mav.addObject("ulsan", new Gson().toJson(ulsan));
		mav.addObject("gg", new Gson().toJson(gg));
		mav.addObject("gw", new Gson().toJson(gw));
		mav.addObject("cn", new Gson().toJson(cn));
		mav.addObject("cb", new Gson().toJson(cb));
		mav.addObject("gb", new Gson().toJson(gb));
		mav.addObject("gn", new Gson().toJson(gn));
		mav.addObject("jb", new Gson().toJson(jb));
		mav.addObject("jn", new Gson().toJson(jn));
		mav.addObject("jj", new Gson().toJson(jj));
		
		// 계약기간 공통코드o
		List<StandardCodeVO> contract_date = standardCodeService.selectCodeList("013");
		mav.addObject("contractDate", contract_date);
		
		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "ep/ep001_d002/gardenList.do", produces = "application/text; charset=UTF-8")
	public String selectGardenList(@RequestParam HashMap<String, String> map) throws Exception {
		map.forEach((k, v) -> System.out.println((k + ":" + v)));
		List<HashMap<String,String>> gardenList = ep001_d002Service.selectGardenList(map);
		String gardenListjson = new Gson().toJson(gardenList);
		System.out.println(gardenListjson);
		return gardenListjson;
	}
	
	@Override
	@RequestMapping(value = "ep/ep001_d002/apply.do")
	public ModelAndView apply(@RequestParam HashMap<String, String> map, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("ep/ep001_d002_apply");
		if(map.get("contract_term").equals("01")) {
			map.put("contract_term", "3");
		} else if(map.get("contract_term").equals("02")) {
			map.put("contract_term", "6");
		}
		if(map.get("area_size").equals("5평")) {
			map.put("area_size", "01");
		} else if(map.get("area_size").equals("10평")) {
			map.put("area_size", "02");
		}
		mav.addObject("applyGarden", map);
		
		List<StandardCodeVO> paymentList = standardCodeService.selectCodeList("007");
		mav.addObject("paymentList", paymentList);
		mav.addObject("user", (HashMap<String, String>)session.getAttribute("user"));
		
		return mav;
	}
}
