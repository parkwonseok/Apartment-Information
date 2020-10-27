package com.pws.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pws.test.dao.BoardDAO;
import com.pws.test.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> listArticles() throws Exception {
		List<BoardVO> boardList =  boardDAO.selectAllArticlesList();
        return boardList;
	
	}
}
