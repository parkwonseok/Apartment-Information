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
		List<BoardVO> boardList = sqlSession.selectList(namespace + "selectAllboardList");
		return boardList;
	}

	@Override
	public boolean insertArticle(BoardVO boardVO) {
		int result = sqlSession.insert(namespace + "insertArticle", boardVO);
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public BoardVO getArticleByBno(int bno) {
		BoardVO result = sqlSession.selectOne(namespace + "getArticleByBno", bno);
		return result;
	}

	@Override
	public void removeArticle(int bno) {
		sqlSession.delete(namespace + "removeArticle", bno);

	}

	@Override
	public void modifyArticle(BoardVO boardVO) {
		sqlSession.update(namespace + "modifyArticle", boardVO);

	}

	@Override
	public boolean insertReply(BoardVO boardVO, int bno) {
		int result = sqlSession.update(namespace + "insertReply", boardVO);
		if (result == 1) {
			return true;
		} else {
			return false;
		}
	}
}
