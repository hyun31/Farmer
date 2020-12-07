package project.utils.area.service;

import java.util.HashMap;
import java.util.List;

public interface AreaService {
	public List<HashMap<String, String>> selectArea(String area_group) throws Exception;
}
