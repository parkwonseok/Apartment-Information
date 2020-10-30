package com.pws.test.dao;

import java.util.List;

import com.pws.test.vo.MemberVO;

public interface MemberDAO {
	public List<MemberVO> selectAllMemberList();
	public MemberVO loginCheck(MemberVO memberVO);
	public int insertMember(MemberVO memberVO);
	public int insertSocialMember(MemberVO memberVO);
	public String getMemberName(String mb_email);
	public MemberVO memberCheck(String email);
}
