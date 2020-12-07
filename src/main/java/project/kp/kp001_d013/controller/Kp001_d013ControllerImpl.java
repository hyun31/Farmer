package project.kp.kp001_d013.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Kp001_d013ControllerImpl implements Kp001_d013Controller{

	@Override
	@RequestMapping(value = "/admin.do")
	public ModelAndView init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("kp/kp001_d013_init");
		return mav;
	}
}
