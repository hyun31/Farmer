package project.kp.kp001_d009.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface Kp001_d009Service {
	public void insertFarm(HashMap<String, Object> map, MultipartFile[] file, String path) throws Exception;
	public List<HashMap<String, String>> selectFarms() throws Exception;
}
