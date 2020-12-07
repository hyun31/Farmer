package project.ep.ep001_d004.service;

import java.util.HashMap;
import java.util.List;

public interface Ep001_d004Service {
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws Exception;
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws Exception;
	public List<HashMap<String, String>> selectProductList(HashMap<String, String> map) throws Exception;
	public HashMap<String, String> selectProdInfo(HashMap<String, String> map) throws Exception;
}
