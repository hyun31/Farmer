package project.ip.ip001_d001.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.ip.ip001_d001.service.Ip001_d001Service;
import project.ip.ip001_d001.vo.Ip001_d001VO;
import project.standardCode.service.StandardCodeService;

@Controller
public class Ip001_d001ControllerImpl implements Ip001_d001Controller {
	@Autowired
	Ip001_d001Service ip001_d001Service;
	@Autowired
	StandardCodeService standardCodeService;
	
	@Override
	@RequestMapping(value = "/ip/ip001_d001/calendarInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView init(HttpSession session, @RequestParam HashMap<String, Integer> map) throws Exception {
		ModelAndView mav = new ModelAndView("ip/ip001_d001_init2");
		if(session.getAttribute("user") != null) {
			HashMap<String, String> user = (HashMap<String, String>)session.getAttribute("user");
			List<Ip001_d001VO> list = ip001_d001Service.selectFarmGardenNo(user);
			if(list.size() != 0 ) {
				if(map.get("farm_no") == null && map.get("garden_no") == null) {
					map.put("farm_no", list.get(0).getFarm_no());
					map.put("garden_no", list.get(0).getGarden_no());
				}
				mav.addObject("gardens", list);
				mav.addObject("showSchedule", ip001_d001Service.showSchedule(map));
			}
		} else {
			return new ModelAndView("common/main");
		}
		mav.addObject("scheduleCategoryList", standardCodeService.selectCodeList("011"));
		
		try {
		// 다가오는 일정
		List<HashMap<String, String>> comingSchedules = ip001_d001Service.selectComingSchedule(map);
		mav.addObject("comingSchedules", comingSchedules);
		
		//농장정보
		HashMap<String, String> farminfo = ip001_d001Service.selectFarmInfo(map);
		mav.addObject("farminfo", farminfo);
		System.out.println(farminfo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/ip/ip001_d001/addSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, String> addSchedule(@RequestBody Ip001_d001VO vo, HttpSession session) throws Exception {
		HashMap<String, String> user = (HashMap<String, String>)session.getAttribute("user");
		List<Ip001_d001VO> list = ip001_d001Service.selectFarmGardenNo(user);
		vo.setFarm_no(list.get(0).getFarm_no());
		ip001_d001Service.addSchedule(vo);
		
		return new HashMap<String, String>();
	}
}
