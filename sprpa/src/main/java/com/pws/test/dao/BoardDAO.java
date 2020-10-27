package com.pws.test.dao;

import java.util.List;

import com.pws.test.vo.BoardVO;

public interface BoardDAO {
	List<BoardVO> selectAllArticlesList();
}
