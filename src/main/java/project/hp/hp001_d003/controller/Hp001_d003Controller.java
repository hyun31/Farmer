package project.hp.hp001_d003.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.hp.hp001_d003.common.Pagination3;
import project.hp.hp001_d003.service.Hp001_d003Service;
import project.hp.hp001_d003.vo.Hp001_d003VO;
import project.hp.hp001_d003.vo.Reply3VO;

@Controller
public class Hp001_d003Controller {

	@Inject
	private Hp001_d003Service hp001_d003Service;

	// 01. 분양문의 조회
	@RequestMapping(value = "/hp/hp001_d003", method = RequestMethod.GET)
	public String getBoardList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {

		// 분양문의 게시글 개수
		int listCnt = hp001_d003Service.getBoardListCnt();

		// 분양문의 페이지 및 정보 부분
		Pagination3 pagination3 = new Pagination3();
		pagination3.pageInfo(page, range, listCnt);

		System.out.println("==============>> Controller:" + page + "," + range + "," + listCnt);

		System.out.println("==============>> Controller_현재목록 페이지: " + page);
		System.out.println("==============>> Controeller_각 페이지범위 시작번호: " + range);
		System.out.println("==============>> Controller_전체게시물 개수: " + listCnt);

		model.addAttribute("pagination3", pagination3);
		model.addAttribute("articlesList", hp001_d003Service.getBoardList(pagination3));

		return "hp/hp001_d003";
	}

	// 02. 분양문의 글쓰기
	@RequestMapping(value = "/hp/hp001_d003Form", method = RequestMethod.GET)
	public String boardForm(@ModelAttribute("hp001_d003VO") Hp001_d003VO hp001_d003VO, Model model) {
		return "hp/hp001_d003Form";
	}

	// 분양문의 글 저장하는 부분
	@RequestMapping(value = "/hp/saveBoard3", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("hp001_d003VO") Hp001_d003VO hp001_d003VO,
			@RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {

		if (mode.equals("edit")) {
			hp001_d003Service.updateBoard(hp001_d003VO);
		} else {
			hp001_d003Service.insertBoard(hp001_d003VO);
		}

		return "redirect:/hp/hp001_d003";
	}

	// 분양문의 상세글 보기
//	@RequestMapping(value = "/hp/getBoardContent3", method = RequestMethod.GET)
//	public String getBoardContent(Model model, @RequestParam("article_no") int article_no) throws Exception {
//		model.addAttribute("hp001_d003Content", hp001_d003Service.getBoardContent(article_no));
//		return "hp/hp001_d003Content";
//	}
	
	// 댓글 리스트
	@RequestMapping(value = "hp/getBoardContent3", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("article_no") int bid) throws Exception {
		model.addAttribute("hp001_d003Content", hp001_d003Service.getBoardContent(bid));
		model.addAttribute("reply3VO", new Reply3VO());
		return "hp/hp001_d003Content";
	}

	// 분양문의 게시글 삭제
	@RequestMapping(value = "/hp/deleteBoard3", method = RequestMethod.GET)
	public String deleteBoard(RedirectAttributes rttr, @RequestParam("article_no") int article_no) throws Exception {
		hp001_d003Service.deleteBoard(article_no);
		return "redirect:/hp/hp001_d003";
	}

	// 분양문의 게시글 수정
	@RequestMapping(value = "/hp/editForm3", method = RequestMethod.GET)
	public String editForm(@RequestParam("article_no") int article_no, @RequestParam("mode") String mode, Model model)
			throws Exception {

		model.addAttribute("hp001_d003Content", hp001_d003Service.getBoardContent(article_no));
		model.addAttribute("mode", mode);
		model.addAttribute("hp001_d003VO", new Hp001_d003VO());

		return "hp/hp001_d003Form";

	}
}