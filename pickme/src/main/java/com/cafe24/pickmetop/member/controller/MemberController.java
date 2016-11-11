package com.cafe24.pickmetop.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.repository.MemberDao;
import com.cafe24.pickmetop.member.service.MemberService;



@Controller
@SessionAttributes("generalId")
public class MemberController {
	private  static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired	
	private MemberService memberService;
	MemberDao memberdao;
	
	//01_01 회원 가입 페이지
	@RequestMapping(value="/smemberGeneralInsert")
	public String memberGeneralInsertt(Locale locale, Model model){
		return "/member/general/memberGeneralInsert"; 
	}
	
	//01_02 회원 가입후 메인 페이지
	@RequestMapping(value="/memberGeneralInsert", method = RequestMethod.POST)
	public String memberGeneralInsert(MemberGeneralVo memberGeneralVo){
		memberService.addmemberGeneral(memberGeneralVo);
		return "/index";
	
		}		
	//01_03 회원 로그인
	@RequestMapping(value="/memberGeneralLogin")
	public String memberGeneralLogin(Model model){
		
		return "/member/general/memberGeneralLogin";
	}
	@RequestMapping("/Session.sp")
		public String gender(Model model) {
		model.addAttribute("generalId", "admin@naer.com");
		model.addAttribute("className", this.getClass());
		return "/index.jsp";
	}
	
	
	//01_04 회원 로그인 처리 완료
	@RequestMapping(value="/memberGeneralLogin", method = RequestMethod.POST)
	public ModelAndView memberGeneralLoginn(MemberGeneralVo memberGeneralVo, HttpSession session, HttpServletRequest request, HttpServletResponse response)throws IOException{
		ModelAndView mv = new ModelAndView();
		MemberGeneralVo	loginmember = memberService.selectmemberGeneral(memberGeneralVo);
	
	if(loginmember != null){
		session.setAttribute("memberGeneralLogin", loginmember);

	}else{
		PrintWriter out = (PrintWriter)response.getWriter();
		out.print("<script>alert('아이디 또는 비밀번호가 틀렸습니다');</script>");
		out.flush();
	}
	String redirectPage = request.getParameter("url");
	if(redirectPage == null){
		redirectPage = "/index";
	}
	if(request.getParameter("page")!=null){
		String page = request.getParameter("page");
		redirectPage = redirectPage + "?page="+ page;
	}
	mv.setViewName(redirectPage);
	return mv;
}
	

	//01_05 로그 아웃 페이지
	@RequestMapping(value="/memberGeneralLogout", method = RequestMethod.POST)
	public String memberGeneralLogout(HttpSession session){
	session.invalidate();
	return "/index";
		}
	
	
	
	//01_06 사용자 리스트
	 @RequestMapping(value="/memberGeneralList", method=RequestMethod.GET)
	 public String memberGeneralList(Model model,@RequestParam(value="page", defaultValue="1") int page,
             									 @RequestParam(value="word", required=false) String word) {
		
		 Map <String, Object> memberMap = memberService.getMemberGeneralList(page, word);
		 model.addAttribute("memberGeneraList",memberMap.get("memberGeneralList"));
		 model.addAttribute("page", page);
		 model.addAttribute("startPage",memberMap.get("startPage"));
		 model.addAttribute("endPage", memberMap.get("endPage"));
		
		 return "/member/general/memberGeneralList";
	 }
	 
}

	
