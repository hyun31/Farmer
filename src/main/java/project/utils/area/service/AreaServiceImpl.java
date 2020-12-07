package project.utils.area.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.utils.area.dao.AreaDAO;

@Service
public class AreaServiceImpl implements AreaService {
	@Autowired
	AreaDAO areaDAO;
	
	@Override
	public List<HashMap<String, String>> selectArea(String area_group) throws Exception {
		return areaDAO.selectArea(area_group);
	}
}
