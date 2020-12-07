package project.ep.ep001_d002.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Ep001_d002DAO {
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws DataAccessException;
}