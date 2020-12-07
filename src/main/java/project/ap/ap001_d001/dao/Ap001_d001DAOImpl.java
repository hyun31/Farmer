package project.ap.ap001_d001.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Ap001_d001DAOImpl implements Ap001_d001DAO {
	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public HashMap<String, String> login(Map<String, String> searchMap) throws Exception {
		HashMap<String,String> resultMap = sqlSession.selectOne("ap.ap001_d001.login", searchMap);
		return resultMap;
	}
}
