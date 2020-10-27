package com.pws.test.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.pws.test.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> listMembers();
	public boolean loginCheck(MemberVO memberVO, HttpSession session);
	public int insertMember(MemberVO memberVO);
	public String getMemberName(String mb_email);
}
