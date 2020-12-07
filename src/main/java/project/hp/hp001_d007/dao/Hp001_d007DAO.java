package project.hp.hp001_d007.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Hp001_d007DAO {
	public void insertFarm(HashMap<String, Object> map) throws DataAccessException;
	public List<HashMap<String, String>> selectFarmApply(String farmer_id) throws DataAccessException;
	public HashMap<String, String> selectFarmInfo(String farm_no) throws DataAccessException;
	public HashMap<String, String> selectApply(String user_id) throws DataAccessException;
}
