package com.cafe24.pickmetop.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.repository.MemberDao;
import com.cafe24.pickmetop.member.service.MemberService;



@Controller
@SessionAttributes(value={"sessionMemberGeneralVo"})
public class MemberController {
	private  static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired	
	private MemberService memberService;
	MemberDao memberdao;
	//01_01 회원 가입 페이지
	@RequestMapping(value="/smemberGeneralInsert")
	public String memberGeneralInsertt(){
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
	//01_04 회원 로그인 처리 완료
	@RequestMapping(value="/memberGeneralLogin", method = RequestMethod.POST)
	public String memberGeneralLoginn(MemberGeneralVo memberGeneralVo, Model model){
	MemberGeneralVo	member = memberService.selectmemberGeneral(memberGeneralVo);
	if(member == null){
			return "/member/general/memberGeneralLogin";
		}
		return "index2";
		}		
	//01_05 로그 아웃 페이지
	@RequestMapping(value="/memberGeneralLogout", method = RequestMethod.POST)
	public String memberGeneralLogout(HttpSession session){
	session.removeAttribute("userId");
	return "redirect:/";
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
		
		 return "/memberGeneralList";
	 }
	 
	


}

	
