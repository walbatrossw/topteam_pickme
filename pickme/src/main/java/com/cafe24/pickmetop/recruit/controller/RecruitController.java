package com.cafe24.pickmetop.recruit.controller;

import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cafe24.pickmetop.recruit.model.Recruit;
import com.cafe24.pickmetop.recruit.service.RecruitService;
import com.cafe24.pickmetop.recruit.service.Commons;

@Controller
public class RecruitController {
	final static Logger logger = LoggerFactory.getLogger(RecruitController.class);
	@Autowired
	@Resource
	RecruitService recruitService;	
	@Autowired
	Commons commons;
	
	/* 채용 삭제*/
	/* 채용 리스트 */
	
	/* 채용 입력 처리 */
	@RequestMapping(value = "/recruitInsert", method = RequestMethod.POST)
	public String recruitInsert(Recruit recruit,HttpSession session,Model model) {
		//파일 타입 검사 메서드 
		boolean result =commons.checkFileType(recruit);
		//파일 타입이 이미지일경우 
		if(result){
			//기업명으로 기업코드를 검색한다
			String companyCd = recruitService.getCompanyCd(recruit.getCompanyName());
			recruit.setCompanyCd(companyCd);
			if(companyCd==null){//db내에 입력하고자하는 기업이 없을때 
				//임의의 코드값을 만든다
				int a = recruitService.selectDefaultCd() +1;
				String newConpanyCd = "default" + a;
				//코드값을 vo에 셋팅한다 
				recruit.setCompanyCd(newConpanyCd);
				//기업 table에 임의의 코드값과 화면에서 입력받은 기업명을 insert한다.
				recruitService.insertTemporaryCompany(recruit);
				logger.info("recruit.getCompanyCd(): {}",recruit.getCompanyCd());
			}
				recruitService.insertRecruitCompany(recruit,session);
				recruitService.insertRecruitCompanyJob(recruit);	
			return "index";
		//파일타입이 이미지가 아닐경우
		}else{
			model.addAttribute("errorMsg","콘텐츠타입 불일치");
			return "/recruit/company/companyRecruitInsert";
		}
		
	}
	
	/* 채용 입력 화면 */
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruitInsert(Model model,HttpSession session) {
		//전체 직무 대분류
		model.addAttribute("jobTopIndex", recruitService.getJobTopIndexCd());
		
		//db에서 가져온 전체 직무중분류 코드와 직무명리스트를 모델에 담는다
		model.addAttribute("jobMidIndex",recruitService.getJobMidIndexCd());
		logger.info("recruitService.getJobMidIndexCd() : {}",recruitService.getJobMidIndexCd());
		
		//db에서 가져온 전체 기업명리스트를 모델에 담는다
		List<String> companyList = recruitService.selectCompany();
		logger.info("companyList : {}",companyList);
		model.addAttribute("companyList", companyList);
		
		//test값으로 세션에 아이디 입력
		session.setAttribute("id", "id001");
		return "/recruit/company/companyRecruitInsert";
	}
}
