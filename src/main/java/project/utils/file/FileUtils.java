package project.utils.file;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnails;

@Component("fileUtils")
public class FileUtils {
	
	static final int THUMB_WIDTH = 145;
	static final int THUMB_HEIGHT = 150;
	
	public List<Map<String, Object>> parseFileInfo(MultipartFile[] file, String path) throws Exception {
		final String uploadPath = path + "resources/upload/";
		System.out.println(uploadPath);
		
		List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
		
		File target = new File(uploadPath);
		if(!target.exists()) target.mkdirs();
		
		for(int i=0; i<file.length; i++) {
			String orgFileName = file[i].getOriginalFilename();
			String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
			String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
			Long saveFileSize = file[i].getSize();
			
			System.out.println("-------file start--------");
			System.out.println("파일실제이름: " + orgFileName);
			System.out.println("파일저장이름: " + saveFileName);
			System.out.println("파일크기: " + saveFileSize);
			System.out.println("--------file end----------");
			
			target = new File(uploadPath, saveFileName);
			file[i].transferTo(target);
			
			Map<String, Object> fileInfo = new HashMap<String, Object>();
			
			fileInfo.put("ORG_FILE_NAME", orgFileName);
			fileInfo.put("SAVE_FILE_NAME", saveFileName);
			fileInfo.put("FILE_SIZE", saveFileSize);
			
			// 썸네일 이미지 만들기
			String thumbFileName = "s_" + saveFileName;
			File image = new File(uploadPath + File.separator + saveFileName);
			File thumbnail = new File(uploadPath + File.separator + "s" + File.separator + thumbFileName);
			if(image.exists()) {
				thumbnail.getParentFile().mkdirs();
				Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
			}
			fileInfo.put("THUMBNAIL_NAME", thumbFileName);
			fileList.add(fileInfo);
		}
		
		return fileList;
	}
}
