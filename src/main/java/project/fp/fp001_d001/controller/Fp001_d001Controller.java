package project.fp.fp001_d001.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.fp.fp001_d001.vo.Fp001_d001VO;

public interface Fp001_d001Controller {
	// 장터 목록가져오기
	public ModelAndView articlesInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 장터 글쓰기화면으로 이동
	public ModelAndView articlesWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 장터 글쓰기
//	public ModelAndView articlesInsert(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String articlesInsert(HttpServletRequest request, HttpServletResponse response, MultipartFile[] file) throws Exception;
	// ckeditorUpload
	public String ckeditorUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile[] upload) throws Exception;
	// 장터 글보기
	public ModelAndView viewArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 장터 글 수정하기
	public ModelAndView updateView(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String updateArticles(HttpServletRequest request, HttpServletResponse response, MultipartFile[] file) throws Exception;
	// 장터 글 삭제
	public String deleteArticles(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	// 알림사항 목록
	public ModelAndView notifications(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 알림사항 글쓰기
	public ModelAndView notiWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	// 채팅!!
	public ModelAndView chat(String writer_id, String room_id, HttpSession session) throws Exception;
	// 채팅목록
	public ModelAndView chatList(HttpSession session) throws Exception;
}
