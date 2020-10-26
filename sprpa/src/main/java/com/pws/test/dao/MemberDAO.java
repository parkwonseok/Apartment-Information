package com.pws.test.dao;

import java.util.List;

import com.pws.test.vo.MemberVO;

public interface MemberDAO {
	public List<MemberVO> selectAllMemberList();
	public MemberVO loginCheck(MemberVO memberVO);
	public int insertMember(MemberVO memberVO);
}
