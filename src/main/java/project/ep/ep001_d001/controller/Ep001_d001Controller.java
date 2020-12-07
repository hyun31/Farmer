package project.ep.ep001_d001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface Ep001_d001Controller {
	public ModelAndView init(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String selectfarmList(HttpServletRequest request) throws Exception;
	public ModelAndView farmInfo(String farm_no) throws Exception;
}
