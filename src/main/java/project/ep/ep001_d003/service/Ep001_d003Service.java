package project.ep.ep001_d003.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Ep001_d003Service {
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws Exception;
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws Exception;
	public HashMap<String, String> selectGardenInfo(HashMap<String, String> map) throws Exception; 
}
