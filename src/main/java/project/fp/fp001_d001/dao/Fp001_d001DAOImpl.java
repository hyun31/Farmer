package project.fp.fp001_d001.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.fp.fp001_d001.vo.Fp001_d001VO;
import project.utils.paging.PagingVO;

@Repository("fp001_d001DAO")
public class Fp001_d001DAOImpl implements Fp001_d001DAO {
	@Autowired
	private SqlSession sqlSession;

	//게시판목록
	@Override
	public List<Fp001_d001VO> listArticles(PagingVO vo) throws DataAccessException {
		List<Fp001_d001VO> list = sqlSession.selectList("fp.fp001_d001.listArticles", vo);
		return list;
	}
	// 글쓰기 진입
	@Override
	public void writeArticles(Map<String, Object> map) throws DataAccessException {
		sqlSession.insert("fp001_d001DAO.writeArticles", map);
	}
	// 글쓰기 저장
	@Override
	public void articlesInsert(Fp001_d001VO vo) throws DataAccessException {
		sqlSession.insert("fp.fp001_d001.articlesInsert", vo);
	}
	
	// 글쓰기 보기
	@Override
	public Fp001_d001VO viewArticles(int article_no) throws DataAccessException {
		Fp001_d001VO vo = sqlSession.selectOne("fp.fp001_d001.viewArticles", article_no);
//		System.out.println(vo);
		return vo;
	}
	
	// 글 삭제
	@Override
	public void deleteArticles(int article_no) throws DataAccessException {
		sqlSession.delete("fp.fp001_d001.deleteArticles", article_no);
	}
	
	// 글 수정
	@Override
	public void updateArticles(Fp001_d001VO vo) throws DataAccessException {
		sqlSession.update("fp.fp001_d001.updateArticles", vo);
	}
	
	// 글 조회수
	@Override
	public void articlesReadcnt(int article_no) throws DataAccessException {
		sqlSession.update("fp.fp001_d001.articlesReadcnt", article_no);
	}
	
	// 총 게시글 수
	public int countBoard(String board_cd) throws DataAccessException {
		int result = (int)sqlSession.selectOne("fp.fp001_d001.listArticlesCount", board_cd);
		return result;
		
	}
	
	// 디비 글 내용
	@Override
	public Fp001_d001VO contentArticles(int article_no) throws DataAccessException {
		Fp001_d001VO content = sqlSession.selectOne("fp.fp001_d001.contentArticles", article_no);
		System.out.println("dao::" + content);
		return content;
	}	
	
	// 채팅방 번호 가져오기
	@Override
	public String getRoomId(HashMap<String,String> map) throws DataAccessException {
		return sqlSession.selectOne("fp.fp001_d001.roomId", map);
	};
	// 채팅방 만들고 채팅방 번호 가져오기
	@Override
	public void makeChatroom(HashMap<String, String> map) throws DataAccessException {
		sqlSession.insert("fp.fp001_d001.makeChatroom", map);
	}
	// 메시지 저장하기
	@Override
	public void saveMessage(HashMap<String, String> map) throws DataAccessException {
		sqlSession.insert("fp.fp001_d001.saveMessage", map);
	}
	// 메시지 가져오기
	@Override
	public List<HashMap<String, String>> selectMsg(String room_id) throws DataAccessException {
		return sqlSession.selectList("fp.fp001_d001.selectMsg", room_id);
	}
	// 채팅방 목록 가져오기
	@Override
	public List<HashMap<String, String>> chatList(String user_id) throws DataAccessException {
		return sqlSession.selectList("fp.fp001_d001.chatList", user_id);
	}
	// 채팅방 참가자 가져오기
	@Override
	public HashMap<String, String> chatUserList(String room_id) throws DataAccessException {
		return sqlSession.selectOne("fp.fp001_d001.chatUserList", room_id);
	}
	@Override
	public String userName(String writer_id) throws DataAccessException {
		return sqlSession.selectOne("fp.fp001_d001.userName", writer_id);
	}
	
	// 첨부파일
	@Override
	public void fileUpload(HashMap<String, Object> map) throws DataAccessException {
		sqlSession.insert("fp.fp001_d001.fileUpload", map);
	}
	
	// 첨부파일 업데이트
	@Override
	public void fileUpdate(HashMap<String, Object> map) throws DataAccessException {
		sqlSession.update("fp.fp001_d001.fileUpdate", map);
	}
	
}
