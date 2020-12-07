package project.kp.kp001_d001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface Kp001_d001Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectUserList(String p_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String selectList() throws Exception;
}
