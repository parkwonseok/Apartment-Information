package com.pws.test.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pws.test.service.MapService;
import com.pws.test.vo.MapVO;

@Controller
@RequestMapping("/map")
public class MapController {
	@Autowired
	MapService mapService;
	
	@GetMapping("/show")
	public String show(String sido, String gugun, HttpServletRequest request) throws IOException, ParseException {
		String address = sido + " " + gugun;
		MapVO mapVO = mapService.selectData(address);
		request.setAttribute("address", address);
		request.setAttribute("longitude", mapVO.getLongitude());
		request.setAttribute("latitude", mapVO.getLatitude());
		return "kakaomap";
	}
}
