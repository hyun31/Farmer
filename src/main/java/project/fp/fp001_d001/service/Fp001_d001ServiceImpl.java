package project.fp.fp001_d001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import project.fp.fp001_d001.dao.Fp001_d001DAO;
import project.fp.fp001_d001.vo.Fp001_d001VO;
import project.utils.file.FileUtils;
import project.utils.paging.PagingVO;

@Service("fp001_d001Service")
public class Fp001_d001ServiceImpl implements Fp001_d001Service{
	@Autowired
	private Fp001_d001DAO fp001_d001DAO;
	@Autowired
	FileUtils fileUtils;
	
	// 총 게시글 수
	@Override
	public int countBoard(String board_cd) {
		return fp001_d001DAO.countBoard(board_cd); 
	}
	// 게시글 목록 불러오기
	@Override
	public List<Fp001_d001VO> listArticles(PagingVO vo) throws Exception {
		return fp001_d001DAO.listArticles(vo);
	}
	// 게시물 글작성 이동
	@Override
	public void writeArticles(Map<String, Object> map) throws Exception {
		fp001_d001DAO.writeArticles(map);
	}

	// 게시물 글 쓰기
	@Override
	public void articlesInsert(Fp001_d001VO vo, MultipartFile[] file, String path) throws Exception {
//		System.out.println("service.article_nm : " + vo.getArticle_nm());
//		System.out.println("service.article_content : " + vo.getArticle_content());
		fp001_d001DAO.articlesInsert(vo);
		System.out.println(vo.getArticle_no());
		
		// 파일첨부
		
		List<Map<String, Object>> fileList = fileUtils.parseFileInfo(file, path);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("original_nm", fileList.get(0).get("ORG_FILE_NAME"));
		map.put("stored_nm", fileList.get(0).get("SAVE_FILE_NAME"));
		map.put("file_size", fileList.get(0).get("FILE_SIZE"));
		
		map.put("board_cd", vo.getBoard_cd());
		map.put("article_no", vo.getArticle_no());
		
		fp001_d001DAO.fileUpload(map);
	}
	
	// 글보기, 조회수
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Fp001_d001VO viewArticles(int article_no) throws Exception {
		Fp001_d001VO vo = fp001_d001DAO.viewArticles(article_no);
		fp001_d001DAO.articlesReadcnt(article_no);
		return vo;
	}
	
	// 글삭제
	@Override
	public void deleteArticles(int article_no) throws Exception {
		fp001_d001DAO.deleteArticles(article_no);
	}
	
	// 글수정
	@Override
	public void updateArticles(Fp001_d001VO vo, MultipartFile[] file, String path) throws Exception {
		fp001_d001DAO.updateArticles(vo);
		
	// 파일첨부
		List<Map<String, Object>> fileList = fileUtils.parseFileInfo(file, path);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("original_nm", fileList.get(0).get("ORG_FILE_NAME"));
		map.put("stored_nm", fileList.get(0).get("SAVE_FILE_NAME"));
		map.put("file_size", fileList.get(0).get("FILE_SIZE"));
		
		map.put("article_no", vo.getArticle_no());
		fp001_d001DAO.fileUpdate(map);
}
	
	// content
	@Override
	public Fp001_d001VO contentArticles(int article_no) throws Exception {
		Fp001_d001VO content = fp001_d001DAO.contentArticles(article_no);
		return content;
	}
	
	// 방번호 가져오기
	@Override
	public HashMap<String, String> getChatInfo(String writer_id, String user_id) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("writer_id", writer_id);
		map.put("user_id", user_id);
		map.put("opponent", fp001_d001DAO.userName(writer_id));
		String roomId = fp001_d001DAO.getRoomId(map);
		if(roomId != null) {
			map.put("ROOM_ID", roomId);
			return map;
		} else {
			fp001_d001DAO.makeChatroom(map);
		}
		return map;
	}
	// 메시지 저장하기
	@Override
	public void saveMessage(HashMap<String, String> map) throws Exception {
		fp001_d001DAO.saveMessage(map);
	}
	// 메시지 가져오기
	@Override
	public List<HashMap<String, String>> selectMsg(String room_id) throws Exception {
		return fp001_d001DAO.selectMsg(room_id);
	}
	// 채팅방목록 가져오기
	@Override
	public List<HashMap<String, String>> chatList(String user_id) throws Exception {
		return fp001_d001DAO.chatList(user_id);
	}
	// 채팅방 참가자 가져오기
	@Override
	public HashMap<String, String> chatUserList(String room_id) throws Exception {
		return fp001_d001DAO.chatUserList(room_id);
	}
}
