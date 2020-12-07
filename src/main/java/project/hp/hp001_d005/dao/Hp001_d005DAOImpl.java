package project.hp.hp001_d005.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import project.hp.hp001_d005.vo.Hp001_d005VO;

@Repository
public class Hp001_d005DAOImpl implements Hp001_d005DAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void register(Hp001_d005VO hp001_d005VO) throws Exception {
		System.out.println("=======>> 농장등록신청 DAO");
		sqlSession.insert("hp001_d005.register",hp001_d005VO);
	}

}
