package project.hp.hp001_d004.dao;

import java.util.List;

import project.hp.hp001_d004.common.Pagination;
import project.hp.hp001_d004.vo.Hp001_d004VO;
import project.hp.hp001_d004.vo.Reply4VO;

public interface Hp001_d004DAO {
	// 01.조회
	// 원하는 페이지 리스트를 읽어 올 수 있도록 게시판의 페이지정보를 가지고 있는 Pagination 객체를 받을 수 있도록 수정
	public List<Hp001_d004VO> getBoardList(Pagination pagination) throws Exception;
	
	// 02.상세 조회
	public Hp001_d004VO getBoardContent(int article_no) throws Exception;
	
	// 03.글 쓰기
	public int insertBoard(Hp001_d004VO hp001_d004VO) throws Exception;

	// 04.삭제
	public int deleteBoard(int article_no) throws Exception;
	
	// 05.수정
	public int updateBoard(Hp001_d004VO hp001_d004VO) throws Exception;

	// 06.조회수
	public int updateViewCnt(int article_no) throws Exception;

	// 07.총 게시글 개수 확인
	public int getBoardListCnt() throws Exception;
	
	public List<Reply4VO> getReplyList(int bid) throws Exception;

	public int saveReply(Reply4VO reply4vo) throws Exception;

	public int updateReply(Reply4VO reply4vo) throws Exception;

	public int deleteReply(int rid) throws Exception;
}
