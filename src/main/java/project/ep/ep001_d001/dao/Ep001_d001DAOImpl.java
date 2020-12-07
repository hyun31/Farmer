package project.ep.ep001_d001.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class Ep001_d001DAOImpl implements Ep001_d001DAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> selectFarmList(HashMap<String, String> map) throws DataAccessException {
		return sqlSession.selectList("ep.ep001_d001.selectFarmList", map);
	}
	@Override
	public HashMap<String, String> selectFarmInfo(String farm_no) throws DataAccessException {
		return sqlSession.selectOne("ep.ep001_d001.selectFarmInfo", farm_no);
	}
}
