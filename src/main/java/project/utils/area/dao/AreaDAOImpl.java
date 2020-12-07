package project.utils.area.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class AreaDAOImpl implements AreaDAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HashMap<String, String>> selectArea(String area_group) throws DataAccessException {
		return sqlSession.selectList("area.selectArea", area_group);
	}
}
