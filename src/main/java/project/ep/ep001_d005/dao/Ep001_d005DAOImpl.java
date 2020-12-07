package project.ep.ep001_d005.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class Ep001_d005DAOImpl implements Ep001_d005DAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws DataAccessException {
		return sqlSession.selectList("ep.ep001_d005.selectFarmList", cust_id);
	}
	@Override
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws DataAccessException {
		return sqlSession.selectList("ep.ep001_d005.selectGardenList", map);
	}
	@Override
	public String selectFarmAddress(String farm_no) throws DataAccessException {
		return sqlSession.selectOne("ep.ep001_d005.selectFarmAddress", farm_no);
	}
}
