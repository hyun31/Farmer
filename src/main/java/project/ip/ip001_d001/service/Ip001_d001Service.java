package project.ip.ip001_d001.service;

import java.util.HashMap;
import java.util.List;

import project.ip.ip001_d001.vo.Ip001_d001VO;
import project.standardCode.vo.StandardCodeVO;

public interface Ip001_d001Service {
	public List<Ip001_d001VO> showSchedule(HashMap<String, Integer> map) throws Exception;
	public void addSchedule(Ip001_d001VO vo) throws Exception;
	public List<Ip001_d001VO> selectFarmGardenNo(HashMap<String, String> user) throws Exception;
	public List<HashMap<String, String>> selectComingSchedule(HashMap<String, Integer> map) throws Exception;
	public HashMap<String, String> selectFarmInfo(HashMap<String, Integer> map) throws Exception;
}
