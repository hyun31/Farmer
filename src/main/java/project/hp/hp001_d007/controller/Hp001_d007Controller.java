package project.hp.hp001_d007.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

public interface Hp001_d007Controller {
	public ModelAndView insertInit(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;
	public String insertFarm(HashMap<String, Object> map, MultipartFile[] file, HttpServletRequest request, HttpSession session) throws Exception;
	public ModelAndView insertFarmResult(String farm_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView insertFarmResultList(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception;
}
