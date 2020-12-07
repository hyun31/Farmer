package project.ep.ep001_d001.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Ep001_d001DAO {
	public List<HashMap<String, String>> selectFarmList(HashMap<String, String> map) throws DataAccessException;
	public HashMap<String, String> selectFarmInfo(String farm_no) throws DataAccessException;
}
