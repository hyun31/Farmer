package project.ep.ep001_d005.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface Ep001_d005Controller {
	public ModelAndView init(HttpSession session) throws Exception;
	public String selectGardenList(String farm_no, HttpSession session) throws Exception;
	public ModelAndView pay(HashMap<String, String> map) throws Exception;
}
