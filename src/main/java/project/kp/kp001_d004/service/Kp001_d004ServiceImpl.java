package project.kp.kp001_d004.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kp.kp001_d004.dao.Kp001_d004DAO;

@Service
public class Kp001_d004ServiceImpl implements Kp001_d004Service{
	@Autowired
	Kp001_d004DAO kp001_d004DAO;
	
	@Override
	public void insertProduct(HashMap<String, String> map) throws Exception {
		kp001_d004DAO.insertProduct(map);
	}
	@Override
	public List<HashMap<String, String>> selectProducts() throws Exception {
		return kp001_d004DAO.selectProducts();
	}
}
