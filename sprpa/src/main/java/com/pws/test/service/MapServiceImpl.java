package com.pws.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pws.test.dao.MapDAO;
import com.pws.test.vo.MapVO;

@Service
public class MapServiceImpl implements MapService {
	@Autowired
	MapDAO mapDAO;
	
	@Override
	public List<MapVO> selectMapData(String address) {
		List<MapVO> list = mapDAO.selectMapData(address);
		return list;
	}

	@Override
	public MapVO selectData(String address) {
		MapVO mapVO = mapDAO.selectData(address);
		return mapVO;
	}
}
