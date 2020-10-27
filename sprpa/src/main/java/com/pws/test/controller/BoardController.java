package com.pws.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pws.test.service.BoardService;
import com.pws.test.service.MemberService;
import com.pws.test.vo.BoardVO;
import com.pws.test.vo.PagingVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value= "/listArticles.do", method = {RequestMethod.GET, RequestMethod.POST})
	public void listArticles() throws Exception {
		List<BoardVO> boardList = boardService.listArticles();
		for(BoardVO board : boardList) {
			System.out.println(board.getTitle());
		}
	}
	
	@RequestMapping(value = "/articleForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String articleForm() {

		return "articleForm";
	}
	
	@RequestMapping(value = "/viewArticle", method = { RequestMethod.GET, RequestMethod.POST })
	public String viewArticle(@RequestParam(value="bno", required=false)String bno, HttpServletRequest request) {
		int bno_int = Integer.parseInt(bno);
		BoardVO boardVO = boardService.getArticleByBno(bno_int);
		request.setAttribute("board", boardVO);
		return "viewArticle";
	}
	
	@RequestMapping(value = "/addArticle", method = { RequestMethod.GET, RequestMethod.POST })
	public String addArticle(BoardVO boardVO, HttpSession session, @RequestParam(value="chk_secret", required=false)String chk_secret) {
		String mb_email = (String) session.getAttribute("loginEmail");
		String mb_name = memberService.getMemberName(mb_email);
		boardVO.setMb_email(mb_email);
		boardVO.setMb_name(mb_name);
		//chk_secret: on / null
		if(chk_secret != null && chk_secret.equals("on")) {
			boardVO.setSecret(1);
		} else {
			boardVO.setSecret(0);
		}
		
		boolean result = boardService.insertArticle(boardVO);
		if (result) {
			return "redirect:/board/boardList";
		} else {
			return "articleForm";
		}
		
	}
	
	@RequestMapping(value = "/removeArticle", method = { RequestMethod.GET, RequestMethod.POST })
	public String removeArticle(@RequestParam("bno") int bno,HttpServletRequest request) {
//		String removeArticle = (String) request.getAttribute("bno"); //input hidden 넘어온(post 방식) name값 저장
		
		boardService.removeArticle(bno);
		
		return "redirect:/board/boardList";
	}
	
	@GetMapping("/boardList")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = boardService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("boardList", boardService.selectBoard(vo));
		return "/boardPaging";
	}
}
