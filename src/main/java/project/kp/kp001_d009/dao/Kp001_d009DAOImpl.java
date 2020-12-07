package project.kp.kp001_d009.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class Kp001_d009DAOImpl implements Kp001_d009DAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertFarm(HashMap<String, Object> map) throws DataAccessException {
		sqlSession.insert("kp.kp001_d009.insertFarm", map);
	}
	
	@Override
	public List<HashMap<String, String>> selectFarms() throws DataAccessException {
		return sqlSession.selectList("kp.kp001_d009.selectFarms");
	}
}
