package project.jp.jp001_d001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.jp.jp001_d001.vo.Jp001_d001VO;

@Repository("jp001_d001DAO")
public class Jp001_d001DAOImpl implements Jp001_d001DAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Jp001_d001VO> selectUserList(Map<String, Object> searchMap) throws DataAccessException {
		List<Jp001_d001VO> list = sqlSession.selectList("jp.jp001_d001.selectUserList", searchMap);
		return list;
	}
	
	@Override
	public int deleteUser(String p_del_id) throws DataAccessException {
		int result = sqlSession.delete("jp.jp001_d001.deleteUser", p_del_id);
		return 0;
	}
}
