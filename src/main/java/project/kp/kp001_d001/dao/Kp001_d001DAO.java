package project.kp.kp001_d001.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.kp.kp001_d001.vo.Kp001_d001VO;

public interface Kp001_d001DAO {
	public List<Kp001_d001VO> selectUserList(Map<String, Object> searchMap) throws DataAccessException;
	public int deleteUser(String p_id) throws DataAccessException;
	public List<HashMap<String, String>> list() throws DataAccessException;
}
