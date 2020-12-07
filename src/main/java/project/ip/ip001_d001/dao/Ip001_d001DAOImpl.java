package project.ip.ip001_d001.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.ip.ip001_d001.vo.Ip001_d001VO;
import project.standardCode.vo.StandardCodeVO;

@Repository("ip001_d001DAO")
public class Ip001_d001DAOImpl implements Ip001_d001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Ip001_d001VO> showSchedule(HashMap<String, Integer> map) throws DataAccessException {
		List<Ip001_d001VO> list = sqlSession.selectList("ip.ip001_d001.showSchedule", map);
		return list;
	}
	
	@Override
	public void addSchedule(Ip001_d001VO vo) throws DataAccessException {
		sqlSession.insert("ip.ip001_d001.addSchedule", vo);
	}
	
	@Override
	public List<Ip001_d001VO> selectGardenFarmNo(HashMap<String, String> user) throws DataAccessException {
		List<Ip001_d001VO> list = sqlSession.selectList("ip.ip001_d001.selectGardenFarmNo", user);
		return list;
	}
	
	@Override
	public List<HashMap<String, String>> selectComingSchedule(HashMap<String, Integer> map) throws DataAccessException {
		return sqlSession.selectList("ip.ip001_d001.selectComingSchedule", map);
	}
	
	@Override
	public HashMap<String, String> selectFarmInfo(HashMap<String, Integer> map) throws DataAccessException {
		return sqlSession.selectOne("ip.ip001_d001.selectFarmInfo", map);
	}
}
