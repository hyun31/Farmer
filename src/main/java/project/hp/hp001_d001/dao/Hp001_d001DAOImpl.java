package project.hp.hp001_d001.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import project.hp.hp001_d001.common.Pagination1;
import project.hp.hp001_d001.vo.Hp001_d001VO;
import project.hp.hp001_d001.vo.Reply1VO;

@Repository
public class Hp001_d001DAOImpl implements Hp001_d001DAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Hp001_d001VO> getBoardList(Pagination1 pagination1) throws Exception {
		System.out.println("=======>DAOIMPL");
		return sqlSession.selectList("hp001_d001.getBoardList", pagination1);
	}

	@Override
	public Hp001_d001VO getBoardContent(int article_no) throws Exception {
		return sqlSession.selectOne("hp001_d001.getBoardContent", article_no);
	}

	@Override
	public int insertBoard(Hp001_d001VO hp001_d001VO) throws Exception {
		return sqlSession.insert("hp001_d001.insertBoard", hp001_d001VO);
	}

	@Override
	public int deleteBoard(int article_no) throws Exception {
		return sqlSession.delete("hp001_d001.deleteBoard", article_no);
	}

	@Override
	public int updateBoard(Hp001_d001VO hp001_d001VO) throws Exception {
		return sqlSession.update("hp001_d001.updateBoard", hp001_d001VO);
	}

	@Override
	public int updateViewCnt(int article_no) throws Exception {
		return sqlSession.update("hp001_d001.updateViewCnt", article_no);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return sqlSession.selectOne("hp001_d001.getBoardListCnt");
	}

	@Override // 리스트
	public List<Reply1VO> getReplyList(int bid) throws Exception {
		return sqlSession.selectList("hp001_d001.getReplyList", bid);

	}

	@Override // 저장
	public int saveReply(Reply1VO reply1vo) throws Exception {
		return sqlSession.insert("hp001_d001.saveReply", reply1vo);
	}

	@Override // 수정
	public int updateReply(Reply1VO reply1vo) throws Exception {
		return sqlSession.update("hp001_d001.updateReply", reply1vo);
	}

	@Override // 삭제
	public int deleteReply(int rid) throws Exception {
		return sqlSession.delete("hp001_d001.deleteReply",rid);
	}

}
