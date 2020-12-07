package project.ep.ep001_d001.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import project.ep.ep001_d001.service.Ep001_d001Service;
import project.standardCode.service.StandardCodeService;
import project.standardCode.vo.StandardCodeVO;
import project.utils.area.service.AreaService;

@Controller
public class Ep001_d001ControllerImpl implements Ep001_d001Controller{
	@Autowired
	Ep001_d001Service ep001_d001Service;
	@Autowired
	StandardCodeService standardCodeService;
	@Autowired
	AreaService areaService;
	
	@Override
	@RequestMapping(value = "/ep/ep001_d001/init.do")
	public ModelAndView init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("ep/ep001_d001_init");
		List<HashMap<String, String>> list = ep001_d001Service.selectFarmList(new HashMap<String, String>());
		List<StandardCodeVO> stateList = standardCodeService.selectCodeList("020");
		
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
		
		
		String listJson = new Gson().toJson(list);
		String seoulJson = new Gson().toJson(seoul);
		
		// 마커 찍기 위한 농장 도로명주소 리스트
		mav.addObject("roadAddressList", listJson);
		
		// 시/도 리스트
		mav.addObject("stateList", stateList);
		
		// 세부지역
		mav.addObject("seoul", seoulJson);
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
		
		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value ="/ep/ep001_d001/farmList.do", produces = "application/text; charset=UTF-8")
	public String selectfarmList(HttpServletRequest request) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("city", request.getParameter("city"));
		map.put("name", request.getParameter("name"));
		List<HashMap<String, String>> list = ep001_d001Service.selectFarmList(map);
		
		String json = new Gson().toJson(list);
		return json;
	}
	
	@Override
	@RequestMapping(value = "/ep/ep001_d001/farmInfo.do")
	public ModelAndView farmInfo(@RequestParam String farm_no) throws Exception {
		ModelAndView mav = new ModelAndView("ep/ep001_d009_init");
		HashMap<String, String> farmInfo = ep001_d001Service.selectFarmInfo(farm_no);
		return mav;
	}
}
