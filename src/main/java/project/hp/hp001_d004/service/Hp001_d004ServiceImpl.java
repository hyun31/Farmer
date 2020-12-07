package project.hp.hp001_d004.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.hp.hp001_d004.common.Pagination;
import project.hp.hp001_d004.dao.Hp001_d004DAO;
import project.hp.hp001_d004.vo.Hp001_d004VO;
import project.hp.hp001_d004.vo.Reply4VO;

@Service
public class Hp001_d004ServiceImpl implements Hp001_d004Service{

	@Inject
	private Hp001_d004DAO hp001_d004DAO ;
	
	@Override // 조회 
	public List<Hp001_d004VO> getBoardList(Pagination pagination) throws Exception {
		System.out.println("==============>> Service");
		return hp001_d004DAO.getBoardList(pagination);
	}
	
	@Override // 작성 
	public void insertBoard(Hp001_d004VO hp001_d004VO) throws Exception {
		hp001_d004DAO.insertBoard(hp001_d004VO);
	}

	@Transactional
	@Override // 상세글
	public Hp001_d004VO getBoardContent(int article_no) throws Exception {
		Hp001_d004VO Hp001_d004VO = new Hp001_d004VO();
		
		hp001_d004DAO.updateViewCnt(article_no);
		Hp001_d004VO = hp001_d004DAO.getBoardContent(article_no);
		return Hp001_d004VO;
	}

	@Override // 삭제
	public void deleteBoard(int article_no) throws Exception {
		hp001_d004DAO.deleteBoard(article_no);
	}

	@Override // 수정 
	public void updateBoard(Hp001_d004VO hp001_d004VO) throws Exception {
		hp001_d004DAO.updateBoard(hp001_d004VO);
		
	}

	@Override // 총 게시글 개수 확인
	public int getBoardListCnt() throws Exception {
		return hp001_d004DAO.getBoardListCnt();
	}

	@Override
	public List<Reply4VO> getReplyList(int bid) throws Exception {
		return hp001_d004DAO.getReplyList(bid);
	}

	@Override
	public int saveReply(Reply4VO reply4vo) throws Exception {
		return hp001_d004DAO.saveReply(reply4vo);
	}

	@Override
	public int updateReply(Reply4VO reply4vo) throws Exception {
		return hp001_d004DAO.updateReply(reply4vo);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return hp001_d004DAO.deleteReply(rid);
	}

	

	


}
