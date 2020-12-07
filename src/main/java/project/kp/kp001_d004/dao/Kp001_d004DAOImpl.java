package project.kp.kp001_d004.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

@Component
public class Kp001_d004DAOImpl implements Kp001_d004DAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertProduct(HashMap<String, String> map) throws DataAccessException {
		sqlSession.insert("kp.kp001_d004.insertProduct", map);
	}
	
	@Override
	public List<HashMap<String, String>> selectProducts() throws DataAccessException {
		return sqlSession.selectList("kp.kp001_d004.selectProducts");
	}
}
