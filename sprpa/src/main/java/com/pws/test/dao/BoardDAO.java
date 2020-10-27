package com.pws.test.dao;

import java.util.List;

import com.pws.test.vo.BoardVO;

public interface BoardDAO {
	List<BoardVO> selectAllArticlesList();
	boolean insertArticle(BoardVO boardVO);
	BoardVO getArticleByBno(int bno);
	void removeArticle(int bno);
}
