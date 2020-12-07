package project.kp.kp001_d009.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import project.kp.kp001_d009.dao.Kp001_d009DAO;
import project.utils.file.FileUtils;

@Service
public class Kp001_d009ServiceImpl implements Kp001_d009Service{
	@Autowired
	Kp001_d009DAO kp001_d009DAO;
	@Autowired
	FileUtils fileUtils;
	
	@Override
	public void insertFarm(HashMap<String, Object> map, MultipartFile[] file, String path) throws Exception {
		/*
		 * Iterator<String> iterator = mpRequest.getFileNames(); MultipartFile
		 * multipartFile = null; while(iterator.hasNext()) { multipartFile =
		 * mpRequest.getFile(iterator.next()); if(multipartFile.isEmpty() == false) {
		 * System.out.println("-------file start--------"); System.out.println("name: "
		 * + multipartFile.getName()); System.out.println("filenmae: " +
		 * multipartFile.getOriginalFilename()); System.out.println("size: " +
		 * multipartFile.getSize()); System.out.println("--------file end----------"); }
		 * }
		 */
		for(int i=0; i<file.length; i++) {
			System.out.println("name: " + file[i].getName()); 
			System.out.println("filenmae: " + file[i].getOriginalFilename()); 
			System.out.println("size: " + file[i].getSize());
			System.out.println("--------file end----------");
		}
		
		List<Map<String, Object>> fileList = fileUtils.parseFileInfo(file, path);
		map.put("org_file_name", fileList.get(0).get("ORG_FILE_NAME"));
		map.put("save_file_name", fileList.get(0).get("SAVE_FILE_NAME"));
		map.put("file_size", fileList.get(0).get("FILE_SIZE"));
		map.put("thumbnail_name", fileList.get(0).get("THUMBNAIL_NAME"));
		
		System.out.println("------insertfarm map 확인---------");
		System.out.println(map);
		
		kp001_d009DAO.insertFarm(map);
	}
	
	@Override
	public List<HashMap<String, String>> selectFarms() throws Exception {
		return kp001_d009DAO.selectFarms();
	}
}
