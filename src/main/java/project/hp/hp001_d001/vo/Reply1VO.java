package project.hp.hp001_d001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Reply1VO {
	private int rid; // 일련번호
	private int bid; // 게시물 일련번호
	private String board_content; // 댓글내용
	private String reg_id; // 작성자
	private Date reg_dt; // 작성일
	private Date edit_dt; // 수정일
	
	public Reply1VO() {
		System.out.println("Reply1VO 생성자호출");
	}
	
	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public Date getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}

	public Date getEdit_dt() {
		return edit_dt;
	}

	public void setEdit_dt(Date edit_dt) {
		this.edit_dt = edit_dt;
	}

	@Override
	public String toString() {
		return "Reply1VO [rid=" + rid + ", bid=" + bid + ", content=" + board_content + ", reg_id=" + reg_id
				+ ", reg_dt=" + reg_dt + ", edit_dt=" + edit_dt + "]";
	}

}
