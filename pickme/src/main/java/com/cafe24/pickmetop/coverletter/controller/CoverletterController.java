package com.cafe24.pickmetop.coverletter.controller;

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

import com.cafe24.pickmetop.coverletter.model.CoverletterMemberArticleSaveVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberArticleVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberVo;
import com.cafe24.pickmetop.coverletter.service.CoverletterService;

@Controller
public class CoverletterController {
	final static Logger Logger = LoggerFactory.getLogger(CoverletterController.class);
	@Autowired
	private CoverletterService coverletterService;
	
	
	// 00 이력서 및 자기소개서 나의 정보페이지 
	@RequestMapping(value="/resumeCoverletterInfo", method = RequestMethod.GET)
	public String resumeCoverletterInfo(Model model, HttpSession session){
		String loginId = (String) session.getAttribute("generalId");
		model.addAttribute("companyJobCoverletterListForInfo", coverletterService.getCompanyJobCoverletterListForInfo(loginId));
		Logger.info("Session : loginId {} " , loginId);
		Logger.info("자기소개서 메인페이지:{}" , model.toString());
		if(loginId == null) {
			return "/member/general/memberGeneralLogin";
		}
		return "/resumecoverletter/resumeCoverletterInfo";
	}                          
	
	// 01_01 자기소개서 리스트(회원이 직접 작성한 자기소개서 리스트) : 리스트페이지 맵핑
	@RequestMapping(value="/memberCoverletterList", method = RequestMethod.GET)
	public String memberCoverletterList(Model model, HttpSession session){
		String loginId = (String) session.getAttribute("generalId");
		model.addAttribute("memberCoverletterList", coverletterService.getMemberCoverletterList(loginId));
		Logger.info("Session : loginId {} " , loginId);
		Logger.info("회원자기소개서 리스트 : {}", model.toString());
		if(loginId == null){
			return "/member/general/memberGeneralLogin";
		}
		return "/resumecoverletter/coverletter/member/memberCoverletterList";
	}
	
	// 01_02 자기소개서 리스트(회원이 직접 작성한 자기소개서 리스트) : 모달페이지 맵핑
	@RequestMapping(value="/memberCoverletterListForModal", method = RequestMethod.GET)
	public String memberCoverletterListForMordal(Model model, HttpSession session){
		String loginId = (String) session.getAttribute("generalId");
		model.addAttribute("memberCoverletterListForModal", coverletterService.getMemberCoverletterList(loginId));
		Logger.info("Session : loginId {} " , loginId);
		Logger.info("회원자기소개서 리스트 for Mordal : {}", model.toString());
		if(loginId == null){
			return "/member/general/memberGeneralLogin";
		}
		return "/resumecoverletter/coverletter/member/memberCoverletterListForModal";
	}
	
	// 02 기업채용공고의 자기소개서 리스트(자기소개서를 검색이나 체크리스트 체크를 통해 입력화면으로 이동)
	@RequestMapping(value="/companyJobCoverletterList", method = RequestMethod.GET)
	public String companyJobCoverletterList(Model model){
		model.addAttribute("companyJobCoverletterList", coverletterService.getCompanyJobCoverletterList());
		Logger.info("기업채용공고의 자기소개서 리스트 {}", model.toString());
		return "/resumecoverletter/coverletter/admin/companyJobCoverletterList"; 
	}
	                                                     
	// 03_01 자기소개서 입력화면(채용직무코드/채용기업명/채용명/직무중분류명/상세직무명/채용마감일자/기업자기소개서항목리스트)
	@RequestMapping(value="/memberCoverletterInsert", method = RequestMethod.GET)
	public String memberCoverletterInsertForm(Model model, @RequestParam(value="recruitJobCd") String recruitJobCd, HttpSession session){
		Map<String, Object> companyOneJobCletter = coverletterService.getCompanyOneJobCletter(recruitJobCd);
		Logger.info("자기소개서 입력화면 {}", model.toString());
		model.addAttribute("companyOneJobCletterInfo", companyOneJobCletter.get("companyOneJobCletterInfo"));
		Logger.info("companyOneJobCletterInfo : {}", companyOneJobCletter.get("companyOneJobCletterInfo").toString());
		model.addAttribute("companyOneJobArticleList", companyOneJobCletter.get("companyOneJobArticleList"));
		Logger.info("companyOneJobArticleList : {}", companyOneJobCletter.get("companyOneJobArticleList").toString());
		return "/resumecoverletter/coverletter/member/memberCoverletterInsert";
	}
	
	// 03_02 자기소개서 입력처리(자기소개서 이름/마감시간/문항/내용)
	@RequestMapping(value="/memberCoverletterInsert", method = RequestMethod.POST)
	public String memberCoverletterInsert(CoverletterMemberVo coverletterMember, 
										CoverletterMemberArticleVo memberArticle, 
										CoverletterMemberArticleSaveVo saveRecord, 
										HttpSession session){
		coverletterService.addCoverletter(coverletterMember, memberArticle, saveRecord, session);
		Logger.info("coverletterMember {}", coverletterMember.toString());
		Logger.info("memberArticle {}", memberArticle.toString());
		Logger.info("saveRecord {}", saveRecord.toString());
		
		return "redirect:/memberCoverletterList";
	}
	
	// 04_01 회원이 작성한 자기소개서 상세보기  
	@RequestMapping(value="/memberCoverletterDetail", method = RequestMethod.GET)
	public String memberCoverletterDetail(Model model, @RequestParam(value="mCletterCd") String mCletterCd){
		Map<String, Object> memberCoverletter = coverletterService.getMemberCoverletter(mCletterCd);
		model.addAttribute("memeberCoverletterInfo", memberCoverletter.get("memeberCoverletterInfo"));
		Logger.info("memeberCoverletterInfo {}", model.toString());
		model.addAttribute("memeberCoverletterArticleList", memberCoverletter.get("memeberCoverletterArticleList"));
		Logger.info("memeberCoverletterArticleList{}", model.toString());
		model.addAttribute("memeberCoverletterArticleSaveRecord", memberCoverletter.get("memeberCoverletterArticleSaveRecord"));
		Logger.info("memeberCoverletterArticleSaveRecord{}", model.toString());
		return "/resumecoverletter/coverletter/member/memberCoverletterDetail";
	}
	
	// 04_01 회원이 작성한 자기소개서 업데이트  
	@RequestMapping(value="/memberCoverletterUpdateForm", method = RequestMethod.GET)
	public String memberCoverletterUpdateForm(Model model, @RequestParam(value="mCletterCd") String mCletterCd){
		Map<String, Object> memberCoverletter = coverletterService.getMemberCoverletter(mCletterCd);
		model.addAttribute("memeberCoverletterInfo", memberCoverletter.get("memeberCoverletterInfo"));
		Logger.info("memeberCoverletterInfo {}", model.toString());
		model.addAttribute("memeberCoverletterArticleList", memberCoverletter.get("memeberCoverletterArticleList"));
		Logger.info("memeberCoverletterArticleList{}", model.toString());
		model.addAttribute("memeberCoverletterArticleSaveRecord", memberCoverletter.get("memeberCoverletterArticleSaveRecord"));
		Logger.info("memeberCoverletterArticleSaveRecord{}", model.toString());
		return "/resumecoverletter/coverletter/member/memberCoverletterUpdate";
	}	
		
}
