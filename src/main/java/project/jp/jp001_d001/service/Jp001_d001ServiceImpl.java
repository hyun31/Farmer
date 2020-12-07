package project.jp.jp001_d001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.jp.jp001_d001.dao.Jp001_d001DAO;
import project.jp.jp001_d001.vo.Jp001_d001VO;

@Service("jp001_d001Service")
public class Jp001_d001ServiceImpl implements Jp001_d001Service {
	@Autowired
	private Jp001_d001DAO jp001_d001DAO; 
	@Override
	public List<Jp001_d001VO> selectUserList(Map<String, Object> searchMap) throws DataAccessException {
		List<Jp001_d001VO> list =  jp001_d001DAO.selectUserList(searchMap); 
		return list;
	}
	@Override
	public int deleteUser(String p_del_id) throws DataAccessException {
		int result = jp001_d001DAO.deleteUser(p_del_id);
		return result;
	}
	
}
