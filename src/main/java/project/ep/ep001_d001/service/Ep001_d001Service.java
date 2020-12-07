package project.ep.ep001_d001.service;

import java.util.HashMap;
import java.util.List;

public interface Ep001_d001Service {
	public List<HashMap<String, String>> selectFarmList(HashMap<String, String> map) throws Exception;
	public HashMap<String, String> selectFarmInfo(String farm_no) throws Exception;
}
