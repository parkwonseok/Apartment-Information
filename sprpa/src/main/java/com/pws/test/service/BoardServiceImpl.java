package com.pws.test.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pws.test.dao.BoardDAO;
import com.pws.test.vo.BoardVO;
import com.pws.test.vo.PagingVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;
	@Autowired
    SqlSession sqlSession;
    
	String namespace = "board.";
	@Override
	public List<BoardVO> listArticles() throws Exception {
		List<BoardVO> boardList =  boardDAO.selectAllArticlesList();
        return boardList;
	
	}

	@Override
	public boolean insertArticle(BoardVO boardVO) {
		boolean result = boardDAO.insertArticle(boardVO);
		return result;
	}
	
	@Override
	public int countBoard() {
		return sqlSession.selectOne(namespace+"countBoard");
		
	}

	@Override
	public List<BoardVO> selectBoard(PagingVO vo) {
		List<BoardVO> boardList  = sqlSession.selectList(namespace+"selectBoard", vo);
		return boardList;
		
	}

	@Override
	public BoardVO getArticleByBno(int bno) {
		BoardVO result = boardDAO.getArticleByBno(bno);
		return result;
	}

	@Override
	public void removeArticle(int bno) {
		boardDAO.removeArticle(bno);
		
	}
}
