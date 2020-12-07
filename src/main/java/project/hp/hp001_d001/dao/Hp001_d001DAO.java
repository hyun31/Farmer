package project.hp.hp001_d001.dao;

import java.util.List;

import project.hp.hp001_d001.common.Pagination1;
import project.hp.hp001_d001.vo.Hp001_d001VO;
import project.hp.hp001_d001.vo.Reply1VO;



public interface Hp001_d001DAO {
		// 01. 공지사항 조회
		public List<Hp001_d001VO> getBoardList(Pagination1 pagination1) throws Exception;
		
		// 02.공지사항 상세글 보기
		public Hp001_d001VO getBoardContent(int article_no) throws Exception;
		
		// 03.공지사항 글 쓰기
		public int insertBoard(Hp001_d001VO hp001_d001VO) throws Exception;
		
		// 04.공지사항 삭제
		public int deleteBoard(int article_no) throws Exception;
		
		// 05.공지사항 수정
		public int updateBoard(Hp001_d001VO hp001_d001VO) throws Exception;
		
		// 06.공지사항 조회수
		public int updateViewCnt(int article_no) throws Exception;
		
		// 07. 공지사항 총 게시글 개수 확인
		public int getBoardListCnt() throws Exception;
		
		// 08. 댓글 리스트
		public List<Reply1VO> getReplyList(int bid) throws Exception;
		
		public int saveReply(Reply1VO reply1vo) throws Exception;
		
		public int updateReply(Reply1VO reply1vo) throws Exception;
		
		public int deleteReply(int rid) throws Exception;
	}

