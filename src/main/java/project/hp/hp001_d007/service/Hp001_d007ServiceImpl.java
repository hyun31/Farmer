package project.hp.hp001_d007.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import project.hp.hp001_d007.dao.Hp001_d007DAO;
import project.utils.file.FileUtils;

@Service
public class Hp001_d007ServiceImpl implements Hp001_d007Service{
	@Autowired
	Hp001_d007DAO hp001_d007DAO;
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
		
		map.put("land_org_file_name", fileList.get(0).get("ORG_FILE_NAME"));
		map.put("land_save_file_name", fileList.get(0).get("SAVE_FILE_NAME"));
		map.put("land_file_size", fileList.get(0).get("FILE_SIZE"));
		
		map.put("org_file_name", fileList.get(1).get("ORG_FILE_NAME"));
		map.put("save_file_name", fileList.get(1).get("SAVE_FILE_NAME"));
		map.put("file_size", fileList.get(1).get("FILE_SIZE"));
		map.put("thumbnail_name", fileList.get(1).get("THUMBNAIL_NAME"));
		
		System.out.println("------insertfarm map 확인---------");
		System.out.println(map);
		
		hp001_d007DAO.insertFarm(map);
	}
	
	@Override
	public List<HashMap<String, String>> selectFarmApply(String farmer_id) throws Exception {
		return hp001_d007DAO.selectFarmApply(farmer_id);
	}
	@Override
	public HashMap<String, String> selectFarmInfo(String farm_no) throws Exception {
		return hp001_d007DAO.selectFarmInfo(farm_no);
	}
}
