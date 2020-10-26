package com.pws.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
    @GetMapping("/signupForm")
    public String addMember() throws Exception {
        return "signupForm";
    }
    @PostMapping("/addMember")
    public String addMember(MemberVO memberVO) throws Exception {
        int result = memberService.insertMember(memberVO);
        if(result == 1) return "redirect:/";
        else return "signupForm";
    }
 //폼에 대한 모든 요청을 처리하기 위한 컨트롤러 매핑 메소드
 	@RequestMapping(value = "/*Form.do", method = RequestMethod.GET)
 	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
 			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
 			HttpServletResponse response) throws Exception {
 		// 인터페이스가 추출하여 리퀘스트에 붙여준 뷰 이름을 받아서 저장 - 그 뷰를 반환하려고
 		String viewName = (String) request.getAttribute("viewName");
 		// 리퀘스트에서 세션 객체를 받아서 저장 - 없으면 새로 생성해서 저장
 		HttpSession session = request.getSession();
 		// 세션에 action 속성을 만들고 파라미터로 받은 action 변수의 값을 부착
 		session.setAttribute("action", action);
 		System.out.println("session>>>>>> " + session.getLastAccessedTime());
 		ModelAndView mav = new ModelAndView();
 		// ModelAndView 객체에 파라미터로 받은 result 부착
 		mav.addObject("result", result);
 		mav.setViewName(viewName);
 		return mav;
 	}
}
