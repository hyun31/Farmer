package project.jp.jp001_d001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.jp.jp001_d001.vo.Jp001_d001VO;

public interface Jp001_d001Service {
	public List<Jp001_d001VO> selectUserList(Map<String, Object> searchMap) throws DataAccessException;
	public int deleteUser(String p_id) throws DataAccessException;
}
