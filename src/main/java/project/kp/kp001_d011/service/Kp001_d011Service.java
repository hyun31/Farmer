package project.kp.kp001_d011.service;

import java.util.HashMap;
import java.util.List;

public interface Kp001_d011Service {
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws Exception;
	public void insertGarden(HashMap<String, String> map) throws Exception;
}
