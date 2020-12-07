package project.ep.ep001_d004.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.ep.ep001_d004.dao.Ep001_d004DAO;

@Service
public class Ep001_d004ServiceImpl implements Ep001_d004Service{
	@Autowired
	Ep001_d004DAO ep001_d004DAO;
	
	@Override
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws Exception {
		return ep001_d004DAO.selectFarmList(cust_id);
	}
	@Override
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws Exception {
		return ep001_d004DAO.selectGardenList(map);
	}
	@Override
	public List<HashMap<String, String>> selectProductList(HashMap<String, String> map) throws Exception {
		return ep001_d004DAO.selectProductList(map);
	}
	@Override
	public HashMap<String, String> selectProdInfo(HashMap<String, String> map) throws Exception {
		return ep001_d004DAO.selectProdInfo(map);
	}
}
