package com.pws.test.service;

import java.util.List;

import com.pws.test.vo.BoardVO;

public interface BoardService {
	public List<BoardVO> listArticles() throws Exception;
}
