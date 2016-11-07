 package com.cafe24.pickmetop.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.cafe24.pickmetop.member.model.MemberGeneralVo;
import com.cafe24.pickmetop.member.model.MemberLinkedVo;
import com.cafe24.pickmetop.member.repository.MemberDao;
import com.cafe24.pickmetop.member.service.MemberService;



@Controller
@SessionAttributes(value={"sessionMemberGeneralVo"})
public class MemberController {
	private  static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired	
	 MemberService memberService;
	MemberDao memberdao;
	//01_01 占싹뱄옙회占쏙옙占쏙옙占쏙옙 占쌉뤄옙화占쏙옙
	@RequestMapping(value="/memberGeneralInsert")
	public String memberGeneralInsertt(){
		return "/member/general/memberGeneralInsert"; 
	}
	//01_02 占싹뱄옙회占쏙옙占쏙옙占쏙옙 占쌉뤄옙처占쏙옙
	@RequestMapping(value="/memberGeneralInsert", method = RequestMethod.POST)
	public String memberGeneralInsert(MemberGeneralVo memberGeneralVo){
		memberService.addmemberGeneral(memberGeneralVo);
		return "/index";
	
		}		
	//01_03  일반회원 로그인 처리
	@RequestMapping(value="/memberGeneralLogin")
	public String memberGeneralLogin(){
		return "/member/general/memberGeneralLogin";
	}
		@RequestMapping(value="/memberGeneralLogin", method = RequestMethod.POST)
	public String memberGeneralLoginn(String memberGeneralVo){
		memberService.selectmemberGeneral(memberGeneralVo);
		return "/index";
	}
			
}
