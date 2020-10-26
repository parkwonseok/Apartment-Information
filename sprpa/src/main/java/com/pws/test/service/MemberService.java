package com.pws.test.service;

import java.util.List;

import com.pws.test.vo.MemberVO;

public interface MemberService {
	public List<MemberVO> listMembers();
	public int insertMember(MemberVO memberVO);
}
