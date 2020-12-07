package project.ap.ap001_d001.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.ap.ap001_d001.service.Ap001_d001Service;

@Controller
public class Ap001_d001ControllerImpl implements Ap001_d001Controller{
	@Autowired
	private Ap001_d001Service ap001_d001Service;
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	// 로그인 초기화면
	@Override
	@RequestMapping(value="/ap/ap001_d001/loginInit.do")
	public ModelAndView init(@RequestParam(required=false) String login, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("ap/ap001_d001_init");
		mav.addObject("login", login);
		return mav;
	}
	
	// 로그인버튼 눌렀을 떄
	@Override
	@RequestMapping(value="/ap/ap001_d001/login.do")
	public String login(@RequestParam HashMap<String, String> searchMap, HttpSession session, HttpServletRequest request, RedirectAttributes rattr) throws Exception {
		Map<String, String> resultMap = ap001_d001Service.login(searchMap); // 입력한 아이디로 암호 가져오기
		System.out.println("resultMap====>" + resultMap);
		if(resultMap != null) { // 아이디가 존재하면
			boolean pwdMatch = pwdEncoder.matches(searchMap.get("user_pwd"), resultMap.get("USER_PWD"));
			if(pwdMatch == true) { // 비밀번호가 일치하면
				session.setAttribute("user", resultMap);
				return "redirect:/main.do";
			}
		}
			
		return "redirect:/ap/ap001_d001/loginInit.do?login=fail";		
	}
	
	@Override
	@RequestMapping(value="/ap/ap001_d001/logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/main.do";
	}
}
