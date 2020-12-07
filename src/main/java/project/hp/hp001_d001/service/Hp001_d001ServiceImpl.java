package project.hp.hp001_d001.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import project.hp.hp001_d001.common.Pagination1;
import project.hp.hp001_d001.dao.Hp001_d001DAO;
import project.hp.hp001_d001.vo.Hp001_d001VO;
import project.hp.hp001_d001.vo.Reply1VO;

@Service
public class Hp001_d001ServiceImpl implements Hp001_d001Service {

	@Inject
	private Hp001_d001DAO hp001_d001DAO;

	@Override // 공지사항 조회
	public List<Hp001_d001VO> getBoardList(Pagination1 pagination1) throws Exception {
		System.out.println("========>> 공지사항 Service");
		return hp001_d001DAO.getBoardList(pagination1);
	}

	@Override // 공지사항 작성
	public void insertBoard(Hp001_d001VO hp001_d001VO) throws Exception {
		hp001_d001DAO.insertBoard(hp001_d001VO);

	}

	@Override // 공지사항 상세글 보기
	public Hp001_d001VO getBoardContent(int article_no) throws Exception {
		Hp001_d001VO hp001_d001VO = new Hp001_d001VO();
		hp001_d001VO = hp001_d001DAO.getBoardContent(article_no);
		return hp001_d001VO;
	}

	@Override // 공지사항 글 삭제
	public void deleteBoard(int article_no) throws Exception {
		hp001_d001DAO.deleteBoard(article_no);
	}

	@Override // 공지사항 글 수정
	public void updateBoard(Hp001_d001VO hp001_d001VO) throws Exception {
		hp001_d001DAO.updateBoard(hp001_d001VO);
	}

	@Override // 총 게시글 개수 확인
	public int getBoardListCnt() throws Exception {
		return hp001_d001DAO.getBoardListCnt();
	}

	@Override // 댓글 리스트
	public List<Reply1VO> getReplyList(int bid) throws Exception {
		return hp001_d001DAO.getReplyList(bid);
	}

	@Override // 저장
	public int saveReply(Reply1VO reply1vo) throws Exception {
		return hp001_d001DAO.saveReply(reply1vo);
	}

	@Override // 수정
	public int updateReply(Reply1VO reply1vo) throws Exception {
		return hp001_d001DAO.updateReply(reply1vo);
	}

	@Override // 삭제
	public int deleteReply(int rid) throws Exception {
		return hp001_d001DAO.deleteReply(rid);
	}

}
