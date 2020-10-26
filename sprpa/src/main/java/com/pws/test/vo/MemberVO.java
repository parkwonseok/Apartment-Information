package com.pws.test.vo;

public class MemberVO {
	private String mb_email;
	private String mb_pw;
	private String mb_name;
	
	public MemberVO(String mb_email, String mb_pw, String mb_name) {
		super();
		this.mb_email = mb_email;
		this.mb_pw = mb_pw;
		this.mb_name = mb_name;
	}
	
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
}
