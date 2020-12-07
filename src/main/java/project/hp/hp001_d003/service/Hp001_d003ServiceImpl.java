package project.hp.hp001_d003.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.hp.hp001_d003.common.Pagination3;
import project.hp.hp001_d003.dao.Hp001_d003DAO;
import project.hp.hp001_d003.vo.Hp001_d003VO;
import project.hp.hp001_d003.vo.Reply3VO;

@Service
public class Hp001_d003ServiceImpl implements Hp001_d003Service{

	@Inject
	private Hp001_d003DAO hp001_d003DAO;
	
	// 조회
	@Override 
	public List<Hp001_d003VO> getBoardList(Pagination3 pagination5) throws Exception {
		System.out.println("========>> 분양문의 Service");
		return hp001_d003DAO.getBoardList(pagination5);
	}
	
	// 작성
	@Override
	public void insertBoard(Hp001_d003VO hp001_d003VO) throws Exception {
		hp001_d003DAO.insertBoard(hp001_d003VO);
	}

	// 상세글 보기
	@Transactional
	@Override
	public Hp001_d003VO getBoardContent(int article_no) throws Exception {
		Hp001_d003VO Hp001_d003VO = new Hp001_d003VO();
		
		hp001_d003DAO.updateViewCnt(article_no);
		Hp001_d003VO = hp001_d003DAO.getBoardContent(article_no);
		return Hp001_d003VO;
	}

	// 삭제
	@Override
	public void deleteBoard(int article_no) throws Exception {
		hp001_d003DAO.deleteBoard(article_no);
	}
	
	// 수정
	@Override
	public void updateBoard(Hp001_d003VO hp001_d003VO) throws Exception {
		hp001_d003DAO.updateBoard(hp001_d003VO);
	}

	// 총 게시글 개수 확인
	@Override
	public int getBoardListCnt() throws Exception {
		return hp001_d003DAO.getBoardListCnt();
	}

	@Override
	public List<Reply3VO> getReplyList(int bid) throws Exception {
		return hp001_d003DAO.getReplyList(bid);
	}

	@Override
	public int saveReply(Reply3VO reply3vo) throws Exception {
		return hp001_d003DAO.saveReply(reply3vo);
	}

	@Override
	public int updateReply(Reply3VO reply3vo) throws Exception {
		return hp001_d003DAO.updateReply(reply3vo);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return hp001_d003DAO.deleteReply(rid);
	}

	

}
