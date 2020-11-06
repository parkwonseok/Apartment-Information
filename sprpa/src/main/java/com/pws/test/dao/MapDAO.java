package com.pws.test.dao;

import java.util.List;

import com.pws.test.vo.MapVO;

public interface MapDAO {
	public List<MapVO> selectMapData(String address);
	public MapVO selectData(String address);
}
