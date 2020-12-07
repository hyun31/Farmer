package project.hp.hp001_d003.service;

import java.util.List;

import project.hp.hp001_d003.vo.Reply3VO;
import project.hp.hp001_d003.common.Pagination3;
import project.hp.hp001_d003.vo.Hp001_d003VO;

public interface Hp001_d003Service {

	// 01.게시물 조회
	public List<Hp001_d003VO> getBoardList(Pagination3 pagination3) throws Exception;

	// 02.글쓰기
	public void insertBoard(Hp001_d003VO hp001_d003VO) throws Exception;

	// 03.상세글 보기
	public Hp001_d003VO getBoardContent(int article_no) throws Exception;

	// 04.게시글 삭제
	public void deleteBoard(int article_no) throws Exception;

	// 05.게시글 수정
	public void updateBoard(Hp001_d003VO hp001_d003VO) throws Exception;

	// 06.총 게시글 개수 확인
	public int getBoardListCnt() throws Exception;

	// 07. 댓글리스트
	public List<Reply3VO> getReplyList(int bid) throws Exception;

	public int saveReply(Reply3VO reply3vo) throws Exception;

	public int updateReply(Reply3VO reply3vo) throws Exception;

	public int deleteReply(int rid) throws Exception;
}