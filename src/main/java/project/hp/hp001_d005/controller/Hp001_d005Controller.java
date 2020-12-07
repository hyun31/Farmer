package project.hp.hp001_d005.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.hp.hp001_d005.service.Hp001_d005Service;
import project.hp.hp001_d005.vo.Hp001_d005VO;

@Controller
public class Hp001_d005Controller {

	private static final Logger logger = LoggerFactory.getLogger(Hp001_d005Controller.class);

	@Inject
	private Hp001_d005Service hp001_d005Service;

	// 등록신청 GET
	@RequestMapping(value = "/hp/hp001_d005", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		System.out.println("==========> GET으로 등록합니다.");
		logger.info("get hp001_d005");
	}

	// 등록신청 POST
	@RequestMapping(value = "/hp/hp001_d005", method = RequestMethod.POST)
	public String postRegister(Hp001_d005VO hp001_d005VO) throws Exception {
		logger.info("post hp001_d005");
		System.out.println("==========> POST으로 등록합니다.");
		hp001_d005Service.register(hp001_d005VO);

		return null;
	}
}
