package project.hp.hp001_d007.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class Hp001_d007DAOImpl implements Hp001_d007DAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertFarm(HashMap<String, Object> map) throws DataAccessException {
		sqlSession.insert("hp.hp001_d007.insertFarm", map);
	}
	@Override
	public List<HashMap<String, String>> selectFarmApply(String farmer_id) throws DataAccessException {
		return sqlSession.selectList("hp.hp001_d007.selectFarmApply", farmer_id);
	}
	@Override
	public HashMap<String, String> selectFarmInfo(String farm_no) throws DataAccessException {
		return sqlSession.selectOne("hp.hp001_d007.selectFarmInfo", farm_no);
	}
	
	@Override
	public HashMap<String, String> selectApply(String user_id) throws DataAccessException {
		return sqlSession.selectOne("hp.hp001_d007.selectApply", user_id);
	}
}
