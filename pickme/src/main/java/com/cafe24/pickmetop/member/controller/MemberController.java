package com.cafe24.pickmetop.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	//01_01 �뜝�떦諭꾩삕�쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙃琉꾩삕�솕�뜝�룞�삕
	@RequestMapping(value="/memberGeneralInsert")
	public String memberGeneralInsertt(){
		return "/member/general/memberGeneralInsert"; 
	}
	//01_02 �뜝�떦諭꾩삕�쉶�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙃琉꾩삕泥섇뜝�룞�삕
	@RequestMapping(value="/memberGeneralInsert", method = RequestMethod.POST)
	public String memberGeneralInsert(MemberGeneralVo memberGeneralVo){
		memberService.addmemberGeneral(memberGeneralVo);
		return "/index";
	
		}		
	//01_03  �씪諛섑쉶�썝 濡쒓렇�씤 泥섎━
	@RequestMapping(value="/memberGeneralLogin")
	public String memberGeneralLogin(Model model){
		
		return "/member/general/memberGeneralLogin";
	}
		@RequestMapping(value="/memberGeneralLogin", method = RequestMethod.POST)
	public String memberGeneralLoginn(MemberGeneralVo memberGeneralVo, Model model){
		MemberGeneralVo	member = memberService.selectmemberGeneral(memberGeneralVo);
		if(member == null){
			return "/member/general/memberGeneralLogin";
		}
		return "index2";
		}
}
	
