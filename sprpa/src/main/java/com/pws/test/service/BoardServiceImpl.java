package com.pws.test.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.pws.test.dao.BoardDAO;
import com.pws.test.vo.BoardVO;



@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl  implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	@Override
	public List<BoardVO> listArticles() throws Exception {
		List<BoardVO> boardList =  boardDAO.selectAllArticlesList();
        return boardList;
	
	}
}
