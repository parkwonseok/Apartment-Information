package com.pws.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pws.test.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
    SqlSession sqlSession;
	
	String namespace = "board.";
	
	@Override
	public List<BoardVO> selectAllArticlesList() {
		List<BoardVO> boardList  = sqlSession.selectList(namespace+"selectAllboardList");
		return boardList;
	}
}
