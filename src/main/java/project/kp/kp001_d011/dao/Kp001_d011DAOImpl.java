package project.kp.kp001_d011.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class Kp001_d011DAOImpl implements Kp001_d011DAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws DataAccessException {
		return sqlSession.selectList("kp.kp001_d011.selectGarden", map);
	}
	
	@Override
	public void insertGarden(HashMap<String, String> map) throws DataAccessException {
		sqlSession.insert("kp.kp001_d011.insertGarden", map);
	}
}
