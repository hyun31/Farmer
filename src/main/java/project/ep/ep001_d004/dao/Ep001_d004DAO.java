package project.ep.ep001_d004.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Ep001_d004DAO {
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws DataAccessException;
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws DataAccessException;
	public List<HashMap<String, String>> selectProductList(HashMap<String, String> map) throws DataAccessException;
	public HashMap<String, String> selectProdInfo(HashMap<String, String> map) throws DataAccessException;
}
