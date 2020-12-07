package project.hp.hp001_d006.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.hp.hp001_d006.common.Pagination6;
import project.hp.hp001_d006.service.Hp001_d006Service;
import project.hp.hp001_d006.vo.Hp001_d006VO;
import project.hp.hp001_d006.vo.Reply6VO;

@Controller // Controller 빈 생성
public class Hp001_d006Controller {

	@Inject
	Hp001_d006Service hp001_d006Service;

	// 조회
	@RequestMapping(value = "/hp/hp001_d006", method = RequestMethod.GET)
	public String getBoardList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {

		int listCnt = hp001_d006Service.getBoardListCnt();

		Pagination6 pagination6 = new Pagination6();
		pagination6.pageInfo(page, range, listCnt);

		model.addAttribute("pagination6", pagination6);
		model.addAttribute("articlesList", hp001_d006Service.getBoardList(pagination6));

		return "hp/hp001_d006";
	}

	// 쓰기
	@RequestMapping(value = "/hp/hp001_d006Form", method = RequestMethod.GET)
	public String boardForm(@ModelAttribute("hp001_d006VO") Hp001_d006VO hp001_d006VO, Model model) {
		return "hp/hp001_d006Form";
	}

	// 저장
	@RequestMapping(value = "/hp/saveBoard6", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("hp001_dd06VO") Hp001_d006VO hp001_d006VO,
			@RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {
		if (mode.equals("edit")) {
			hp001_d006Service.updateBoard(hp001_d006VO);
		} else {
			hp001_d006Service.insertBoard(hp001_d006VO);
		}
		return "redirect:/hp/hp001_d006";
	}

	// 보기
//	@RequestMapping(value = "/hp/getBoardContent6", method = RequestMethod.GET)
//	public String getBoardContent(Model model, @RequestParam("article_no") int article_no) throws Exception {
//		model.addAttribute("hp001_d006Content", hp001_d006Service.getBoardContent(article_no));
//		return "hp/hp001_d006Content";
//	}
	
	@RequestMapping(value="/hp/getBoardContent6", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("article_no") int bid) throws Exception {
		model.addAttribute("hp001_d006Content", hp001_d006Service.getBoardContent(bid));
		model.addAttribute("reply6VO", new Reply6VO());
		return "hp/hp001_d006Content";
	}

	// 삭제
	@RequestMapping(value = "/hp/deleteBoard6", method = RequestMethod.GET)
	public String deleteBoard(RedirectAttributes rttr, @RequestParam("article_no") int article_no) throws Exception {
		hp001_d006Service.deleteBoard(article_no);
		return "redirect:/hp/hp001_d006";
	}

	// 수정
	@RequestMapping(value = "hp/editForm6", method = RequestMethod.GET)
	public String editForm(@RequestParam("article_no") int article_no, @RequestParam("mode") String mode, Model model)
			throws Exception {

		model.addAttribute("hp001_d006Content", hp001_d006Service.getBoardContent(article_no));
		model.addAttribute("mode", mode);
		model.addAttribute("hp001_d006VO", new Hp001_d006VO());

		return "hp/hp001_d006Form";
	}
}
