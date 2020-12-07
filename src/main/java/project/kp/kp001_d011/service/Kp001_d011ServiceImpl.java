package project.kp.kp001_d011.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kp.kp001_d011.dao.Kp001_d011DAO;

@Service
public class Kp001_d011ServiceImpl implements Kp001_d011Service {
	@Autowired
	Kp001_d011DAO kp001_d011DAO;
	
	@Override
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws Exception {
		return kp001_d011DAO.selectGardenList(map);
	}
	
	@Override
	public void insertGarden(HashMap<String, String> map) throws Exception {
		kp001_d011DAO.insertGarden(map);
	}
}
