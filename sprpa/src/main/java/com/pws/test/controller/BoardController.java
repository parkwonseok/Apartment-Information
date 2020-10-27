package com.pws.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pws.test.service.BoardService;
import com.pws.test.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping(value= "/listArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void listArticles() throws Exception {
		List<BoardVO> boardList = boardService.listArticles();
		for(BoardVO board : boardList) {
			System.out.println(board.getTitle());
		}
	}
}
