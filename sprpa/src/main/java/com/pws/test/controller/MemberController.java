package com.pws.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pws.test.service.MemberService;
import com.pws.test.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
    private MemberService memberService;
    
    @PostMapping("/login")
    public String login(MemberVO memberVO, HttpSession session) {
    	boolean loginCheck = memberService.loginCheck(memberVO, session);
    	return "home";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "home";
    }
    
    @GetMapping("/directSignup")
    public String directSignup() throws Exception {
        return "directSignup";
    }
    
    @PostMapping("/addMember")
    public String addMember(MemberVO memberVO, HttpSession session) throws Exception {
        int result = memberService.insertMember(memberVO);
        if(result == 1) {
        	session.setAttribute("loginEmail", memberVO.getMb_email());
        	return "redirect:/";
        }
        else return "directSignup";
    }
}
