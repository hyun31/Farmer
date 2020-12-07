package project.hp.hp001_d002.service;

import java.util.List;

import project.hp.hp001_d002.vo.Reply2VO;
import project.hp.hp001_d002.common.Pagination2;
import project.hp.hp001_d002.vo.Hp001_d002VO;

public interface Hp001_d002Service {
	// 01.농장등록문의 조회
	public List<Hp001_d002VO> getBoardList(Pagination2 pagination2) throws Exception;

	// 02.농장등록문의 글쓰기
	public void insertBoard(Hp001_d002VO hp001_d002VO) throws Exception;

	// 03.농장등록문의 상세글 보기
	public Hp001_d002VO getBoardContent(int article_no) throws Exception;

	// 04.농장등록문의 게시글 삭제
	public void deleteBoard(int article_no) throws Exception;

	// 05.농장등록문의 게시글 수정
	public void updateBoard(Hp001_d002VO hp001_d002VO) throws Exception;

	// 06.농장등록문의 총 게시글 개수 확인
	public int getBoardListCnt() throws Exception;

	// 07. 댓글리스트
	public List<Reply2VO> getReplyList(int bid) throws Exception;

	public int saveReply(Reply2VO reply2vo) throws Exception;

	public int updateReply(Reply2VO reply2vo) throws Exception;

	public int deleteReply(int rid) throws Exception;
}
