package project.kp.kp001_d004.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

@Component
public interface Kp001_d004DAO {
	public void insertProduct(HashMap<String, String> map) throws DataAccessException;
	public List<HashMap<String, String>> selectProducts() throws DataAccessException;
}
