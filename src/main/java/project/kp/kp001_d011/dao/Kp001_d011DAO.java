package project.kp.kp001_d011.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Kp001_d011DAO {
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws DataAccessException;
	public void insertGarden(HashMap<String, String> map) throws DataAccessException;
}
