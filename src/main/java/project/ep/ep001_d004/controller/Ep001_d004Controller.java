package project.ep.ep001_d004.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface Ep001_d004Controller {
	public ModelAndView init(HttpSession session) throws Exception;
	public String selectGardenList(String farm_no, HttpSession session) throws Exception;
	public String selectProductList(HashMap<String, String> map) throws Exception;
	public String selectProdInfo(HashMap<String, String> map) throws Exception;
	public ModelAndView pay(HashMap<String, String> map) throws Exception;
}
