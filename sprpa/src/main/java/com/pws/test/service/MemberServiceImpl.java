package com.pws.test.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.pws.test.dao.MemberDAO;
import com.pws.test.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
    private MemberDAO memberDAO;
 
    @Override
    public List<MemberVO> listMembers() throws DataAccessException {
    	List<MemberVO> membersList = memberDAO.selectAllMemberList();
        return membersList;
    }

	@Override
	public boolean loginCheck(MemberVO memberVO, HttpSession session) {
		MemberVO result = memberDAO.loginCheck(memberVO);
		if(result != null) {
			session.setAttribute("loginEmail", result);
			return true;
		}
		else return false;
	}
	
	@Override
	public int insertMember(MemberVO memberVO) {
		int result = memberDAO.insertMember(memberVO);
	    return result;
	}
}
