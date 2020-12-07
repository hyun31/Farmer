package project.hp.hp001_d006.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.hp.hp001_d006.common.Pagination6;
import project.hp.hp001_d006.dao.Hp001_d006DAO;
import project.hp.hp001_d006.vo.Hp001_d006VO;
import project.hp.hp001_d006.vo.Reply6VO;

@Service
public class Hp001_d006ServiceImpl implements Hp001_d006Service{

	@Inject
	private Hp001_d006DAO hp001_d006DAO;
	
	@Override
	public List<Hp001_d006VO> getBoardList(Pagination6 pagination6) throws Exception {
		System.out.println("=======>> 자주하는질문 Service");
		return hp001_d006DAO.getBoardList(pagination6);
	}

	@Override
	public void insertBoard(Hp001_d006VO hp001_d006VO) throws Exception {
		hp001_d006DAO.insertBoard(hp001_d006VO);
	}

	@Transactional
	@Override
	public Hp001_d006VO getBoardContent(int article_no) throws Exception {
		Hp001_d006VO hp001_d006VO = new Hp001_d006VO();
		hp001_d006DAO.updateViewCnt(article_no);
		hp001_d006VO = hp001_d006DAO.getBoardContent(article_no);
		return hp001_d006VO;
	}

	@Override
	public void deleteBoard(int article_no) throws Exception {
		hp001_d006DAO.deleteBoard(article_no);
	}

	@Override
	public void updateBoard(Hp001_d006VO hp001_d006VO) throws Exception {
		hp001_d006DAO.updateBoard(hp001_d006VO);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return hp001_d006DAO.getBoardListCnt();
	}

	@Override
	public List<Reply6VO> getReplyList(int bid) throws Exception {
		return hp001_d006DAO.getReplyList(bid);
	}

	@Override
	public int saveReply(Reply6VO reply6vo) throws Exception {
		return hp001_d006DAO.saveReply(reply6vo);
	}

	@Override
	public int updateReply(Reply6VO reply6vo) throws Exception {
		return hp001_d006DAO.updateReply(reply6vo);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return hp001_d006DAO.deleteReply(rid);
	}

}
