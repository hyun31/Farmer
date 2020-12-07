package project.ip.ip001_d001.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.ip.ip001_d001.dao.Ip001_d001DAO;
import project.ip.ip001_d001.vo.Ip001_d001VO;
import project.standardCode.vo.StandardCodeVO;

@Service("ip001_d001Service")
public class Ip001_d001ServiceImpl implements Ip001_d001Service{
	@Autowired
	private Ip001_d001DAO ip001_d001DAO; 

	@Override
	public List<Ip001_d001VO> showSchedule(HashMap<String, Integer> map) throws Exception {
		return ip001_d001DAO.showSchedule(map);
	}
	
	@Override
	public void addSchedule(Ip001_d001VO vo) throws Exception {
		ip001_d001DAO.addSchedule(vo);
	}
	
	@Override
	public List<Ip001_d001VO> selectFarmGardenNo(HashMap<String, String> user) throws Exception {
		List<Ip001_d001VO> list = ip001_d001DAO.selectGardenFarmNo(user);
		return list;
	}
	
	@Override
	public List<HashMap<String, String>> selectComingSchedule(HashMap<String, Integer> map) throws Exception {
		return ip001_d001DAO.selectComingSchedule(map);
	}
	
	@Override
	public HashMap<String, String> selectFarmInfo(HashMap<String, Integer> map) throws Exception {
		return ip001_d001DAO.selectFarmInfo(map);
	}
}
