package project.kp.kp001_d009.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Kp001_d009DAO {
	public void insertFarm(HashMap<String, Object> map) throws DataAccessException;
	public List<HashMap<String, String>> selectFarms() throws DataAccessException;
}
