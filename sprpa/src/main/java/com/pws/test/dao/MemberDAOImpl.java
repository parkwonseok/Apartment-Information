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
	public int insertMember(MemberVO memberVO) {
		int result = sqlSession.insert(namespace+"insertMember", memberVO);
	    return result;
	}
}
