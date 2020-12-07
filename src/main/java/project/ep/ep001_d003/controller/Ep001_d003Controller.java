package project.ep.ep001_d003.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface Ep001_d003Controller {
	public ModelAndView init(HttpSession session) throws Exception;
	public String selectGardenList(String farm_no, HttpSession session) throws Exception;
	public String selectGardenInfo(HashMap<String, String> map) throws Exception;
	public ModelAndView extensionApply(HashMap<String, String> map) throws Exception;
}
