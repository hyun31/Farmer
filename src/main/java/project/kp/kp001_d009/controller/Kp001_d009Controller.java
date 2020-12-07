package project.kp.kp001_d009.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface Kp001_d009Controller {
	public ModelAndView insertInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String insertFarm(HashMap<String, Object> map, MultipartFile[] file, HttpServletRequest request) throws Exception;
	public ModelAndView listInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String list() throws Exception;
}
