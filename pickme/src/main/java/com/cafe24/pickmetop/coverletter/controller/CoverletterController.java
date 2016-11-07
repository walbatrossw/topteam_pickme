package com.cafe24.pickmetop.coverletter.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;
import com.cafe24.pickmetop.coverletter.service.CoverletterService;


@Controller
public class CoverletterController {
	
	final static Logger Logger = LoggerFactory.getLogger(CoverletterController.class);
	
	@Autowired
	private CoverletterService coverletterService;
	// 01 관리자 자기소개서 입력화면 
	@RequestMapping(value="/companyJobCoverletterInsert", method = RequestMethod.GET)
	public String companyJobCoverletterInsert(){
		return "/coverletter/admin/companyJobCoverletterInsert";
	}
	// 02 관리자 자기소개서 입력처리
	@RequestMapping(value="/coverletter/admin/companyJobCoverletterInsert", method = RequestMethod.POST)
	public String companyJobCoverletterInsert(CoverletterCompanyJobVo coverletterCompanyJobVo){
		Logger.info(" 입력 : {}", coverletterCompanyJobVo.toString());
		coverletterService.addCompanyJobCoverletter(coverletterCompanyJobVo);
		return "/coverletter/admin/companyJobCoverletterList";
	}
	
}
