package project.ep.ep001_d005.service;

import java.util.HashMap;
import java.util.List;

public interface Ep001_d005Service {
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws Exception;
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws Exception;
	public String selectFarmAddress(String farm_no) throws Exception;
}
