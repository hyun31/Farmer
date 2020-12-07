package project.bp.bp001_d001.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.bp.bp001_d001.vo.Bp001_d001VO;
import project.standardCode.vo.StandardCodeVO;

@Repository("bp001_d001DAO")
public class Bp001_d001DAOImpl implements Bp001_d001DAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertUser(Bp001_d001VO vo) throws DataAccessException {
		return sqlSession.insert("bp.bp001_d001.insertUser", vo);
	}
	@Override
	public int checkId(String user_id) throws DataAccessException {
		return sqlSession.selectOne("bp.bp001_d001.checkId", user_id);
	}
}
