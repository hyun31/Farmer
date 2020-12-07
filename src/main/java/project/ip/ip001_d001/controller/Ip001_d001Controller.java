package project.ip.ip001_d001.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import project.ip.ip001_d001.vo.Ip001_d001VO;

public interface Ip001_d001Controller {
	public ModelAndView init(HttpSession session, HashMap<String, Integer> map) throws Exception;
	public Map<String, String> addSchedule(Ip001_d001VO vo, HttpSession session) throws Exception;
}
