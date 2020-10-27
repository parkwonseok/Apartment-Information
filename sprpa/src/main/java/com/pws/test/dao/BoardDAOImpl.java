package com.pws.test.dao;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.pws.test.vo.BoardVO;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	String namespace = "board.";
	@Autowired
    SqlSession sqlSession;
	
	@Override
	public List<BoardVO> selectAllArticlesList() {
		List<BoardVO> boardList  = sqlSession.selectList(namespace+"selectAllboardList");
		return boardList;
	}
}
