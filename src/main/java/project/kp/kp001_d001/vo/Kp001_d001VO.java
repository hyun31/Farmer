package project.kp.kp001_d001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Kp001_d001VO {
	private String user_id;
	private String user_nm;
	private String user_phone;
	private String user_email;
	private String user_type;
	private String gardenyn;
	private Date reg_date;
	private String land_register_no;
	
	public Kp001_d001VO() {
		System.out.println("Jp001_d001VO 생성자 호출");
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getGardenyn() {
		return gardenyn;
	}
	public void setGardenyn(String gardenyn) {
		this.gardenyn = gardenyn;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getLand_register_no() {
		return land_register_no;
	}
	public void setLand_register_no(String land_register_no) {
		this.land_register_no = land_register_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
}
