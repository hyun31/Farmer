package project.ep.ep001_d007.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public interface Ep001_d007Controller {
	public String kakaoPay(HashMap<String, String> map, HttpSession session) throws Exception;
	public ModelAndView kakaoPaySuccess(String pg_token, String order_id, String user_id) throws Exception;
	public String kakaoPayCancel() throws Exception;
}
