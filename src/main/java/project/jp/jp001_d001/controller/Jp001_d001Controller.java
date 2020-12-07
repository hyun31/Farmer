package project.jp.jp001_d001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface Jp001_d001Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectUserList(String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
