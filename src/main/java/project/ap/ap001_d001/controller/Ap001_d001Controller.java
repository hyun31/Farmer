package project.ap.ap001_d001.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface Ap001_d001Controller {
	public ModelAndView init(@RequestParam String login, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String login(HashMap<String, String> searchMap, HttpSession session, HttpServletRequest request, RedirectAttributes rattr) throws Exception;
	public String logout(HttpSession session) throws Exception;
}
