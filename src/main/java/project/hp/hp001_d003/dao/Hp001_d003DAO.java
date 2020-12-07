package project.hp.hp001_d003.dao;

import java.util.List;

import project.hp.hp001_d003.vo.Reply3VO;
import project.hp.hp001_d003.common.Pagination3;
import project.hp.hp001_d003.vo.Hp001_d003VO;

public interface Hp001_d003DAO {

	// 01. 조회
	public List<Hp001_d003VO> getBoardList(Pagination3 pagination3) throws Exception;

	// 02.상세글 보기
	public Hp001_d003VO getBoardContent(int article_no) throws Exception;

	// 03.글 쓰기
	public int insertBoard(Hp001_d003VO hp001_d003VO) throws Exception;

	// 04.삭제
	public int deleteBoard(int article_no) throws Exception;

	// 05.수정
	public int updateBoard(Hp001_d003VO hp001_d003VO) throws Exception;

	// 06.조회수
	public int updateViewCnt(int article_no) throws Exception;

	// 07. 총 게시글 개수 확인
	public int getBoardListCnt() throws Exception;

	// 08. 댓글 리스트
	public List<Reply3VO> getReplyList(int bid) throws Exception;

	public int saveReply(Reply3VO reply3VO) throws Exception;

	public int updateReply(Reply3VO reply3vo) throws Exception;

	public int deleteReply(int rid) throws Exception;
}