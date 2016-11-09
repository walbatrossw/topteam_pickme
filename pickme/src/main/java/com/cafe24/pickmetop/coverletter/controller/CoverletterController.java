package com.cafe24.pickmetop.coverletter.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.pickmetop.coverletter.model.CoverletterMemberVo;
import com.cafe24.pickmetop.coverletter.service.CoverletterService;

@Controller
public class CoverletterController {
	final static Logger Logger = LoggerFactory.getLogger(CoverletterController.class);
	@Autowired
	private CoverletterService coverletterService;
	
	// 01 자기소개서 리스트(회원이 직접 작성한 자기소개서 리스트)
	@RequestMapping(value="/memberCoverletterList", method = RequestMethod.GET)
	public String memberCoverletterList(Model model){
		model.addAttribute("memberCoverletterList", coverletterService.getMemberCoverletterList());
		Logger.info("회원자기소개서 리스트 : {}", model.toString());
		return "/coverletter/member/memberCoverletterList";
	}
	
	// 02 기업채용공고의 자기소개서 리스트(자기소개서를 검색이나 체크리스트 체크를 통해 입력화면으로 이동)
	@RequestMapping(value="/companyJobCoverletterList", method = RequestMethod.GET)
	public String companyJobCoverletterList(Model model){
		model.addAttribute("companyJobCoverletterList", coverletterService.getCompanyJobCoverletterList());
		Logger.info("기업채용공고의 자기소개서 리스트 {}", model.toString());
		return "/coverletter/admin/companyJobCoverletterList";
	}
	// 03 자기소개서 입력화면() = 하나의 기업채용공고 자기소개서 항목리스트 상세보기
	@RequestMapping(value="/memberCoverletterInsert", method = RequestMethod.GET)
	public String memberCoverletterInsert(Model model, @RequestParam(value="recruitJobCd") String recruitJobCd){
		model.addAttribute("memberCoverletterInsert", coverletterService.getCoverletterCompanyJobVo(recruitJobCd));
		Logger.info("memberCoverletterInsert 자기소개서 입력화면 {}", model.toString());
		Logger.info("recruitJobCd 기업직무코드 {}", recruitJobCd.toString());
		return "/coverletter/member/memberCoverletterInsert";
	}
	// 04 자기소개서 입력처리()
	@RequestMapping(value="/memberCoverletterInsert", method = RequestMethod.POST)
	public String memberCoverletterInsert(Model model, CoverletterMemberVo coverletterMemberVo){
		//model.addAttribute("memberCoverletterInsert", coverletterService.get)
		coverletterService.addMemberCoverletter(coverletterMemberVo);
		return "/coverletter/member/memberCoverletterInsert";
	}
	// 05 자기소개서 상세보기(수정화면과 동일, 저장기록리스트)
	
	// 06 자기소개서 삭제처리(리스트에서 바로 삭제처리)
}
