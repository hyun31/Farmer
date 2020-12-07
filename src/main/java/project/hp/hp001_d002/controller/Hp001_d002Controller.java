package project.hp.hp001_d002.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.hp.hp001_d002.common.Pagination2;
import project.hp.hp001_d002.service.Hp001_d002Service;
import project.hp.hp001_d002.vo.Hp001_d002VO;
import project.hp.hp001_d002.vo.Reply2VO;

@Controller
public class Hp001_d002Controller {

	@Inject
	private Hp001_d002Service hp001_d002Service;

	// 01. 농장등록문의 조회
	@RequestMapping(value = "/hp/hp001_d002", method = RequestMethod.GET)
	public String getBoardList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {

		// 농장등록문의 게시글 개수
		int listCnt = hp001_d002Service.getBoardListCnt();

		// 농장등록문의 페이지 및 정보 부분
		Pagination2 pagination2 = new Pagination2();
		pagination2.pageInfo(page, range, listCnt);

		model.addAttribute("pagination2", pagination2);
		model.addAttribute("articlesList", hp001_d002Service.getBoardList(pagination2));

		return "hp/hp001_d002";
	}

	// 02. 농장등록문의 글쓰기
	@RequestMapping(value = "/hp/hp001_d002Form", method = RequestMethod.GET)
	public String boardForm(@ModelAttribute("hp001_d002VO") Hp001_d002VO hp001_d002VO, Model model) {
		return "hp/hp001_d002Form";
	}

	// 03. 농장등록문의 글 저장하는 부분
	@RequestMapping(value = "/hp/saveBoard2", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("hp001_d002VO") Hp001_d002VO hp001_d002VO,
			@RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {

		if (mode.equals("edit")) {
			hp001_d002Service.updateBoard(hp001_d002VO);
		} else {
			hp001_d002Service.insertBoard(hp001_d002VO);
		}

		return "redirect:/hp/hp001_d002";
	}

//	// 04. 농장등록문의 상세글 보기
//	@RequestMapping(value = "/hp/getBoardContent2", method = RequestMethod.GET)
//	public String getBoardContent(Model model, @RequestParam("article_no") int article_no) throws Exception {
//		model.addAttribute("hp001_d002Content", hp001_d002Service.getBoardContent(article_no));
//		return "hp/hp001_d002Content";
//	}

	// 04. 댓글리스트
	@RequestMapping(value = "hp/getBoardContent2", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("article_no") int bid) throws Exception {
		model.addAttribute("hp001_d002Content", hp001_d002Service.getBoardContent(bid));
		model.addAttribute("reply2VO", new Reply2VO());
		return "hp/hp001_d002Content";
	}

	// 05. 농장등록문의 게시글 삭제
	@RequestMapping(value = "/hp/deleteBoard2", method = RequestMethod.GET)
	public String deleteBoard(RedirectAttributes rttr, @RequestParam("article_no") int article_no) throws Exception {
		hp001_d002Service.deleteBoard(article_no);
		return "redirect:/hp/hp001_d002";
	}

	// 06. 농장등록문의 게시글 수정
	@RequestMapping(value = "/hp/editForm2", method = RequestMethod.GET)
	public String editForm(@RequestParam("article_no") int article_no, @RequestParam("mode") String mode, Model model)
			throws Exception {

		model.addAttribute("hp001_d002Content", hp001_d002Service.getBoardContent(article_no));
		model.addAttribute("mode", mode);
		model.addAttribute("hp001_d002VO", new Hp001_d002VO());

		return "hp/hp001_d002Form";

	}
}
