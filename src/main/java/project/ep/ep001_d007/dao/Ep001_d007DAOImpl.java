package project.ep.ep001_d007.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository
public class Ep001_d007DAOImpl implements Ep001_d007DAO{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public String selectSequence() throws DataAccessException {
		return sqlSession.selectOne("ep.ep001_d007.selectSequence");
	}
	
	@Override
	public void insertOrder(HashMap<String, String> map) throws DataAccessException {
		sqlSession.insert("ep.ep001_d007.insertOrder", map);
	}
	
	@Override
	public void updateStatus(String order_no) throws DataAccessException {
		sqlSession.update("ep.ep001_d007.updateStatus", order_no);
	}
	
	@Override
	public HashMap<String, String> selectOrderInfo(String order_no) throws DataAccessException {
		return sqlSession.selectOne("ep.ep001_d007.selectOrderInfo", order_no);
	}
	
	@Override
	public void updateGardenInfo(HashMap<String, String> map) throws DataAccessException {
		sqlSession.update("ep.ep001_d007.updateGarden", map);
	}
	
	@Override
	public void insertPayment(HashMap<String, String> map) throws DataAccessException {
		sqlSession.insert("ep.ep001_d007.insertPayment", map);
	}
	
	@Override
	public void extensionGarden(HashMap<String, String> map) throws DataAccessException {
		sqlSession.insert("ep.ep001_d007.extensionGarden", map);
	}
	
	@Override
	public void insertOrderItem(HashMap<String, String> map) throws DataAccessException {
		sqlSession.insert("ep.ep001_d007.insertOrderItem", map);
	}
	
	@Override
	public List<HashMap<String, String>> selectItemInfo(String order_no) throws DataAccessException {
		return sqlSession.selectList("ep.ep001_d007.selectItemInfo", order_no);
	}
}
