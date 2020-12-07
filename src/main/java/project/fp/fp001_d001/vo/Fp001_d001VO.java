package project.fp.fp001_d001.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import project.utils.paging.PagingVO;

@Component
public class Fp001_d001VO extends PagingVO{
	private int article_no;
	private String board_cd;
	private String writer_id;
	private String article_nm;
	private String article_content;
	private Date reg_date;
	private Date chg_date;
	private int read_cnt;
	private String is_notice;
	private int farm_no;
	private String user_nm;
	private String code_id;
	private String code_nm;
	private String group_id;
	private String code_order;
	private String useyn;
	private String board_nm;
	private String local_no;
	private String local_nm;
	private int rnum;
	private String trans_no;
	private String trans_nm;
	private String img_nm;
	
	public Fp001_d001VO() {
		super();
	}
	
	public Fp001_d001VO(int total, int nowPage, int cntPerPage) {
		super(total, nowPage, cntPerPage);
		System.out.println("Fp001_d001VO 생성자 호출");
	}
	
	//public Fp001_d001VO(int total, int nowPage, int cntPerPage) {
		//System.out.println("Fp001_d001VO 생성자 호출");
		//super(total, nowPage, cntPerPage);
	//}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public String getBoard_cd() {
		return board_cd;
	}

	public void setBoard_cd(String board_cd) {
		this.board_cd = board_cd;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
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

	public String getUser_nm() {
		return user_nm;
	}

	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
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

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}

	public String getCode_order() {
		return code_order;
	}

	public void setCode_order(String code_order) {
		this.code_order = code_order;
	}

	public String getUseyn() {
		return useyn;
	}

	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}

	public String getBoard_nm() {
		return board_nm;
	}

	public void setBoard_nm(String board_nm) {
		this.board_nm = board_nm;
	}

	public String getLocal_no() {
		return local_no;
	}

	public void setLocal_no(String local_no) {
		this.local_no = local_no;
	}

	public String getLocal_nm() {
		return local_nm;
	}

	public void setLocal_nm(String local_nm) {
		this.local_nm = local_nm;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getTrans_no() {
		return trans_no;
	}

	public void setTrans_no(String trans_no) {
		this.trans_no = trans_no;
	}

	public String getTrans_nm() {
		return trans_nm;
	}

	public void setTrans_nm(String trans_nm) {
		this.trans_nm = trans_nm;
	}

	public String getImg_nm() {
		return img_nm;
	}

	public void setImg_nm(String img_nm) {
		this.img_nm = img_nm;
	}

	@Override
	public String toString() {
		return "Fp001_d001VO [article_no=" + article_no + ", board_cd=" + board_cd + ", writer_id=" + writer_id
				+ ", article_nm=" + article_nm + ", article_content=" + article_content + ", reg_date=" + reg_date
				+ ", chg_date=" + chg_date + ", read_cnt=" + read_cnt + ", is_notice=" + is_notice + ", farm_no="
				+ farm_no + ", user_nm=" + user_nm + ", code_id=" + code_id + ", code_nm=" + code_nm + ", group_id="
				+ group_id + ", code_order=" + code_order + ", useyn=" + useyn + ", board_nm=" + board_nm
				+ ", local_no=" + local_no + ", local_nm=" + local_nm + ", rnum=" + rnum + ", trans_no=" + trans_no
				+ ", trans_nm=" + trans_nm + ", img_nm=" + img_nm + "]";
	}
	
}
