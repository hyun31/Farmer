package project.hp.hp001_d002.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import project.hp.hp001_d002.common.Pagination2;
import project.hp.hp001_d002.vo.Hp001_d002VO;
import project.hp.hp001_d002.vo.Reply2VO;

@Repository
public class Hp001_d002DAOImpl implements Hp001_d002DAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<Hp001_d002VO> getBoardList(Pagination2 pagination2) throws Exception {
		return sqlSession.selectList("hp001_d002.getBoardList",pagination2);
	}

	@Override
	public Hp001_d002VO getBoardContent(int article_no) throws Exception {
		return sqlSession.selectOne("hp001_d002.getBoardContent",article_no);
	}

	@Override
	public int insertBoard(Hp001_d002VO hp001_d002VO) throws Exception {
		return sqlSession.insert("hp001_d002.insertBoard",hp001_d002VO);
	}

	@Override
	public int deleteBoard(int article_no) throws Exception {
		return sqlSession.delete("hp001_d002.deleteBoard",article_no);
	}

	@Override
	public int updateBoard(Hp001_d002VO hp001_d002VO) throws Exception {
		return sqlSession.update("hp001_d002.updateBoard",hp001_d002VO);
	}

	@Override
	public int updateViewCnt(int article_no) throws Exception {
		return sqlSession.update("hp001_d002.updateViewCnt",article_no);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return sqlSession.selectOne("hp001_d002.getBoardListCnt");
	}

	@Override
	public List<Reply2VO> getReplyList(int bid) throws Exception {
		return sqlSession.selectList("hp001_d002.getReplyList",bid);
	}

	@Override
	public int saveReply(Reply2VO reply2vo) throws Exception {
		return sqlSession.insert("hp001_d002.saveReply",reply2vo);
	}

	@Override
	public int updateReply(Reply2VO reply2vo) throws Exception {
		return sqlSession.update("hp001_d002.updateReply", reply2vo);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("hp001_d002.deleteReply",rid);
	}

}
