package com.cafe24.pickmetop.company.controller;

import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.pickmetop.company.model.*;
import com.cafe24.pickmetop.company.service.CompanyService;

@Controller
public class CompanyController {
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Autowired
	CompanyService companyService;
	/*---------------------------------------------------------------------------------- 
	 * 
	 * 									기업메인 관련 맵핑
	 * 
	 * ---------------------------------------------------------------------------------*/	
	
	//기업메인 맵핑
	@RequestMapping(value = "/companyInfo", method = RequestMethod.GET)
	public String companyMain(Locale locale, Model model) {
		model.addAttribute("companyTotalRateList", companyService.getCompanyTotalRateTop());
		return "/companyinfo/companymain";
	}
	@RequestMapping(value = "/company/companyInfoDetail", method = RequestMethod.GET)
	public String companyInfoDetail(Locale locale, Model model,
			@RequestParam(value="companyName") String companyName) {
		logger.info("companyInfoDetail: {}", "들어왔니?");
		model.addAttribute("companyInfoDetail", companyService.getCompnayInfoDetail(companyName));
		return "/companyinfo/companyInfoDetail";
	}
	
	//기업정보페이지 맵핑
	@RequestMapping(value = "/company/companyInfoList", method = RequestMethod.GET)
	public String companyInfoList(Locale locale, Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchCompanyName", defaultValue="") String searchCompanyName) {
		if(page < 1){
			page = 1;
		}
		Map<String, Object> companyInfoMap = companyService.getCompantInfoList(page, searchCompanyName);
		logger.info("startPage: {}", companyInfoMap.get("startPage"));
		logger.info("endPage: {}", companyInfoMap.get("endPage"));
		logger.info("companyInfoList: {}", companyInfoMap.get("companyInfoList").toString());
		
		model.addAttribute("page", page);
		model.addAttribute("searchCompanyName", searchCompanyName);
		model.addAttribute("startPage",companyInfoMap.get("startPage"));
		model.addAttribute("endPage",companyInfoMap.get("endPage"));
		model.addAttribute("companyInfoList", companyInfoMap.get("companyInfoList"));
		return "/companyinfo/companyInfoList";
	}
	
	/*---------------------------------------------------------------------------------- 
	 * 
	 * 									면접후기 관련 맵핑
	 * 
	 * ---------------------------------------------------------------------------------*/	
	//면접후기 등록화면 맵핑
	@RequestMapping(value = "/interview/companyInterviewInsertForm", method = RequestMethod.GET)
	public String companyInterviewInsertForm(Model model) {
		model.addAttribute("companyInfoList", companyService.getCompanyNameList());
		model.addAttribute("jobTopIndexList", companyService.getJobTopIndexList());
		return "/companyinfo/interview/companyInterviewInsert";
	}
	//면접후기 등록처리 맵핑
	@RequestMapping(value = "/interview/companyInterviewInsert", method = RequestMethod.POST)
	public String companyInterviewInsert(Model model, CompanyInterviewVo companyInterviewVo) {
		companyService.addCompnayInterview(companyInterviewVo);
		return "/companyinfo/companymain";
	}
	//면접후기 관리자 디테일 화면 맵핑
	@RequestMapping(value = "/interview/companyInterviewUnreceivedDetail", method = RequestMethod.GET)
	public String companyInterviewUnreceivedDetail(Model model, @RequestParam(value="interviewCd") int interviewCd) {
		logger.info("companyInterviewDetail : {}",companyService.getCompanyInterviewDetail(interviewCd).toString());
		model.addAttribute("companyInterviewDetail",companyService.getCompanyInterviewDetail(interviewCd));
		return "/admin/companyinfo/interview/companyInterviewUnreceivedDetail";
	}
	//면접후기 사용자 디테일 화면 맵핑
	@RequestMapping(value = "/interview/companyInterviewDetail", method = RequestMethod.GET)
	public String companyInterviewDetail(Model model, @RequestParam(value="interviewCd") int interviewCd) {
		logger.info("companyInterviewDetail : {}",companyService.getCompanyInterviewDetail(interviewCd).toString());
		model.addAttribute("companyInterviewDetail",companyService.getCompanyInterviewDetail(interviewCd));
		return "/companyinfo/interview/companyInterviewDetail";
	}
	//면접후기 삭제처리 맵핑
	@RequestMapping(value = "/interview/companyInterviewDelete", method = RequestMethod.GET)
	public String companyInterviewDelete(@RequestParam(value="interviewCd") int interviewCd) {
		companyService.delectCompanyInterview(interviewCd);
		return "redirect:/interview/companyInterviewUnreceivedList";
	}	
	//면접후기 승인처리 맵핑
	@RequestMapping(value = "/interview/companyInterviewAllow", method = RequestMethod.GET)
	public String companyInterviewAllow(@RequestParam(value="interviewCd") int interviewCd) {
		companyService.updateCompanyInterviewAllow(interviewCd);
		return "redirect:/interview/companyInterviewUnreceivedList";
	}
	//면접후기 승인리스트 맵핑
	@RequestMapping(value = "/interview/companyInterviewListAllow", method = RequestMethod.GET)
	public String companyInterviewListAllow(Model model, 
				@RequestParam(value="page", defaultValue="1") int page, 
				@RequestParam(value="jobTopIndexCd", defaultValue="") String jobTopIndexCd,
				@RequestParam(value="searchCompanyName", defaultValue="") String searchCompanyName) {
		
		if(page < 1){
			page = 1;
		}
		logger.info("searchCompanyName : {}",searchCompanyName);
		Map<String, Object> companyInterviewMap = companyService.getCompanyInterviewAllowList(page, jobTopIndexCd, searchCompanyName);
		model.addAttribute("page", page);
		logger.info("jobTopIndexCd : {}",jobTopIndexCd);
		model.addAttribute("searchCompnayName", searchCompanyName);
		model.addAttribute("jobTopIndexCd", jobTopIndexCd);	
		model.addAttribute("jobTopIndexList",companyService.getJobTopIndexList());
		model.addAttribute("interviewListAllow", companyInterviewMap.get("interviewListAllow"));
		logger.info("interviewListAllow : {}",companyInterviewMap.get("interviewListAllow").toString());
		model.addAttribute("startPage", companyInterviewMap.get("startPage"));
		model.addAttribute("endPage", companyInterviewMap.get("endPage"));
		return "/companyinfo/interview/companyInterviewList";
	}
	//면접후기 수정화면 맵핑
	
	
	
	//면접후기 비승인 리스트(관리자) 맵핑
	@RequestMapping(value = "/interview/companyInterviewUnreceivedList", method = RequestMethod.GET)
	public String companyInterviewUnreceivedList(Model model, @RequestParam(value="page", defaultValue="1") int page) {
		if(page < 1){
			page = 1;
		}
		model.addAttribute("page", page);
		model.addAttribute("interviewUnreceivedMap", companyService.getCompanyInterviewUnreceivedList(page));
		return "/admin/companyinfo/interview/companyInterviewUnreceivedList";
	}
	
	/*---------------------------------------------------------------------------------- 
	 * 
	 * 									기업리뷰 관련 맵핑
	 * 
	 * ---------------------------------------------------------------------------------*/	
	
	//기업리뷰 사용자리스트 맵핑
	@RequestMapping(value = "/review/companyReviewListAllow", method = RequestMethod.GET)
	public String companyReviewListAllow(Model model, 
				@RequestParam(value="page", defaultValue="1") int page, 
				@RequestParam(value="jobTopIndexCd", defaultValue="") String jobTopIndexCd,
				@RequestParam(value="searchCompanyName", defaultValue="") String searchCompanyName) {
		
		if(page < 1){
			page = 1;
		}
		logger.info("searchCompanyName : {}",searchCompanyName);
		Map<String, Object> companyReviewMap = companyService.getCompanyReviewAllowList(page, jobTopIndexCd, searchCompanyName);
		model.addAttribute("page", page);
		logger.info("jobTopIndexCd : {}",jobTopIndexCd);
		model.addAttribute("searchCompnayName", searchCompanyName);
		model.addAttribute("jobTopIndexCd", jobTopIndexCd);	
		model.addAttribute("jobTopIndexList",companyService.getJobTopIndexList());
		model.addAttribute("reviewListAllow", companyReviewMap.get("reviewListAllow"));
		logger.info("reviewListAllow : {}",companyReviewMap.get("reviewListAllow").toString());
		model.addAttribute("startPage", companyReviewMap.get("startPage"));
		model.addAttribute("endPage", companyReviewMap.get("endPage"));
		return "/companyinfo/review/companyReviewList";
	}
	//기업리뷰 삭제처리 맵핑
	@RequestMapping(value = "/review/companyReviewDelete", method = RequestMethod.GET)
	public String companyReviewDelete(@RequestParam(value="companyReviewCd") int companyReviewCd) {
		companyService.deleteCompanyReview(companyReviewCd);
		return "redirect:/review/companyReviewUnreceivedList";
	}
	
	//기업리뷰 승인처리 맵핑
	@RequestMapping(value = "/review/companyReviewAllow", method = RequestMethod.GET)
	public String companyReviewAllow(@RequestParam(value="companyReviewCd") int companyReviewCd) {
		companyService.updateCompanyReviewAllow(companyReviewCd);
		return "redirect:/review/companyReviewUnreceivedList";
	}
	
	//기업리뷰 상세보기(관리자)
	@RequestMapping(value = "/review/companyReviewUnreceivedDetail", method = RequestMethod.GET)
	public String companyReviewUnreceivedDetail(Model model, @RequestParam(value="companyReviewCd") int companyReviewCd) {
		model.addAttribute("reviewDetail", companyService.getCompanyReviewDetail(companyReviewCd));
		return "/admin/companyinfo/review/companyReviewUnreceivedDetail";
	}
	
	//기업리뷰 상세보기(사용자)
	@RequestMapping(value = "/review/companyReviewDetail", method = RequestMethod.GET)
	public String companyReviewDetail(Model model, @RequestParam(value="companyReviewCd") int companyReviewCd) {
		model.addAttribute("reviewDetail", companyService.getCompanyReviewDetail(companyReviewCd));
		return "/companyinfo/review/companyReviewDetail";
	}
	
	//기업리뷰 비승인리스트(관리자)
	@RequestMapping(value = "/review/companyReviewUnreceivedList", method = RequestMethod.GET)
	public String companyReviewUnreceivedList(Model model, @RequestParam(value="page", defaultValue="1") int page) {
		if(page < 1){
			page = 1;
		}
		model.addAttribute("page", page);
		model.addAttribute("reviewUnreceivedMap", companyService.getCompanyReviewUnreceivedList(page));
		return "/admin/companyinfo/review/companyReviewUnreceivedList";
	}
	
	//기업리뷰 등록처리 맵핑
	@RequestMapping(value = "/review/companyReviewInsert", method = RequestMethod.POST)
	public String companyReviewInsert(CompanyReviewVo companyReviewVo){
		logger.info("command param companyReview:{}", companyReviewVo.toString());
		companyService.addCompanyReview(companyReviewVo);
		return "/companyinfo/companymain";
	}
	
	//기업리뷰 등록화면 맵핑
	@RequestMapping(value = "/review/companyReviewInsertForm", method = RequestMethod.GET)
	public String companyReviewInsertForm(Model model) {
		model.addAttribute("companyInfoList", companyService.getCompanyNameList());
		model.addAttribute("jobTopIndexList", companyService.getJobTopIndexList());
		return "/companyinfo/review/companyReviewInsert";
	}
}
