package project.hp.hp001_d005.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import project.hp.hp001_d005.dao.Hp001_d005DAO;
import project.hp.hp001_d005.vo.Hp001_d005VO;

@Service
public class Hp001_d005ServiceImpl implements Hp001_d005Service{

	@Inject
	private Hp001_d005DAO hp001_d005DAO;
	
	@Override
	public void register(Hp001_d005VO hp001_d005VO) throws Exception {
		System.out.println("=======>> 농장등록신청 Service");
		hp001_d005DAO.register(hp001_d005VO);
	}

}
