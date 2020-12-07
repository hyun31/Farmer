package project.hp.hp001_d003.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Hp001_d003VO {
	private int article_no; // 게시글 번호
	private int board_cd; // 게시판 코드
	private String writer_id; // 작성자ID
	private String board_gr_cd; // 게시판그룹코드
	private String article_nm; // 게시글 제목
	private String article_content; // 게시글 내용
	private Date reg_date; // 게시글 등록일
	private Date chg_date; // 게시글 수정일
	private int read_cnt; // 조회수
	private String is_notice; // 공지사항 구분
	private int farm_no; // 농장번호
	private String email; // 이메일
	private String phone; // 연락처
	private int rnum;


	private int rid; // 일련번호
	private int bid; // 게시물 일련번호
	private String board_content; // 댓글내용
	private String reg_id; // 작성자
	private Date reg_dt; // 작성일
	private Date edit_dt; // 수정일

	public Hp001_d003VO() {
		System.out.println("분양문의VO 생성자 호출");
	}

	public int getRnum() {
		return rnum;
	}
	
	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public int getBoard_cd() {
		return board_cd;
	}

	public void setBoard_cd(int board_cd) {
		this.board_cd = board_cd;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getBoard_gr_cd() {
		return board_gr_cd;
	}

	public void setBoard_gr_cd(String board_gr_cd) {
		this.board_gr_cd = board_gr_cd;
	}

	public String getArticle_nm() {
		return article_nm;
	}

	public void setArticle_nm(String article_nm) {
		this.article_nm = article_nm;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getChg_date() {
		return chg_date;
	}

	public void setChg_date(Date chg_date) {
		this.chg_date = chg_date;
	}

	public int getRead_cnt() {
		return read_cnt;
	}

	public void setRead_cnt(int read_cnt) {
		this.read_cnt = read_cnt;
	}

	public String getIs_notice() {
		return is_notice;
	}

	public void setIs_notice(String is_notice) {
		this.is_notice = is_notice;
	}

	public int getFarm_no() {
		return farm_no;
	}

	public void setFarm_no(int farm_no) {
		this.farm_no = farm_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
