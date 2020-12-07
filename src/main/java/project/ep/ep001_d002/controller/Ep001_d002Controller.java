package project.ep.ep001_d002.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface Ep001_d002Controller {
	public ModelAndView init() throws Exception;
	public String selectGardenList(HashMap<String, String> map) throws Exception;
	public ModelAndView apply(HashMap<String, String> map, HttpSession session) throws Exception;
}
