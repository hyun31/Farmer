package project.ep.ep001_d003.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class Ep001_d003DAOImpl implements Ep001_d003DAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws DataAccessException {
		return sqlSession.selectList("ep.ep001_d003.selectFarmList", cust_id);
	}
	@Override
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws DataAccessException {
		return sqlSession.selectList("ep.ep001_d003.selectGardenList", map);
	}
	@Override
	public HashMap<String, String> selectGardenInfo(HashMap<String, String> map) throws DataAccessException {
		return sqlSession.selectOne("ep.ep001_d003.selectGardenInfo", map);
	}
}
