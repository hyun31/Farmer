package project.standardCode.vo;

import org.springframework.stereotype.Repository;

@Repository
public class StandardCodeVO {
	private String group_id;
	private String code_id;
	private String code_nm;
	private String code_order;
	private String useyn;
	
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getCode_id() {
		return code_id;
	}
	public void setCode_id(String code_id) {
		this.code_id = code_id;
	}
	public String getCode_nm() {
		return code_nm;
	}
	public void setCode_nm(String code_nm) {
		this.code_nm = code_nm;
	}
	public String getCode_order() {
		return code_order;
	}
	public void setCode_order(String code_order) {
		this.code_order = code_order;
	}
}
