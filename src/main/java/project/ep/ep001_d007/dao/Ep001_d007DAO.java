package project.ep.ep001_d007.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Ep001_d007DAO {
	public String selectSequence() throws DataAccessException;
	public void insertOrder(HashMap<String, String> map) throws DataAccessException;
	public void updateStatus(String order_no) throws DataAccessException;
	public HashMap<String, String> selectOrderInfo(String order_no) throws DataAccessException;
	public void updateGardenInfo(HashMap<String, String> map) throws DataAccessException;
	public void insertPayment(HashMap<String, String> map) throws DataAccessException;
	public void extensionGarden(HashMap<String, String> map) throws DataAccessException;
	public void insertOrderItem(HashMap<String, String> map) throws DataAccessException;
	public List<HashMap<String, String>> selectItemInfo(String order_no) throws DataAccessException;
}
