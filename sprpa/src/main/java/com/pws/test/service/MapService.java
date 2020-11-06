package com.pws.test.service;

import java.util.List;

import com.pws.test.vo.MapVO;

public interface MapService {
	public List<MapVO> selectMapData(String address);
	public MapVO selectData(String address);
}
