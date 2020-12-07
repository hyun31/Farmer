package project.hp.hp001_d004.service;

import java.util.List;

import project.hp.hp001_d004.common.Pagination;
import project.hp.hp001_d004.vo.Hp001_d004VO;
import project.hp.hp001_d004.vo.Reply4VO;

public interface Hp001_d004Service {
	// 01.게시물 조회
	// 원하는 페이지 리스트를 읽어 올 수 있도록 게시판의 페이지정보를 가지고 있는 Pagination 객체를 받을 수 있도록 수정
	public List<Hp001_d004VO> getBoardList(Pagination pagination) throws Exception;

	// 02.글쓰기
	public void insertBoard(Hp001_d004VO hp001_d004VO) throws Exception;

	// 03.상세글 보기
	public Hp001_d004VO getBoardContent(int article_no) throws Exception;

	// 04.게시글 삭제
	public void deleteBoard(int article_no) throws Exception;

	// 05.게시글 수정
	public void updateBoard(Hp001_d004VO hp001_d004VO) throws Exception;

	// 06.총 게시글 개수 확인
	public int getBoardListCnt() throws Exception;

	// 07. 댓글리스트
	public List<Reply4VO> getReplyList(int bid) throws Exception;

	public int saveReply(Reply4VO reply4vo) throws Exception;

	public int updateReply(Reply4VO reply4vo) throws Exception;

	public int deleteReply(int rid) throws Exception;

}
