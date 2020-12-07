package project.ep.ep001_d003.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Ep001_d003DAO {
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws DataAccessException;
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws DataAccessException;
	public HashMap<String, String> selectGardenInfo(HashMap<String, String> map) throws DataAccessException;
}
