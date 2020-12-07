package project.ep.ep001_d005.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Ep001_d005DAO {
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws DataAccessException;
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws DataAccessException;
	public String selectFarmAddress(String farm_no) throws DataAccessException;
}
