package project.hp.hp001_d001.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.hp.hp001_d001.common.Pagination1;
import project.hp.hp001_d001.service.Hp001_d001Service;
import project.hp.hp001_d001.vo.Hp001_d001VO;
import project.hp.hp001_d001.vo.Reply1VO;

@Controller
public class Hp001_d001Controller {

	@Inject
	private Hp001_d001Service hp001_d001Service;

	// 01. 공지사항 게시글 조회
	@RequestMapping(value = "/hp/hp001_d001", method = RequestMethod.GET)
	public String getBoardList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {

		// 공지사항 게시글 개수
		int listCnt = hp001_d001Service.getBoardListCnt();

		// 공지사항 페이지 및 정보 부분
		Pagination1 pagination1 = new Pagination1();
		pagination1.pageInfo(page, range, listCnt);

		model.addAttribute("pagination1", pagination1);
		model.addAttribute("articlesList", hp001_d001Service.getBoardList(pagination1));

		return "hp/hp001_d001";
	}

	// 02. 공지사항 글쓰기
	@RequestMapping(value = "/hp/hp001_d001Form", method = RequestMethod.GET)
	public String boardForm(@ModelAttribute("hp001_d001VO") Hp001_d001VO hp001_d001VO, Model model) {
		return "hp/hp001_d001Form";
	}

	// 공지사항 글 저장하는 부분
	@RequestMapping(value = "/hp/saveBoard1", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("hp001_d001VO") Hp001_d001VO hp001_d001VO,
			@RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {

		if (mode.equals("edit")) {
			hp001_d001Service.updateBoard(hp001_d001VO);
		} else {
			hp001_d001Service.insertBoard(hp001_d001VO);
		}

		return "redirect:/hp/hp001_d001";
	}

//	// 공지사항 상세글 보기
//	@RequestMapping(value = "/hp/getBoardContent1", method = RequestMethod.GET)
//	public String getBoardContent(Model model, @RequestParam("article_no") int article_no) throws Exception {
//		model.addAttribute("hp001_d001Content", hp001_d001Service.getBoardContent(article_no));
//		return "hp/hp001_d001Content";
//	}
	
	// 상세글 및 댓글리스트 	
	
    @RequestMapping(value="/hp/getBoardContent1", method = RequestMethod.GET)
    public String getBoardContent(Model model, @RequestParam("article_no") int bid) throws Exception {
    	model.addAttribute("hp001_d001Content",hp001_d001Service.getBoardContent(bid));
    	model.addAttribute("reply1VO", new Reply1VO());
    	return "hp/hp001_d001Content";
    }

	// 공지사항 게시글 삭제
	@RequestMapping(value = "/hp/deleteBoard1", method = RequestMethod.GET)
	public String deleteBoard(RedirectAttributes rttr, @RequestParam("article_no") int article_no) throws Exception {
		hp001_d001Service.deleteBoard(article_no);
		return "redirect:/hp/hp001_d001";
	}

	// 공지사항 게시글 수정
	@RequestMapping(value = "/hp/editForm1", method = RequestMethod.GET)
	public String editForm(@RequestParam("article_no") int article_no
			, @RequestParam("mode") String mode, Model model)
			throws Exception {

		model.addAttribute("hp001_d001Content", hp001_d001Service.getBoardContent(article_no));
		model.addAttribute("mode", mode);
		model.addAttribute("hp001_d001VO", new Hp001_d001VO());

		return "hp/hp001_d001Form";
	}
	
	
}
