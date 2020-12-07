package project.hp.hp001_d003.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import project.hp.hp001_d003.common.Pagination3;
import project.hp.hp001_d003.vo.Hp001_d003VO;
import project.hp.hp001_d003.vo.Reply3VO;

@Repository
public class Hp001_d003DAOImpl implements Hp001_d003DAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Hp001_d003VO> getBoardList(Pagination3 pagination3) throws Exception {
		return sqlSession.selectList("hp001_d003.getBoardList", pagination3);
	}

	@Override
	public Hp001_d003VO getBoardContent(int article_no) throws Exception {
		return sqlSession.selectOne("hp001_d003.getBoardContent", article_no);
	}

	@Override
	public int insertBoard(Hp001_d003VO hp001_d003VO) throws Exception {
		return sqlSession.insert("hp001_d003.insertBoard", hp001_d003VO);
	}

	@Override
	public int deleteBoard(int article_no) throws Exception {
		return sqlSession.delete("hp001_d003.deleteBoard", article_no);
	}

	@Override
	public int updateBoard(Hp001_d003VO hp001_d003VO) throws Exception {
		return sqlSession.update("hp001_d003.updateBoard", hp001_d003VO);
	}

	@Override
	public int updateViewCnt(int article_no) throws Exception {
		return sqlSession.update("hp001_d003.updateViewCnt", article_no);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return sqlSession.selectOne("hp001_d003.getBoardListCnt");
	}

	@Override
	public List<Reply3VO> getReplyList(int bid) throws Exception {
		return sqlSession.selectList("hp001_d003.getReplyList", bid);
	}

	@Override
	public int saveReply(Reply3VO reply3VO) throws Exception {
		return sqlSession.insert("hp001_d003.saveReply", reply3VO);
	}

	@Override
	public int updateReply(Reply3VO reply3vo) throws Exception {
		return sqlSession.update("hp001_d003.updateReply", reply3vo);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return sqlSession.delete("hp001_d003.deleteReply", rid);
	}

}