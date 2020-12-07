package project.bp.bp001_d001.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.bp.bp001_d001.service.Bp001_d001Service;
import project.bp.bp001_d001.vo.Bp001_d001VO;
import project.mail.MailService;
import project.standardCode.service.StandardCodeService;
import project.standardCode.vo.StandardCodeVO;

@Controller
public class Bp001_d001ControllerImpl implements Bp001_d001Controller {
	@Autowired
	Bp001_d001Service bp001_d001Service;
	@Autowired
	StandardCodeService standardCodeService;
	@Autowired
	MailService mailService;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	@Override
	@RequestMapping(value = "/bp/bp001_d001/joinInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<StandardCodeVO> phoneList = standardCodeService.selectCodeList("001");
		List<StandardCodeVO> emailList = standardCodeService.selectCodeList("002");
		List<StandardCodeVO> monthList = standardCodeService.selectCodeList("003");
		List<StandardCodeVO> dayList = standardCodeService.selectCodeList("004");
		List<StandardCodeVO> wayList = standardCodeService.selectCodeList("019");
		int random = new Random().nextInt(900000) + 100000;
		
		ModelAndView mav = new ModelAndView("bp/bp001_d001_init");
		mav.addObject("phoneList", phoneList);
		mav.addObject("emailList", emailList);
		mav.addObject("monthList", monthList);
		mav.addObject("dayList", dayList);
		mav.addObject("wayList", wayList);
		mav.addObject("random", random);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/bp/bp001_d001/join.do", method = { RequestMethod.POST })
	public String join(Bp001_d001VO vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String birth = "";
		if(request.getParameter("year") != "") {
			birth = request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day");
		}
		vo.setUser_pwd(pwdEncoder.encode(vo.getUser_pwd()));
		vo.setUser_phone(phone);
		vo.setUser_email(email);
		vo.setBirth_date(birth);
		System.out.println(vo);
		bp001_d001Service.insertUser(vo);
		
		return "redirect:/main.do";
	}
	
	@Override
	@RequestMapping(value = "/bp/bp001_d001/sendAuthCode.do", method = {RequestMethod.POST})
	@ResponseBody
	public boolean createEmailCheck(@RequestParam String user_email, @RequestParam int random, HttpServletRequest request) throws Exception {
		int ran = new Random().nextInt(900000) + 100000; // 이메일에 보내줄 난수
		
		HttpSession session = request.getSession(true); // session  HttpSession session
		
		String authCode = String.valueOf(ran); // int -> String //  이메일에 보내준 난수를 String으로 바꿈
		
		session.setAttribute("authCode", authCode); // 이메일로 보낸 난수
		session.setAttribute("random", random); 	// 회원가입 페이지에서 가져온 난수
		
		String subject = "아임파머스 회원가입 인증 코드 안내입니다.";
		String text = "인증 코드 : " + authCode;
		return mailService.send(subject, text, user_email);
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/bp/bp001_d001/emailAuth.do" , method = {RequestMethod.POST})
	public ResponseEntity<String> emailAuth(@RequestParam String auth_code, @RequestParam String random, HttpSession session) throws Exception {
		String originalCode = (String)session.getAttribute("authCode");
		String originalRandom = Integer.toString((int)session.getAttribute("random"));
		if(originalCode.equals(auth_code) && originalRandom.equals(random)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		} else
			return new ResponseEntity<String>("false", HttpStatus.OK);
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value ="bp/bp001_d001/checkId.do")
	public ResponseEntity<String> checkId(@RequestParam String user_id) throws Exception {
		int result = bp001_d001Service.checkId(user_id);
		System.out.println(user_id);
		if(result == 1) {
			return new ResponseEntity<String>("duplicate", HttpStatus.OK); 
		} else {
			return new ResponseEntity<String>("okay", HttpStatus.OK);
		}
	}
}
