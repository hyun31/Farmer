package project.kp.kp001_d004.controller;

import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

public interface Kp001_d004Controller {
	public ModelAndView init() throws Exception;
	public String insertProduct(HashMap<String, String> map) throws Exception;
	public String selectProducts() throws Exception;
}
