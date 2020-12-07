package project.hp.hp001_d004.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import project.hp.hp001_d004.common.Pagination;
import project.hp.hp001_d004.vo.Hp001_d004VO;
import project.hp.hp001_d004.vo.Reply4VO;

@Repository
public class Hp001_d004DAOImpl implements Hp001_d004DAO {

	@Inject
	private SqlSession sqlSession;

	@Override // Pagination 객체를 받을 수 있도록 수정
	public List<Hp001_d004VO> getBoardList(Pagination pagination) throws Exception {
		System.out.println("StartList:" + pagination.getStartList());
		System.out.println("listSize:" + pagination.getListSize());
		return sqlSession.selectList("hp001_d004.getBoardList", pagination);
	}

	@Override
	public Hp001_d004VO getBoardContent(int article_no) throws Exception {
		return sqlSession.selectOne("hp001_d004.getBoardContent", article_no);
	}

	@Override
	public int insertBoard(Hp001_d004VO hp001_d004VO) throws Exception {
		return sqlSession.insert("hp001_d004.insertBoard", hp001_d004VO);
	}

	@Override
	public int updateViewCnt(int article_no) throws Exception {
		return sqlSession.update("hp001_d004.updateViewCnt", article_no);
	}

	// 삭제해버려..
	@Override
	public int deleteBoard(int article_no) {
		return sqlSession.delete("hp001_d004.deleteBoard", article_no);

	}

	// 수정했다 1008 1310
	@Override
	public int updateBoard(Hp001_d004VO hp001_d004VO) throws Exception {
		return sqlSession.update("hp001_d004.updateBoard", hp001_d004VO);
	}

	@Override // 총 게시글 개수 확인
	public int getBoardListCnt() throws Exception {
		return sqlSession.selectOne("hp001_d004.getBoardListCnt");
	}

	@Override
	public List<Reply4VO> getReplyList(int bid) throws Exception {
		return sqlSession.selectList("hp001_d004.getReplyList", bid);
	}

	@Override
	public int saveReply(Reply4VO reply4vo) throws Exception {
		return sqlSession.insert("hp001_d004.saveReply", reply4vo);
	}

	@Override
	public int updateReply(Reply4VO reply4vo) throws Exception {
		return sqlSession.update("hp001_d004.updateReply", reply4vo);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return sqlSession.delete("hp001_d004.deleteReply",rid);
	}

}
