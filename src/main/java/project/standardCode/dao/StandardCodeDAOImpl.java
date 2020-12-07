package project.standardCode.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.standardCode.vo.StandardCodeVO;

@Repository
public class StandardCodeDAOImpl implements StandardCodeDAO {
	@Autowired
	SqlSession sqlSession;
	@Override
	public List<StandardCodeVO> selectCodeList(String p_group_id) throws DataAccessException {
		List<StandardCodeVO> list = sqlSession.selectList("if.standard_code.selectCode", p_group_id);
		return list;
	}
}
