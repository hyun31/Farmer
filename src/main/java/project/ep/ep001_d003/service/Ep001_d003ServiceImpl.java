package project.ep.ep001_d003.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.ep.ep001_d003.dao.Ep001_d003DAO;

@Service
public class Ep001_d003ServiceImpl implements Ep001_d003Service{
	@Autowired
	Ep001_d003DAO ep001_d003DAO;
	
	@Override
	public List<HashMap<String, String>> selectFarmList(String cust_id) throws Exception {
		return ep001_d003DAO.selectFarmList(cust_id);
	}
	@Override
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws Exception {
		return ep001_d003DAO.selectGardenList(map);
	}
	@Override
	public HashMap<String, String> selectGardenInfo(HashMap<String, String> map) throws Exception {
		return ep001_d003DAO.selectGardenInfo(map);
	}
}
