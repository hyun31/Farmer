package project.bp.bp001_d001.vo;

import org.springframework.stereotype.Component;

@Component
public class Bp001_d001VO {
	private String user_id;
	private String user_pwd;
	private String user_nm;
	private String user_phone;
	private String user_email;
	private String birth_date;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	@Override
	public String toString() {
		return "Bp001_d001VO [user_id=" + user_id + ", user_pwd=" + user_pwd + ", user_nm=" + user_nm + ", user_phone="
				+ user_phone + ", user_email=" + user_email + ", birth_date=" + birth_date + "]";
	}
}
