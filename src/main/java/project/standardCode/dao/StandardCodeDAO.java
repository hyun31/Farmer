package project.standardCode.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import project.standardCode.vo.StandardCodeVO;

public interface StandardCodeDAO {
	public List<StandardCodeVO> selectCodeList(String p_group_id) throws DataAccessException;
}
