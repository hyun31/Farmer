package project.kp.kp001_d001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.kp.kp001_d001.dao.Kp001_d001DAO;
import project.kp.kp001_d001.vo.Kp001_d001VO;

@Service("kp001_d001Service")
public class Kp001_d001ServiceImpl implements Kp001_d001Service {
	@Autowired
	private Kp001_d001DAO kp001_d001DAO; 
	
	@Override
	public List<Kp001_d001VO> selectUserList(Map<String, Object> searchMap) throws DataAccessException {
		List<Kp001_d001VO> list =  kp001_d001DAO.selectUserList(searchMap); 
		return list;
	}
	@Override
	public int deleteUser(String p_del_id) throws DataAccessException {
		int result = kp001_d001DAO.deleteUser(p_del_id);
		return result;
	}	
	@Override
	public List<HashMap<String, String>> list() throws DataAccessException {
		return kp001_d001DAO.list();
	}
}
