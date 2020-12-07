package project.ip.ip001_d001.vo;

import org.springframework.stereotype.Component;

@Component
public class Ip001_d001VO {
	private int garden_no;
	private int farm_no;
	private String garden_nm;
	private int schedule_no;
	private String schedule_name;
	private String schedule_content;
	private String schedule_category;
	private String start_date;
	private String end_date;
	
	public int getGarden_no() {
		return garden_no;
	}
	public void setGarden_no(int garden_no) {
		this.garden_no = garden_no;
	}
	public int getFarm_no() {
		return farm_no;
	}
	public void setFarm_no(int farm_no) {
		this.farm_no = farm_no;
	}
	public String getGarden_nm() {
		return garden_nm;
	}
	public void setGarden_nm(String garden_nm) {
		this.garden_nm = garden_nm;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getSchedule_name() {
		return schedule_name;
	}
	public void setSchedule_name(String schedule_name) {
		this.schedule_name = schedule_name;
	}
	public String getSchedule_content() {
		return schedule_content;
	}
	public void setSchedule_content(String schedule_content) {
		this.schedule_content = schedule_content;
	}
	public String getSchedule_category() {
		return schedule_category;
	}
	public void setSchedule_category(String schedule_category) {
		this.schedule_category = schedule_category;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	@Override
	public String toString() {
		return "Ip001_d001VO [garden_no=" + garden_no + ", farm_no=" + farm_no + ", garden_nm=" + garden_nm
				+ ", schedule_no=" + schedule_no + ", schedule_name=" + schedule_name + ", schedule_content="
				+ schedule_content + ", schedule_category=" + schedule_category + ", start_date=" + start_date
				+ ", end_date=" + end_date + "]";
	}
}
