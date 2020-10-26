package com.pws.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pws.test.service.MemberService;
import com.pws.test.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
    private MemberService memberService;
    
    @RequestMapping(value="/showList" ,method = RequestMethod.GET)
    public String listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<MemberVO> membersList = memberService.listMembers();
        for(MemberVO mb : membersList) {
        	System.out.println(mb.getMb_email());
        }
        return "home";
    }
}
