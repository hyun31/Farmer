package project.hp.hp001_d001.service;

import java.util.List;

import project.hp.hp001_d001.common.Pagination1;
import project.hp.hp001_d001.vo.Hp001_d001VO;
import project.hp.hp001_d001.vo.Reply1VO;

public interface Hp001_d001Service {
	// 01.게시물 조회
	public List<Hp001_d001VO> getBoardList(Pagination1 pagination1) throws Exception;

	// 02.글쓰기
	public void insertBoard(Hp001_d001VO hp001_d001VO) throws Exception;

	// 03.상세글 보기
	public Hp001_d001VO getBoardContent(int article_no) throws Exception;

	// 04.게시글 삭제
	public void deleteBoard(int article_no) throws Exception;

	// 05.게시글 수정
	public void updateBoard(Hp001_d001VO hp001_d001VO) throws Exception;

	// 06.총 게시글 개수 확인
	public int getBoardListCnt() throws Exception;

	// 07. 댓글리스트
	public List<Reply1VO> getReplyList(int bid) throws Exception;

	public int saveReply(Reply1VO reply1vo) throws Exception;

	public int updateReply(Reply1VO reply1vo) throws Exception;

	public int deleteReply(int rid) throws Exception;
}
