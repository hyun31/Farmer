package project.ep.ep001_d005.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.ep.ep001_d005.dao.Ep001_d005DAO;

@Service
public class Ep001_d005ServiceImpl implements Ep001_d005Service {
	@Autowired
	Ep001_d005DAO ep001_d005DAO;
	
	@Override
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws Exception {
		return ep001_d005DAO.selectFarmList(cust_id);
	}
	@Override
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws Exception {
		return ep001_d005DAO.selectGardenList(map);
	}
	@Override
	public String selectFarmAddress(String farm_no) throws Exception {
		return ep001_d005DAO.selectFarmAddress(farm_no);
	}
}
