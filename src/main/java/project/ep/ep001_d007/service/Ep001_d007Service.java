package project.ep.ep001_d007.service;

import java.util.HashMap;
import java.util.List;

public interface Ep001_d007Service {
	public String selectSequence() throws Exception;
	public void insertOrder(HashMap<String, String> map) throws Exception;
	public void updateStatus(String order_no) throws Exception;
	public HashMap<String, String> selectOrderInfo(String order_no) throws Exception;
	public void updateGarden(HashMap<String, String> map) throws Exception;
	public void insertPayment(HashMap<String, String> map) throws Exception;
	public void extensionGarden(HashMap<String, String> map) throws Exception;
	public void insertOrderItem(HashMap<String, String> map) throws Exception;
	public List<HashMap<String, String>> selectItemInfo(String order_no) throws Exception;
}
