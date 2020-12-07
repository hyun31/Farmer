package project.ep.ep001_d001.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.ep.ep001_d001.dao.Ep001_d001DAO;

@Service
public class Ep001_d001ServiceImpl implements Ep001_d001Service{
	@Autowired
	Ep001_d001DAO ep001_d001DAO;
	
	@Override
	public List<HashMap<String, String>> selectFarmList(HashMap<String, String> map) throws Exception {
		return ep001_d001DAO.selectFarmList(map);
	}
	@Override
	public HashMap<String, String> selectFarmInfo(String farm_no) throws Exception {
		return ep001_d001DAO.selectFarmInfo(farm_no);
	}
}
