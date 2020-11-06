package com.pws.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pws.test.service.MapService;
import com.pws.test.vo.MapVO;

@RestController
@RequestMapping("/rest")
public class MapRestController {
	@Autowired
	MapService mapService;
	
	@GetMapping("/map")
	public List<MapVO> map(HttpServletRequest request) {
		String address = request.getParameter("addr");
		List<MapVO> list = mapService.selectMapData(address);
		return list;
	}
}
