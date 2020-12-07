package project.kp.kp001_d001.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import project.kp.kp001_d001.service.Kp001_d001Service;
import project.kp.kp001_d001.vo.Kp001_d001VO;

@Controller
public class Kp001_d001ControllerImpl implements Kp001_d001Controller{
	@Autowired
	Kp001_d001Service kp001_d001Service;
	@Autowired
	Kp001_d001VO Kp001_d001VO;
	
	@Override
	@RequestMapping(value = "/kp/kp001_d001/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("kp/kp001_d001_init");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/kp/kp001_d001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectUserList(String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", p_id);
		
		List<Kp001_d001VO> list = kp001_d001Service.selectUserList(searchMap);
		
		ModelAndView mav = new ModelAndView("kp/kp001_d001_search");
		mav.addObject("searchList", list);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/kp/kp001_d001/deleteUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String user_id = request.getParameter("user_id");
		kp001_d001Service.deleteUser(user_id);
	}	
	
	@Override
	@ResponseBody
	@RequestMapping(value = "kp/kp001_d001/list.do", produces="application/text; charset=UTF-8")
	public String selectList() throws Exception {
		List<HashMap<String, String>> list = kp001_d001Service.list();
		return new Gson().toJson(list);
	}
}
