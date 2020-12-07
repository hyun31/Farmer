package project.hp.hp001_d006.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import project.hp.hp001_d006.common.Pagination6;
import project.hp.hp001_d006.vo.Hp001_d006VO;
import project.hp.hp001_d006.vo.Reply6VO;

@Repository
public class Hp001_d006DAOImpl implements Hp001_d006DAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Hp001_d006VO> getBoardList(Pagination6 pagination6) throws Exception {
		return sqlSession.selectList("hp001_d006.getBoardList", pagination6);
	}

	@Override
	public Hp001_d006VO getBoardContent(int article_no) throws Exception {
		return sqlSession.selectOne("hp001_d006.getBoardContent", article_no);
	}

	@Override
	public int insertBoard(Hp001_d006VO hp001_d006VO) throws Exception {
		return sqlSession.insert("hp001_d006.insertBoard", hp001_d006VO);
	}

	@Override
	public int deleteBoard(int article_no) throws Exception {
		return sqlSession.delete("hp001_d006.deleteBoard", article_no);
	}

	@Override
	public int updateBoard(Hp001_d006VO hp001_d006VO) throws Exception {
		return sqlSession.update("hp001_d006.updateBoard", hp001_d006VO);
	}

	@Override
	public int updateViewCnt(int article_no) throws Exception {
		return sqlSession.update("hp001_d006.updateViewCnt", article_no);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return sqlSession.selectOne("hp001_d006.getBoardListCnt");
	}

	@Override
	public List<Reply6VO> getReplyList(int bid) throws Exception {
		return sqlSession.selectList("hp001_d006.getReplyList", bid);
	}

	@Override
	public int saveReply(Reply6VO reply6vo) throws Exception {
		return sqlSession.insert("hp001_d006.saveReply", reply6vo);
	}

	@Override
	public int updateReply(Reply6VO reply6vo) throws Exception {
		return sqlSession.update("hp001_d006.updateReply", reply6vo);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return sqlSession.delete("hp001_d006.deleteReply", rid);
	}

}
