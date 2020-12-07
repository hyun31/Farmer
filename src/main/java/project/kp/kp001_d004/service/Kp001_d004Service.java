package project.kp.kp001_d004.service;

import java.util.HashMap;
import java.util.List;

public interface Kp001_d004Service {
	public void insertProduct(HashMap<String, String> map) throws Exception;
	public List<HashMap<String, String>> selectProducts() throws Exception;
}
