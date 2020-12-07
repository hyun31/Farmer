package project.ap.ap001_d001.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.ap.ap001_d001.dao.Ap001_d001DAO;

@Service
public class Ap001_d001ServiceImpl implements Ap001_d001Service {
	@Autowired
	private Ap001_d001DAO ap001_d001DAO;
	
	@Override
	public HashMap<String, String> login(Map<String, String> searchMap) throws Exception {
		HashMap<String,String> resultMap = ap001_d001DAO.login(searchMap);
		return resultMap;
	}
}
