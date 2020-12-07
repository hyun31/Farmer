package project.ep.ep001_d002.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.ep.ep001_d002.dao.Ep001_d002DAO;

@Service
public class Ep001_d002ServcieImpl implements Ep001_d002Service{
	@Autowired
	Ep001_d002DAO ep001_d002DAO;
	
	@Override
	public List<HashMap<String, String>> selectGardenList(HashMap<String, String> map) throws Exception {
		return ep001_d002DAO.selectGardenList(map);
	}
}
