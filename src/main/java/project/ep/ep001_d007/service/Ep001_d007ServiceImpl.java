package project.ep.ep001_d007.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.ep.ep001_d007.dao.Ep001_d007DAO;

@Service
public class Ep001_d007ServiceImpl implements Ep001_d007Service {
	@Autowired
	Ep001_d007DAO ep001_d007DAO;
	
	@Override
	public String selectSequence() throws Exception {
		return ep001_d007DAO.selectSequence();
	}
	
	@Override
	public void insertOrder(HashMap<String, String> map) throws Exception {
		ep001_d007DAO.insertOrder(map);
	}
	
	@Override
	public void updateStatus(String order_no) throws Exception {
		ep001_d007DAO.updateStatus(order_no);
	}
	
	@Override
	public HashMap<String, String> selectOrderInfo(String order_no) throws Exception {
		return ep001_d007DAO.selectOrderInfo(order_no);
	}
	
	@Override
	public void updateGarden(HashMap<String, String> map) throws Exception {
		ep001_d007DAO.updateGardenInfo(map);
	}
	
	@Override
	public void insertPayment(HashMap<String, String> map) throws Exception {
		ep001_d007DAO.insertPayment(map);
	}
	
	@Override
	public void extensionGarden(HashMap<String, String> map) throws Exception {
		ep001_d007DAO.extensionGarden(map);
	}
	
	@Override
	public void insertOrderItem(HashMap<String, String> map) throws Exception {
		ep001_d007DAO.insertOrderItem(map);
	}
	
	@Override
	public List<HashMap<String, String>> selectItemInfo(String order_no) throws Exception {
		return ep001_d007DAO.selectItemInfo(order_no);
	}
}
