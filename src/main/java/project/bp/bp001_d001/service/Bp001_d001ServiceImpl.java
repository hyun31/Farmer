package project.bp.bp001_d001.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.bp.bp001_d001.dao.Bp001_d001DAO;
import project.bp.bp001_d001.vo.Bp001_d001VO;
import project.standardCode.vo.StandardCodeVO;

@Service("bp001_d001Service")
public class Bp001_d001ServiceImpl implements Bp001_d001Service {
	@Autowired
	private Bp001_d001DAO bp001_d001DAO; 
	
	@Override
	public int insertUser(Bp001_d001VO vo) throws DataAccessException {
		return bp001_d001DAO.insertUser(vo);
	}
	@Override
	public int checkId(String user_id) throws DataAccessException {
		return bp001_d001DAO.checkId(user_id);
	}
}
