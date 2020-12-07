package project.fp.fp001_d001.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import project.fp.fp001_d001.service.Fp001_d001Service;
import project.fp.fp001_d001.vo.Fp001_d001VO;
import project.standardCode.service.StandardCodeService;
import project.standardCode.vo.StandardCodeVO;
import project.utils.file.FileUtils;

@Controller
public class Fp001_d001ControllerImpl implements Fp001_d001Controller {
	@Autowired
	Fp001_d001Service fp001_d001Service;

	@Autowired
	StandardCodeService standardCodeService;
	
	@Autowired
	ServletContext context;

	@Autowired
	FileUtils fileUtils;
	
	// 장터 목록가져오기
	@Override
	@RequestMapping(value = "/fp/fp001_d001/articlesInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView articlesInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("fp/fp001_d001_dlist"); 

		// 페이징
		int nowPage = 1; // 현재 페이지 1로 시작
		int cntPerPage = 15; // 페이지당 글 갯수 10개로 시작

		if (request.getParameter("nowPage") != null) {
			System.out.println("request.getParameter(\"nowPage\") : " + request.getParameter("nowPage"));
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		if (request.getParameter("cntPerPage") != null) {
			cntPerPage = Integer.parseInt(request.getParameter("cntPerPage"));
		}

		String board_cd = request.getParameter("board_cd");
		int total = fp001_d001Service.countBoard(board_cd);// 게시물 총 개수
		Fp001_d001VO vo = new Fp001_d001VO(total, nowPage, cntPerPage);
		// 검색할 때는 없는거 하나 만들어서 위에처럼 하면 됨.

		vo.setBoard_cd(board_cd);

		List<Fp001_d001VO> listArticles = fp001_d001Service.listArticles(vo);

		List<StandardCodeVO> boardList = standardCodeService.selectCodeList("016");
		String title_nm = "";
		for (StandardCodeVO tmpVO : boardList) {
			if (tmpVO.getCode_id().equals(board_cd)) {
				title_nm = tmpVO.getCode_nm();
			}
		}
		HttpSession session = request.getSession();
		Map<String, String> user = (Map<String, String>) session.getAttribute("user");
		mav.addObject("paging", vo);
		mav.addObject("listArticles", listArticles);
		mav.addObject("title_nm", title_nm);
		mav.addObject("board_cd", board_cd);
		mav.addObject("session_user", user);

		return mav;
	}

	// 장터 - 작성페이지 이동 (write)
	@Override
	@RequestMapping(value = "/fp/fp001_d001/articlesWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView articlesWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("fp/fp001_d001_write");
		List<StandardCodeVO> boardList = standardCodeService.selectCodeList("016");
		List<StandardCodeVO> cityList = standardCodeService.selectCodeList("020");
		List<StandardCodeVO> transList = standardCodeService.selectCodeList("017");
		String board_cd = request.getParameter("board_cd");
		
		mav.addObject("boardList", boardList);
		mav.addObject("cityList", cityList);
		mav.addObject("transList", transList);
		mav.addObject("board_cd", board_cd);

		return mav;
	}

	// 장터 게시글 등록 (Redirect)
	@Override
	@RequestMapping(value = "/fp/fp001_d001/articlesInsert.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String articlesInsert(HttpServletRequest request, HttpServletResponse response, MultipartFile[] file) throws Exception {
		Fp001_d001VO vo = new Fp001_d001VO();
		vo.setArticle_nm(request.getParameter("title")); // 글제목
		vo.setArticle_content(request.getParameter("description")); // 글내용
		vo.setBoard_cd(request.getParameter("board_cd"));
		vo.setLocal_no(request.getParameter("local_no"));
		vo.setTrans_no(request.getParameter("trans_no"));
		
		
		try {
			HttpSession session = request.getSession();
			Map<String, String> user = (Map<String, String>) session.getAttribute("user");

			System.out.println("게시글 등록, 글쓴이 이름 :: " + user.get("USER_ID"));
			vo.setWriter_id((String) user.get("USER_ID"));

			String path = request.getSession().getServletContext().getRealPath("/");
			
			fp001_d001Service.articlesInsert(vo, file, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/fp/fp001_d001/articlesInit.do?board_cd="+vo.getBoard_cd(); // 변수명으로 조절
	}

	// 장터 - 게시글 보기
	@Override
	@RequestMapping(value = "/fp/fp001_d001/viewArticles.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView viewArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("fp/fp001_d001_view2");
		List<StandardCodeVO> boardList = standardCodeService.selectCodeList("016");
		List<StandardCodeVO> cityList = standardCodeService.selectCodeList("020");
		List<StandardCodeVO> transList = standardCodeService.selectCodeList("017");
		
		mav.addObject("boardList", boardList);
		mav.addObject("cityList", cityList);
		mav.addObject("transList", transList);
		
		int to = Integer.parseInt(request.getParameter("article_no"));
		mav.addObject("viewArticles", fp001_d001Service.viewArticles(to));
		

		return mav;
	}

	// 장터 - 글 수정
	@Override
	@RequestMapping(value = "/fp/fp001_d001/updateView.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateView(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("fp/fp001_d001_update2");
		
		// 공통코드
		List<StandardCodeVO> boardList = standardCodeService.selectCodeList("016"); // 게시판구분
		List<StandardCodeVO> cityList = standardCodeService.selectCodeList("020"); // 지역
		List<StandardCodeVO> transList = standardCodeService.selectCodeList("017"); // 거래구분
		mav.addObject("boardList", boardList);
		mav.addObject("cityList", cityList);
		mav.addObject("transList", transList);
		
		// 글내용은 디비에서 가져옴
		int article_no = Integer.parseInt(request.getParameter("article_no"));
		Fp001_d001VO content = fp001_d001Service.contentArticles(article_no);
		mav.addObject("content", content);
		mav.addObject("article_no", article_no);
		
		// 구분, 지역, 거래방법, 제목만 가져옴 (view에서)
		
		String article_nm = request.getParameter("article_nm");
		String board_cd = request.getParameter("board_cd");
		String local_no = request.getParameter("local_no");
		String trans_no = request.getParameter("trans_no");
		
		mav.addObject("article_nm", article_nm);
		mav.addObject("board_cd", board_cd);
		mav.addObject("local_no", local_no);
		mav.addObject("trans_no", trans_no);
		
		return mav;
	}

	@RequestMapping(value = "/fp/fp001_d001/updateArticles.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateArticles(HttpServletRequest request, HttpServletResponse response, MultipartFile[] file) throws Exception {
		Fp001_d001VO vo = new Fp001_d001VO();
		vo.setArticle_nm(request.getParameter("title")); // 글제목
		vo.setArticle_content(request.getParameter("description")); // 글내용
		vo.setArticle_no(Integer.parseInt(request.getParameter("article_no")));
		vo.setBoard_cd(request.getParameter("board_cd"));
		vo.setLocal_no(request.getParameter("local_no"));
		vo.setTrans_no(request.getParameter("trans_no"));
		
		System.out.println(request.getParameter("article_no"));
		String path = request.getSession().getServletContext().getRealPath("/");
		fp001_d001Service.updateArticles(vo, file, path);
		
		return "redirect:/fp/fp001_d001/articlesInit.do?board_cd="+request.getParameter("board_cd");
	}

	// 장터 - 글 삭제
	@Override
	@RequestMapping(value = "/fp/fp001_d001/deleteArticles.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		String board_cd = request.getParameter("board_cd");
		fp001_d001Service.deleteArticles(no);
		return "redirect:/fp/fp001_d001/articlesInit.do?board_cd=" + board_cd;
	}

	// ck
	@Override
	@RequestMapping(value = "/fp/fp001_d001/ckeditorUpload.do", method = {RequestMethod.POST})
	public String ckeditorUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile[] upload) throws Exception {		
		String path = request.getSession().getServletContext().getRealPath("/");
		List<Map<String, Object>> fileList = fileUtils.parseFileInfo(upload, path);
		
		PrintWriter printWriter = response.getWriter();
		String org_filename = (String)fileList.get(0).get("ORG_FILE_NAME");
		String save_filename = (String)fileList.get(0).get("SAVE_FILE_NAME");
		
		JsonObject json = new JsonObject();
		json.addProperty("uploaded", 1);
		json.addProperty("fileName", org_filename);
		json.addProperty("url", "http://localhost:8090/devD/resources/upload/"+save_filename);
		
		printWriter.println(json);
		
		return null;
	}
	
	// 알림사항 목록보기
	@Override
	@RequestMapping(value = "/fp/fp001_d001/notifications.do", method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView notifications(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("jp/jp001_d004_list"); 
		return mav;
	}
	
	// 알림사항 글쓰기
	@Override
	@RequestMapping(value = "/fp/fp001_d001/notiWrite.do", method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView notiWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("jp/jp001_d004_write");
		return mav;
	}
	
	// 채팅!!!!!
	@Override
	@RequestMapping(value = "/fp/fp001_d001/chat.do", method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView chat(@RequestParam(required = false) String writer_id, @RequestParam(required = false) String room, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("nw/chat");
		Map<String, String> user = (Map<String, String>) session.getAttribute("user");
		String user_id = user.get("USER_ID");
		if(writer_id != null) {
			HashMap<String, String> chatinfo = fp001_d001Service.getChatInfo(writer_id, user_id);
			mav.addObject("room_id", chatinfo.get("ROOM_ID"));
			mav.addObject("opponent", chatinfo.get("opponent"));
		} else if(room != null) {
			HashMap<String, String> userList = fp001_d001Service.chatUserList(room);
			if(userList.get("USER_ID_1").equals(user_id)) {
				mav.addObject("opponent", userList.get("USER_NM_2"));
			} else if(userList.get("USER_ID_2").equals(user_id)) {
				mav.addObject("opponent", userList.get("USER_NM_1"));
			}
			mav.addObject("room_id", room);
		}
		return mav;
	}
	
	// 채팅목록
	@Override
	@RequestMapping(value = "/fp/fp001_d001/chatList.do", method = {RequestMethod.GET, RequestMethod.POST })
	public ModelAndView chatList(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("nw/fp001_d001_chatList");
		Map<String, String> user = (Map<String, String>) session.getAttribute("user");
		String user_id = user.get("USER_ID");
		List<HashMap<String, String>> chatList = fp001_d001Service.chatList(user_id);
		for(int i=0; i < chatList.size(); i++) {
			System.out.println(chatList.get(i));
			if(chatList.get(i).get("USER_ID_1").equals(user_id)) chatList.get(i).put("opponent", chatList.get(i).get("USER_NM_2"));
			else if(chatList.get(i).get("USER_ID_2").equals(user_id)) chatList.get(i).put("opponent", chatList.get(i).get("USER_NM_1"));
		}
		System.out.println(chatList);
		mav.addObject("chatList", chatList);
		return mav;
	}
}
