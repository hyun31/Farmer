package project.bp.bp001_d001.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import project.bp.bp001_d001.vo.Bp001_d001VO;
import project.standardCode.vo.StandardCodeVO;

public interface Bp001_d001DAO {	
	public int insertUser(Bp001_d001VO vo) throws DataAccessException;
	public int checkId(String user_id) throws DataAccessException;
}
