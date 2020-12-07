package project.kp.kp001_d001.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.kp.kp001_d001.vo.Kp001_d001VO;

@Repository("kp001_d001DAO")
public class Kp001_d001DAOImpl implements Kp001_d001DAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Kp001_d001VO> selectUserList(Map<String, Object> searchMap) throws DataAccessException {
		List<Kp001_d001VO> list = sqlSession.selectList("kp.kp001_d001.selectUserList", searchMap);
		return list;
	}
	
	@Override
	public int deleteUser(String p_del_id) throws DataAccessException {
		int result = sqlSession.delete("kp.kp001_d001.deleteUser", p_del_id);
		return result;
	}
	
	@Override
	public List<HashMap<String, String>> list() throws DataAccessException {
		List<HashMap<String, String>> list = sqlSession.selectList("kp.kp001_d001.list");
		return list;
	}
}
