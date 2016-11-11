package com.cafe24.pickmetop.recruit.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	/* 채용 수정 처리*/
	@RequestMapping(value="/recruitUpdate")
	public String recruitUpdate(){
		
		return "/recruit/company/companyRecruitUpdate";
	}
	
	
	/* 채용 수정 화면*/
	@RequestMapping(value="/recruitUpdateForm")
	public String recruitUpdateForm(
			@RequestParam(value="recruitCompanyCd", defaultValue="0") String recruitCompanyCd){
		logger.info("recruitCompanyCd : {}",recruitCompanyCd);
		return "/recruit/company/companyRecruitUpdate";
	}
	
	
	/* 채용 디테일*/
	@RequestMapping(value="/recruitDetail")
	public String recruitDetail(Model model,HttpSession session,
			@RequestParam(value="recruitCompanyCd", defaultValue="0") String recruitCompanyCd,
			@RequestParam(value="checked", defaultValue="") String bookmarkChecked){
		logger.info("recruitCd : {}",recruitCompanyCd);
		logger.info("recruitCompanyInfoForDetail :{}",recruitService.selectForRecruitCompanyDetail(recruitCompanyCd));
		model.addAttribute("recruitCompanyInfoForDetail",recruitService.selectForRecruitCompanyDetail(recruitCompanyCd));
		
		//북마크 등록,삭제
		logger.info("bookmarkChecked :{}",bookmarkChecked);
		if(bookmarkChecked!=""){
			recruitService.insertBookmark(recruitCompanyCd,bookmarkChecked,session);
		}
		//북마크 체크여부
		String checkBookmark=recruitService.checkBookmarkByLoginId(session,recruitCompanyCd);
		if(checkBookmark.equals("checkBookmark")){
			model.addAttribute("checkBookmark","checkBookmark");
		}
		return "/recruit/company/companyRecruitDetail"; 
	}

	
	/* 채용 리스트               {} : 배열요청. */
	@RequestMapping(value="/diary")
	public String diary(Model model,HttpSession session,
							@RequestParam(value="ddayYear", defaultValue="0") int ddayYear,
							@RequestParam(value="ddayMonth", defaultValue="0") int ddayMonth,
							@RequestParam(value="ddayOption", defaultValue="default") String ddayOption,
							@RequestParam(value="searchCompanyName", defaultValue="") String searchCompanyName,
							@RequestParam(value="bookmark", defaultValue="") String bookmark,
							@RequestParam(value="jobTopIndexCd", defaultValue="") List<String> jobTopIndexCd,
							@RequestParam(value="industryTopindexCd", defaultValue="") List<String> industryTopindexCd,
							@RequestParam(value="recruitJobWorkstatus", defaultValue="") String recruitJobWorkstatus){
		logger.info("검색어입력후 검색버튼 하면 searchCompanyName:{}",searchCompanyName);
		logger.info("bookmark보기를 누르면 true:{}",bookmark);
		logger.info("jobTopIndexCd[]:{}",jobTopIndexCd);
		logger.info("industryTopindexCd[]:{}",industryTopindexCd);
		logger.info("recruitJobWorkstatus[]:{}",recruitJobWorkstatus);

		Map<String,Object> map = recruitService.getOneDayList(ddayYear,ddayMonth,ddayOption,
				searchCompanyName,bookmark,jobTopIndexCd,industryTopindexCd,recruitJobWorkstatus,session);

		model.addAttribute("oneDayList",map.get("oneDayList"));
		model.addAttribute("ddayYear",map.get("ddayYear"));
		model.addAttribute("ddayMonth",map.get("ddayMonth"));
		model.addAttribute("today",map.get("today"));

		//전체 직무 대분류
		model.addAttribute("jobTopIndex", recruitService.getJobTopIndexCd());
		//전체 산업군 대분류
		model.addAttribute("topIndustry",recruitService.selectAllTopIndustry());
		return "/recruit/company/companyRecruitList";
	}
	
	
	/* 채용 입력 처리 */
	@RequestMapping(value = "/recruitInsert", method = RequestMethod.POST)
	public String recruitInsert(Recruit recruit,HttpSession session,Model model) {
		//파일 타입 검사 메서드 
		boolean result =commons.checkFileType(recruit);
		
		logger.info("tes t{}",recruit.toString());
		//Recruit내 필드의 리스트의 0번째 - List<CoverletterCompanyJobVo> cCletterArticle 의 0번째 이런식
		logger.info("tes t{}",recruit.getRecruitList().get(0).getcCletterArticle().get(0).getCletterArticle());
		
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
			return "redirect:/diary";
		//파일타입이 이미지가 아닐경우
		}else{
			model.addAttribute("errorMsg","콘텐츠타입 불일치");
			
		}
		return "/recruit/company/companyRecruitInsert";
		
	}
	
	
	/* 채용 입력 화면 */
	@RequestMapping(value = "/recruit", method = RequestMethod.GET)
	public String recruitInsert(Model model,HttpSession session) {
		//전체 직무 대분류
		model.addAttribute("jobTopIndex", recruitService.getJobTopIndexCd());
		
		//db에서 가져온 전체 직무중분류 코드와 직무명리스트를 모델에 담는다
		model.addAttribute("jobMidIndex",recruitService.getJobMidIndexCd());
		//logger.info("recruitService.getJobMidIndexCd() : {}",recruitService.getJobMidIndexCd());
		
		//db에서 가져온 전체 기업명리스트를 모델에 담는다
		List<String> companyList = recruitService.selectCompany();
		//logger.info("companyList : {}",companyList);
		model.addAttribute("companyList", companyList);
		
		//test값으로 세션에 아이디 입력
		session.setAttribute("id", "id001");
		return "/recruit/company/companyRecruitInsert";
	}
}
