package project.ip.ip001_d001.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import project.ip.ip001_d001.vo.Ip001_d001VO;
import project.standardCode.vo.StandardCodeVO;

public interface Ip001_d001DAO {
	public List<Ip001_d001VO> showSchedule(HashMap<String, Integer> map) throws DataAccessException;
	public void addSchedule(Ip001_d001VO vo) throws DataAccessException;
	public List<Ip001_d001VO> selectGardenFarmNo(HashMap<String, String> user) throws DataAccessException;
	public List<HashMap<String, String>> selectComingSchedule(HashMap<String, Integer> map) throws DataAccessException;
	public HashMap<String, String> selectFarmInfo(HashMap<String, Integer> map) throws DataAccessException;
}
