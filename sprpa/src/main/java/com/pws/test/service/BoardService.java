package com.pws.test.service;

import java.util.List;

import com.pws.test.vo.BoardVO;
import com.pws.test.vo.PagingVO;

public interface BoardService {
	public List<BoardVO> listArticles() throws Exception;
	// 게시물 총 갯수
	public int countBoard();
	
	public boolean insertArticle(BoardVO boardVO);

	// 페이징 처리 게시글 조회
	public List<BoardVO> selectBoard(PagingVO vo);
	
	// 게시글 번호를 이용해서 찾기
	public BoardVO getArticleByBno(int bno);
	
	// 게시글 삭제
	public void removeArticle(int bno);
	
}
