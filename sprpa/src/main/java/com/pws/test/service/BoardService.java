package com.pws.test.service;

import java.util.List;

import com.pws.test.vo.BoardVO;
import com.pws.test.vo.PagingVO;

public interface BoardService {
	public List<BoardVO> listArticles() throws Exception;
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<BoardVO> selectBoard(PagingVO vo);
}
