package project.jp.jp001_d001.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.jp.jp001_d001.service.Jp001_d001Service;
import project.jp.jp001_d001.vo.Jp001_d001VO;

@Controller
public class Jp001_d001ControllerImpl implements Jp001_d001Controller{
	@Autowired
	Jp001_d001Service jp001_d001Service;
	@Autowired
	Jp001_d001VO Jp001_d001VO;
	
	@Override
	@RequestMapping(value = "/jp/jp001_d001/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("jp/jp001_d001_init");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/jp/jp001_d001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectUserList(String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("p_id", p_id);
		
		List<Jp001_d001VO> list = jp001_d001Service.selectUserList(searchMap);
		
		ModelAndView mav = new ModelAndView("jp/jp001_d001_search");
		mav.addObject("searchList", list);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/jp/jp001_d001/deleteUser.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String p_del_id = request.getParameter("p_del_id");
		System.out.println("===>delUSer.do 들어옴" + p_del_id);
		int result = jp001_d001Service.deleteUser(p_del_id);
		
		return "redirect:/jp/jp001_d001/searchList.do";
	}	
}
