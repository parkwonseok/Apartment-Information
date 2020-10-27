package com.pws.test.vo;

import java.sql.Date;

public class BoardVO {
	private int bno;
	private String title;
	private String content;
	private Date regdate;
	private int  viewcnt;
	private Date cm_regdate;
	private String cm_content;
	private String mb_email;
	private String mb_name;
	private boolean secret;
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardVO(int bno, String title, String content, Date regdate, int viewcnt, Date cm_regdate, String cm_content,
			String mb_email, String mb_name, boolean secret) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.viewcnt = viewcnt;
		this.cm_regdate = cm_regdate;
		this.cm_content = cm_content;
		this.mb_email = mb_email;
		this.mb_name = mb_name;
		this.secret = secret;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public Date getCm_regdate() {
		return cm_regdate;
	}
	public void setCm_regdate(Date cm_regdate) {
		this.cm_regdate = cm_regdate;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public boolean isSecret() {
		return secret;
	}
	public void setSecret(boolean secret) {
		this.secret = secret;
	}
}