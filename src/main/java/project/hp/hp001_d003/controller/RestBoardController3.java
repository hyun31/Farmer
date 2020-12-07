package project.hp.hp001_d003.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import project.hp.hp001_d003.service.Hp001_d003Service;
import project.hp.hp001_d003.vo.Reply3VO;

@RestController
@RequestMapping(value = "/restBoard3")
public class RestBoardController3 {
	private static final Logger logger = LoggerFactory.getLogger(Hp001_d003Controller.class);

	@Inject
	private Hp001_d003Service hp001_d003Service;

	@RequestMapping(value = "/getReplyList", method = RequestMethod.POST)
	public List<Reply3VO> getReplyList(@RequestParam("bid") int bid) throws Exception {
		System.out.println("=====>" + bid);
		
		List<Reply3VO> result = null;
		try {
		    result = hp001_d003Service.getReplyList(bid);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 쓰기
	@RequestMapping(value = "/saveReply")
	public Map<String, Object> saveReply(@RequestBody Reply3VO reply3VO) throws Exception {
		Map<String, Object> result = new HashMap<>();

		try {
			hp001_d003Service.saveReply(reply3VO);
			result.put("status", "OK");
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}

	// 수정
	@RequestMapping(value = "/updateReply", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> updateReply(@RequestBody Reply3VO reply3VO) throws Exception {

		Map<String, Object> result = new HashMap<>();
		try {
			hp001_d003Service.updateReply(reply3VO);
			result.put("status", "OK");

		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}

	// 삭제
	@RequestMapping(value = "/deleteReply", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> deleteReply(@RequestParam("rid") int rid) throws Exception {
		Map<String, Object> result = new HashMap<>();
		try {
			hp001_d003Service.deleteReply(rid);
			result.put("status", "OK");
			
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}

}
