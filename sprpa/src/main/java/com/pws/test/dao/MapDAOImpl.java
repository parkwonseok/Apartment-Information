package com.pws.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pws.test.vo.MapVO;

@Repository
public class MapDAOImpl implements MapDAO {
	@Autowired
	SqlSession sqlSession;

	String namespace = "map.";
	
	@Override
	public List<MapVO> selectMapData(String address) {
		address += "%";
		List<MapVO> list = sqlSession.selectList(namespace + "selectMapData", address);
		return list;
	}

	@Override
	public MapVO selectData(String address) {
		address += "%";
		MapVO mapVO = sqlSession.selectOne(namespace + "selectData", address);
		return mapVO;
	}
}
