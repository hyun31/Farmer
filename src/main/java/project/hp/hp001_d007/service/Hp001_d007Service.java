package project.hp.hp001_d007.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

public interface Hp001_d007Service {
	public void insertFarm(HashMap<String, Object> map, MultipartFile[] file, String path) throws Exception;
	public List<HashMap<String, String>> selectFarmApply(String farmer_id) throws Exception;
	public HashMap<String, String> selectFarmInfo(String farm_no) throws Exception;
}
