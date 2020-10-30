package com.pws.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pws.test.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
    SqlSession sqlSession;
    
    String namespace = "member.";
    
    @Override
    public List<MemberVO> selectAllMemberList() {
    	List<MemberVO> result = sqlSession.selectList(namespace+"selectAllMemberList");
        return result;
    }

	@Override
	public MemberVO loginCheck(MemberVO memberVO) {
		MemberVO result = sqlSession.selectOne(namespace+"loginCheck", memberVO);
		return result;
	}
	
	@Override
	public int insertMember(MemberVO memberVO) {
		int result = sqlSession.insert(namespace+"insertMember", memberVO);
	    return result;
	}
	
	@Override
	public String getMemberName(String mb_email) {
		MemberVO vo = sqlSession.selectOne(namespace+"getMemberName", mb_email);
		String mb_name =  vo.getMb_name();
		return mb_name;
	}

	@Override
	public MemberVO memberCheck(String email) {
		MemberVO memberVO = sqlSession.selectOne(namespace+"memberCheck", email);
		return memberVO;
	}

	@Override
	public int insertSocialMember(MemberVO memberVO) {
		int result = sqlSession.insert(namespace+"insertSocialMember", memberVO);
	    return result;
	}
}
