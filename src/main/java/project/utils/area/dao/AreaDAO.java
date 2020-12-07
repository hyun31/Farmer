package project.utils.area.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface AreaDAO {
	public List<HashMap<String, String>> selectArea(String area_group) throws DataAccessException;
}
