package project.hp.hp001_d004.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.hp.hp001_d004.common.Pagination;
import project.hp.hp001_d004.service.Hp001_d004Service;
import project.hp.hp001_d004.vo.Hp001_d004VO;
import project.hp.hp001_d004.vo.Reply4VO;

@Controller
//@RequestMapping(value = "/hp")
public class Hp001_d004Controller {

	@Inject
	private Hp001_d004Service hp001_d004Service;

	// 01. 질문게시판 조회
	@RequestMapping(value = "/hp/hp001_d004", method = RequestMethod.GET)
	public String getBoardList(Model model, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		
		// 질문 게시글 개수
		int listCnt = hp001_d004Service.getBoardListCnt();

		// Pagination 객체생성 및 페이지 정보 셋팅
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		System.out.println("==============>> Controller:"+page+","+range+","+listCnt);
		
		System.out.println("==============>> Controller_현재목록 페이지: "+page);
		System.out.println("==============>> Controeller_각 페이지범위 시작번호: " + range);
		System.out.println("==============>> Controller_전체게시물 개수: " + listCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("articlesList", hp001_d004Service.getBoardList(pagination));
		
		return "hp/hp001_d004";

	}

	// 02. 질문게시판  글쓰기
	@RequestMapping(value="/hp/hp001_d004Form", method =RequestMethod.GET)
	public String boardForm(@ModelAttribute("hp001_d004VO") Hp001_d004VO Hp001_d004VO, Model model) {
		return "hp/hp001_d004Form";
	}

	// 저장
	@RequestMapping(value = "/hp/saveBoard4", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("hp001_d004VO") Hp001_d004VO Hp001_d004VO,
			@RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {

		if (mode.equals("edit")) {
			hp001_d004Service.updateBoard(Hp001_d004VO);
		} else {
			hp001_d004Service.insertBoard(Hp001_d004VO);
		}

		return "redirect:/hp/hp001_d004";

	}

	// 03.상세글 보기
//	@RequestMapping(value = "/hp/getBoardContent4", method = RequestMethod.GET)
//	public String getBoardContent(Model model, @RequestParam("article_no") int article_no) throws Exception {
//		model.addAttribute("hp001_d004Content", hp001_d004Service.getBoardContent(article_no));
//		return "hp/hp001_d004Content";
//	}
	
	@RequestMapping(value = "hp/getBoardContent4", method= RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("article_no") int bid) throws Exception {
		model.addAttribute("hp001_d004Content", hp001_d004Service.getBoardContent(bid));
		model.addAttribute("reply4VO", new Reply4VO());
		return "hp/hp001_d004Content";
	}
	

	// 04.삭제
	@RequestMapping(value = "/hp/deleteBoard4", method = RequestMethod.GET)
	public String deleteBoard(RedirectAttributes rttr, @RequestParam("article_no") int article_no) throws Exception {
		hp001_d004Service.deleteBoard(article_no);
		return "redirect:/hp/hp001_d004";
	}

	// 05.수정 
	@RequestMapping(value = "/hp/editForm4", method = RequestMethod.GET)
	public String editForm(@RequestParam("article_no") int article_no, @RequestParam("mode") String mode, Model model)
			throws Exception {

		model.addAttribute("hp001_d004Content", hp001_d004Service.getBoardContent(article_no));
		model.addAttribute("mode", mode);
		model.addAttribute("hp001_d004VO", new Hp001_d004VO());

		return "hp/hp001_d004Form";

	}

}
