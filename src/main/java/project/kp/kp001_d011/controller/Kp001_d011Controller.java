package project.kp.kp001_d011.controller;

import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

public interface Kp001_d011Controller {
	public ModelAndView init(HashMap<String, String> map) throws Exception;
	public String gardenList(HashMap<String, String> map) throws Exception;
	public String insertGarden(HashMap<String, String> map) throws Exception;
}
