package com.pws.test.dao;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.pws.test.vo.BoardVO;




public interface BoardDAO {

	List<BoardVO> selectAllArticlesList();
}
