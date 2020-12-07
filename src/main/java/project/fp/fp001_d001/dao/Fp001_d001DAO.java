package project.fp.fp001_d001.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.fp.fp001_d001.vo.Fp001_d001VO;
import project.utils.paging.PagingVO;

public interface Fp001_d001DAO {
	// 게시물 리스트 조회
	public List<Fp001_d001VO> listArticles(PagingVO vo) throws DataAccessException;
	// 게시글 글쓰기 이동
	public void writeArticles(Map<String,Object> map) throws DataAccessException;
	// 게시글 글쓰기 추가
	public void articlesInsert(Fp001_d001VO vo) throws DataAccessException;
	// 게시물 보기
	public Fp001_d001VO viewArticles(int article_no) throws DataAccessException;
	// 게시물 수정
	public void updateArticles(Fp001_d001VO vo) throws DataAccessException;
	// 게시물 삭제
	public void deleteArticles(int article_no) throws DataAccessException;
	// 게시물 조회수
	public void articlesReadcnt(int article_no) throws DataAccessException;
	// 총 게시글 수
	public int countBoard(String board_cd) throws DataAccessException;
	// 디비 게시글
	public Fp001_d001VO contentArticles(int article_no) throws DataAccessException;
	// 알림사항 목록
	
	// 채팅방 번호 가져오기
	public String getRoomId(HashMap<String, String> map) throws DataAccessException;
	// 채팅방 만들기
	public void makeChatroom(HashMap<String, String> map) throws DataAccessException;
	// 메시지 저장하기
	public void saveMessage(HashMap<String, String> map) throws DataAccessException;
	// 메시지 가져오기
	public List<HashMap<String, String>> selectMsg(String room_id) throws DataAccessException;
	// 채팅방 목록 가져오기
	public List<HashMap<String, String>> chatList(String user_id) throws DataAccessException;
	// 채팅방 참가자 가져오기
	public HashMap<String, String> chatUserList(String room_id) throws DataAccessException;
	// 상대방 이름 가져오기
	public String userName(String writer_id) throws DataAccessException;
	
	// 첨부파일
	public void fileUpload(HashMap<String, Object> map) throws DataAccessException;
	// 첨부파일 업데이트
	public void fileUpdate(HashMap<String, Object> map) throws DataAccessException;
}
