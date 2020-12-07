package project.hp.hp001_d002.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.hp.hp001_d002.common.Pagination2;
import project.hp.hp001_d002.dao.Hp001_d002DAO;
import project.hp.hp001_d002.vo.Hp001_d002VO;
import project.hp.hp001_d002.vo.Reply2VO;

@Service
public class Hp001_d002ServiceImpl implements Hp001_d002Service{

	@Inject
	private Hp001_d002DAO hp001_d002DAO;
	
	@Override
	public List<Hp001_d002VO> getBoardList(Pagination2 pagination2) throws Exception {
		return hp001_d002DAO.getBoardList(pagination2);
	}

	@Override
	public void insertBoard(Hp001_d002VO hp001_d002VO) throws Exception {
		hp001_d002DAO.insertBoard(hp001_d002VO);
	}

	@Transactional
	@Override
	public Hp001_d002VO getBoardContent(int article_no) throws Exception {
		Hp001_d002VO hp001_d002VO = new Hp001_d002VO();
		
		hp001_d002DAO.updateViewCnt(article_no);
		hp001_d002VO = hp001_d002DAO.getBoardContent(article_no);
		return hp001_d002VO;
	}

	@Override
	public void deleteBoard(int article_no) throws Exception {
		hp001_d002DAO.deleteBoard(article_no);
	}

	@Override
	public void updateBoard(Hp001_d002VO hp001_d002VO) throws Exception {
		hp001_d002DAO.updateBoard(hp001_d002VO);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return hp001_d002DAO.getBoardListCnt();
	}

	@Override
	public List<Reply2VO> getReplyList(int bid) throws Exception {
		// TODO Auto-generated method stub
		return hp001_d002DAO.getReplyList(bid);
	}

	@Override
	public int saveReply(Reply2VO reply2vo) throws Exception {
		return hp001_d002DAO.saveReply(reply2vo);
	}

	@Override
	public int updateReply(Reply2VO reply2vo) throws Exception {
		return hp001_d002DAO.updateReply(reply2vo);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return hp001_d002DAO.deleteReply(rid);
	}

}
