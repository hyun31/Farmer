package project.ep.ep001_d002.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
public class Ep001_d002DAOImpl implements Ep001_d002DAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws DataAccessException {
		return sqlSession.selectList("ep.ep001_d002.selectGardenList", map);
	}
}	
