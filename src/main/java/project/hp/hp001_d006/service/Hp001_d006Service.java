package project.hp.hp001_d006.service;

import java.util.List;

import project.hp.hp001_d006.common.Pagination6;
import project.hp.hp001_d006.vo.Hp001_d006VO;
import project.hp.hp001_d006.vo.Reply6VO;

public interface Hp001_d006Service {
	// 01.조회
	public List<Hp001_d006VO> getBoardList(Pagination6 pagination6) throws Exception;

	// 02.쓰기
	public void insertBoard(Hp001_d006VO hp001_d006VO) throws Exception;

	// 03.보기
	public Hp001_d006VO getBoardContent(int article_no) throws Exception;

	// 04.삭제
	public void deleteBoard(int article_no) throws Exception;

	// 05.수정
	public void updateBoard(Hp001_d006VO hp001_d006VO) throws Exception;

	// 06.조회 Count
	public int getBoardListCnt() throws Exception;

	// 07. 댓글리스트
	public List<Reply6VO> getReplyList(int bid) throws Exception;

	public int saveReply(Reply6VO reply6vo) throws Exception;

	public int updateReply(Reply6VO reply6vo) throws Exception;

	public int deleteReply(int rid) throws Exception;

}
