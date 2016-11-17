package com.cafe24.pickmetop.member.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.repository.MemberDao;
import com.cafe24.pickmetop.member.service.MemberService;



@Controller

@Scope
public class MemberController {
	private  static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired	
	private MemberService memberService;
	MemberDao memberdao;
	
	// 회원가입 폼
	@RequestMapping(value="/memberGeneralInsert")
	public String memberGeneralInsertt(){
		return "/member/general/memberGeneralInsert";
	}
	// 로그인 폼
	@RequestMapping(value="/memberGeneralLogin")
	public String memberGeneralLoginn(){
		return "/member/general/memberGeneralLogin";
	}
	
	//01_02 회원 가입후 메인 페이지
	@RequestMapping(value="/memberGeneralInsert", method = RequestMethod.POST)
	public String memberGeneralInsert(MemberGeneralVo memberGeneralVo){
		memberService.addmemberGeneral(memberGeneralVo);
		return "/index";
	}

		
	// 회원 로그인 처리 완료
	@RequestMapping(value="/memberGeneralLogin", method = RequestMethod.POST)
	public String memberGeneralLogin(HttpServletRequest request,
			@RequestParam(value="generalId") String generalId,
			@RequestParam(value="generalPw") String generalPw) {
		Map<String, String> memberGeneralLogin = memberService.selectMemberCheck(generalId, generalPw);
				
		if(memberGeneralLogin != null){
			HttpSession session  = request.getSession(true);
			
			session.setAttribute("generalId", generalId);
			session.setAttribute("generalPw",  generalPw);
			
			session.setAttribute("generalNick", memberGeneralLogin.get("generalNick"));
			session.setAttribute("generalLevel", memberGeneralLogin.get("generalLevel"));
		}
		return "/index";

	}

	//01_05 로그 아웃 페이지
	@RequestMapping(value="/memberGeneralLogout", method = RequestMethod.GET)
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

	
