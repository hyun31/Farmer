package project.fp.fp001_d001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

import project.fp.fp001_d001.vo.Fp001_d001VO;
import project.utils.paging.PagingVO;

public interface Fp001_d001Service {
	// 리스트 가져오기
	public List<Fp001_d001VO> listArticles(PagingVO vo) throws Exception;
	// 글 작성하기
	public void writeArticles(Map<String, Object> map) throws Exception;
	// 글 등록하기
	public void articlesInsert(Fp001_d001VO vo, MultipartFile[] file, String path) throws Exception;
	// 글 보기, 조회수
	public Fp001_d001VO viewArticles(int article_no) throws Exception;
	// 글 삭제
	public void deleteArticles(int article_no) throws Exception;
	// 글 수정
	public void updateArticles(Fp001_d001VO vo, MultipartFile[] file, String path) throws Exception;
	// 게시물 총 갯수
	public int countBoard(String board_cd);
	// 디비 content
	public Fp001_d001VO contentArticles(int article_no) throws Exception;
	
	// 채팅방번호,상대방이름 가져오기
	public HashMap<String, String> getChatInfo(String writer_id, String user_id) throws Exception;
	// 메시지 저장하기
	public void saveMessage(HashMap<String, String> map) throws Exception;
	// 메시지 가져오기
	public List<HashMap<String, String>> selectMsg(String room_id) throws Exception;
	// 채팅방목록 가져오기
	public List<HashMap<String, String>> chatList(String user_id) throws Exception;
	// 채팅방 참가자 가져오기
	public HashMap<String, String> chatUserList(String room_id) throws Exception;
}
