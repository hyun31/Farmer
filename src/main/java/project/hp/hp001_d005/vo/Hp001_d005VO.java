package project.hp.hp001_d005.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Hp001_d005VO {
	private int farm_no;		//농장번호
	private String farm_nm;		//농장명
	private String address;		//주소
	private String farmer_id;	//농장주ID
	private String farm_intro;	//농장소개
	
	private Date application_date;	//신청일
	private Date contract_date;		//계약일
	private Date expir_date;		//만료일
	private String org_file_name;	//농장_원본사진명
	private String farm_phone;		//농장연락처
	
	private String reject_reason;	//거절사유 Null 
	private String area_size;		//구획당면적
	private int garden_cnt;			//구획수 Null
	private String farmer_email;	//농장주이메일 Null
	private String contract_term;	//계약기간 Null
	
	private String land_org_file_name;	//토지_원본사진명 Null
	private String land_save_file_name;	//토지_저장사진명 Null
	private int land_file_size;			//토지_파일크기 Null
	private String save_file_name;		//농장_저장사진명
	private int file_size;				//농장_사진크기
	
	private String thumbnail_name;		//썸네일명
	private int approval_cd;			//농장승인코드
	private String post_code;			//우편번호	 Null
	private String farmer_phone;		//농장연락처 Null
	
	public Hp001_d005VO() {
		System.out.println("======>> 농장등록신청 VO 호출");
	}
	public int getFarm_no() {
		return farm_no;
	}
	public void setFarm_no(int farm_no) {
		this.farm_no = farm_no;
	}
	public String getFarm_nm() {
		return farm_nm;
	}
	public void setFarm_nm(String farm_nm) {
		this.farm_nm = farm_nm;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getFarmer_id() {
		return farmer_id;
	}
	public void setFarmer_id(String farmer_id) {
		this.farmer_id = farmer_id;
	}
	public String getFarm_intro() {
		return farm_intro;
	}
	public void setFarm_intro(String farm_intro) {
		this.farm_intro = farm_intro;
	}
	public Date getApplication_date() {
		return application_date;
	}
	public void setApplication_date(Date application_date) {
		this.application_date = application_date;
	}
	public Date getContract_date() {
		return contract_date;
	}
	public void setContract_date(Date contract_date) {
		this.contract_date = contract_date;
	}
	public Date getExpir_date() {
		return expir_date;
	}
	public void setExpir_date(Date expir_date) {
		this.expir_date = expir_date;
	}
	public String getOrg_file_name() {
		return org_file_name;
	}
	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}
	public String getFarm_phone() {
		return farm_phone;
	}
	public void setFarm_phone(String farm_phone) {
		this.farm_phone = farm_phone;
	}
	public String getReject_reason() {
		return reject_reason;
	}
	public void setReject_reason(String reject_reason) {
		this.reject_reason = reject_reason;
	}
	public String getArea_size() {
		return area_size;
	}
	public void setArea_size(String area_size) {
		this.area_size = area_size;
	}
	public int getGarden_cnt() {
		return garden_cnt;
	}
	public void setGarden_cnt(int garden_cnt) {
		this.garden_cnt = garden_cnt;
	}
	public String getFarmer_email() {
		return farmer_email;
	}
	public void setFarmer_email(String farmer_email) {
		this.farmer_email = farmer_email;
	}
	public String getContract_term() {
		return contract_term;
	}
	public void setContract_term(String contract_term) {
		this.contract_term = contract_term;
	}
	public String getLand_org_file_name() {
		return land_org_file_name;
	}
	public void setLand_org_file_name(String land_org_file_name) {
		this.land_org_file_name = land_org_file_name;
	}
	public String getLand_save_file_name() {
		return land_save_file_name;
	}
	public void setLand_save_file_name(String land_save_file_name) {
		this.land_save_file_name = land_save_file_name;
	}
	public int getLand_file_size() {
		return land_file_size;
	}
	public void setLand_file_size(int land_file_size) {
		this.land_file_size = land_file_size;
	}
	public String getSave_file_name() {
		return save_file_name;
	}
	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getThumbnail_name() {
		return thumbnail_name;
	}
	public void setThumbnail_name(String thumbnail_name) {
		this.thumbnail_name = thumbnail_name;
	}
	public int getApproval_cd() {
		return approval_cd;
	}
	public void setApproval_cd(int approval_cd) {
		this.approval_cd = approval_cd;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getFarmer_phone() {
		return farmer_phone;
	}
	public void setFarmer_phone(String farmer_phone) {
		this.farmer_phone = farmer_phone;
	}
	@Override
	public String toString() {
		return "Hp001_d005VO [farm_no=" + farm_no + ", farm_nm=" + farm_nm + ", address=" + address + ", farmer_id="
				+ farmer_id + ", farm_intro=" + farm_intro + ", application_date=" + application_date
				+ ", contract_date=" + contract_date + ", expir_date=" + expir_date + ", org_file_name=" + org_file_name
				+ ", farm_phone=" + farm_phone + ", reject_reason=" + reject_reason + ", area_size=" + area_size
				+ ", garden_cnt=" + garden_cnt + ", farmer_email=" + farmer_email + ", contract_term=" + contract_term
				+ ", land_org_file_name=" + land_org_file_name + ", land_save_file_name=" + land_save_file_name
				+ ", land_file_size=" + land_file_size + ", save_file_name=" + save_file_name + ", file_size="
				+ file_size + ", thumbnall_name=" + thumbnail_name + ", approval_cd=" + approval_cd + ", post_code="
				+ post_code + ", farmer_phone=" + farmer_phone + "]";
	}
	
	

}
