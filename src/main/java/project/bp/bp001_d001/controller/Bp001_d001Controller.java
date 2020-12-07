package project.bp.bp001_d001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

import project.bp.bp001_d001.vo.Bp001_d001VO;

public interface Bp001_d001Controller {
	public ModelAndView init(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String join(Bp001_d001VO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public boolean createEmailCheck(String userEmail, int random, HttpServletRequest request) throws Exception;
	public ResponseEntity<String> emailAuth(String authCode, String random, HttpSession session) throws Exception;
	public ResponseEntity<String> checkId(String userId) throws Exception; 
}
