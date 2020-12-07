package project.standardCode.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.standardCode.dao.StandardCodeDAO;
import project.standardCode.vo.StandardCodeVO;

@Service
public class StandardCodeServiceImpl implements StandardCodeService{
	@Autowired
	StandardCodeDAO standardCodeDAO;
	
	@Override
	public List<StandardCodeVO> selectCodeList(String p_group_id) throws DataAccessException {
		List<StandardCodeVO> list = standardCodeDAO.selectCodeList(p_group_id);
		return list;
	}
}
