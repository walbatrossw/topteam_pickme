package com.cafe24.pickmetop.company.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.pickmetop.admin.model.JobTopIndexVo;
import com.cafe24.pickmetop.commons.PageHelper;
import com.cafe24.pickmetop.company.model.*;
import com.cafe24.pickmetop.company.repository.CompanyDao;


@Service
public class CompanyService {
	private static final Logger logger = LoggerFactory.getLogger(CompanyService.class);
	private final int MAX_LINE_COUNT = 5; //보여질 글의 수
    private final int MAX_PAGE_COUNT = 5; //보여질 최대 페이지 수
    
	@Autowired
	CompanyDao companyDao;
	/*---------------------------------------------------------------------------------- 
	 * 									기업메인 관련
	 * ---------------------------------------------------------------------------------*/
	//기업 총점 Top10
	public List<CompanyInfoVo> getCompanyTotalRateTop(){
		return companyDao.selectCompanyByTotalRate();
	}
	/*---------------------------------------------------------------------------------- 
	 * 									기업정보 페이지
	 * ---------------------------------------------------------------------------------*/ 
	//기업들의 모든 리스트 뷰 (기업명으로 검색가능)
	public Map<String, Object> getCompantInfoList(int page, String searchCompanyName){
		PageHelper pageHelper = new PageHelper(page,MAX_LINE_COUNT);
		pageHelper.setLastPage(companyDao.selectCompanyInfoListCount(searchCompanyName), MAX_LINE_COUNT);
		Map<String, Object> companyInfoMap = new HashMap<String, Object>();
		Map<String, Object> companyoInfoSearchMap = new HashMap<String, Object>();
		
		companyoInfoSearchMap.put("pageHelp", pageHelper);
		companyoInfoSearchMap.put("searchCompanyName", searchCompanyName);
		
		companyInfoMap.put("startPage", pageHelper.startPage(page, MAX_PAGE_COUNT));
		companyInfoMap.put("endPage", pageHelper.endPage());
		companyInfoMap.put("companyInfoList", companyDao.selectCompanyInfoList(companyoInfoSearchMap));
		logger.info("listsize : {}", companyDao.selectCompanyInfoList(companyoInfoSearchMap).size());
		return companyInfoMap;
	}
	//기업정보 디테일
	public CompanyInfoVo getCompnayInfoDetail(String companyName){
		return companyDao.selectCompanyInfoDetailByCompanyName(companyName);
	}
	
	/*---------------------------------------------------------------------------------- 
	 * 									면접후기 관련
	 * ---------------------------------------------------------------------------------*/ 
	//면접후기 등록
	public int addCompnayInterview(CompanyInterviewVo companyInterviewVo){
		companyInterviewVo.setCompanyCd(companyDao.selectCompanyInfoByCompanyCd(companyInterviewVo.getCompanyName()));
		companyInterviewVo.setLoginId("kji212@naver.com");
		return companyDao.insertCompanyInterview(companyInterviewVo);
	}
	//면접후기 비승인 목록
	public Map<String, Object> getCompanyInterviewUnreceivedList(int page){
		//비승인목록 페이지 처리
		PageHelper pageHelper = new PageHelper(page,MAX_LINE_COUNT);
		//승인상태값 0로 비승인상태인것만 갯수를 얻어와서 마지막페이지 SET
		String tbName = "tb_company_interview";
		String tbColumn = "interview_allow";
		pageHelper.setLastPage(companyDao.selectAllowTotalCount(tbName, tbColumn, 0),MAX_LINE_COUNT);
		Map<String, Object> interviewUnreceivedMap = new HashMap<String, Object>();
		interviewUnreceivedMap.put("startPage", pageHelper.startPage(page, MAX_PAGE_COUNT));
		interviewUnreceivedMap.put("endPage", pageHelper.endPage());
		interviewUnreceivedMap.put("interviewListUnreceived", companyDao.selectCompanyInterviewListByInterviewUnreceived(pageHelper));
		return interviewUnreceivedMap;
	}
	//면접후기 디테일
	public CompanyInterviewVo getCompanyInterviewDetail(int interviewCd){
		return companyDao.selectCompanyInterviewDetailByCompanyInterviewCd(interviewCd);
	}
	//면접후기 승인처리
	public int updateCompanyInterviewAllow(int interviewCd){
		Map<String, Object> allow = new HashMap<String, Object>();
		allow.put("loginId", "admin");
		allow.put("interviewCd", interviewCd);
		return companyDao.updateCompanyInterviewAllow(allow);
	}
	//면접후기 삭제처리
	public int delectCompanyInterview(int interviewCd){
		return companyDao.deleteCompanyInterview(interviewCd);
	}
	
	 /*---------------------------------------------------------------------------------- 
	 * 									기업리뷰 관련
	 * ---------------------------------------------------------------------------------*/ 
	 
	//기업리뷰목록(승인)
	public Map<String, Object> getCompanyReviewAllowList(int page, String jobTopIndexCd, String searchCompanyName){
		//승인목록 페이지 처리
		PageHelper pageHelper = new PageHelper(page,MAX_LINE_COUNT);
		String tbName = "tb_company_review";
		String tbColumn = "review_allow";
		//승인상태값 1로 승인상태인것만 갯수를 얻어와서 마지막페이지 SET
		if(jobTopIndexCd.equals("") && searchCompanyName.equals("")){
			logger.info("null");
			pageHelper.setLastPage(companyDao.selectAllowTotalCount(tbName, tbColumn, 1),MAX_LINE_COUNT);
		}else{
			logger.info("not null : {}", companyDao.selectAllowSearchCount(jobTopIndexCd, searchCompanyName));
			pageHelper.setLastPage(companyDao.selectAllowSearchCount(jobTopIndexCd, searchCompanyName),MAX_LINE_COUNT);
		}
		//페이징 처리에서 시작페이지와 끝페이지
		Map<String, Object> reviewAllowMap = new HashMap<String, Object>();
		reviewAllowMap.put("startPage", pageHelper.startPage(page, MAX_PAGE_COUNT));
		reviewAllowMap.put("endPage", pageHelper.endPage());
		
		//검색된 페이지 수와 검색조건들 맵
		Map<String, Object> reviewSearchMap = new HashMap<String, Object>();
		reviewSearchMap.put("pageHelp", pageHelper);
		reviewSearchMap.put("jobTopIndexCd", jobTopIndexCd);
		reviewSearchMap.put("searchCompanyName", searchCompanyName);
		logger.info("pageHelper {}", pageHelper.toString());
		logger.info("jobTopIndexCd {}", jobTopIndexCd.toString());
		logger.info("searchCompanyName {}", searchCompanyName.toString());
		reviewAllowMap.put("reviewListAllow", companyDao.selectCompanyReviewListByReviewAllow(reviewSearchMap));
		return reviewAllowMap;
	}
	
	//기업리뷰 삭제처리
	public int deleteCompanyReview(int companyReviewCd){
		return companyDao.deleteCompanyReview(companyReviewCd);
	}
	
	//기업리뷰 승인처리
	public int updateCompanyReviewAllow(int companyReviewCd){
		Map<String, Object> allow = new HashMap<String, Object>();
		allow.put("loginId", "admin");
		allow.put("companyReviewCd", companyReviewCd);
		companyDao.updateCompanyInfoTotalRate(allow);
		return companyDao.updateCompanyReviewAllow(allow);
	}
	//기업리뷰 상세보기
	public CompanyReviewVo getCompanyReviewDetail(int companyReviewCd){
		return companyDao.selectCompanyListByReviewCd(companyReviewCd);
	}
	
	//기업리뷰목록(비승인)
	public Map<String, Object> getCompanyReviewUnreceivedList(int page){
		//비승인목록 페이지 처리
		PageHelper pageHelper = new PageHelper(page,MAX_LINE_COUNT);
		String tbName = "tb_company_review";
		String tbColumn = "review_allow";
		//승인상태값 0로 비승인상태인것만 갯수를 얻어와서 마지막페이지 SET
		pageHelper.setLastPage(companyDao.selectAllowTotalCount(tbName, tbColumn, 0),MAX_LINE_COUNT);
		Map<String, Object> reviewUnreceivedMap = new HashMap<String, Object>();
		reviewUnreceivedMap.put("startPage", pageHelper.startPage(page, MAX_PAGE_COUNT));
		reviewUnreceivedMap.put("endPage", pageHelper.endPage());
		reviewUnreceivedMap.put("reviewListUnreceived", companyDao.selectCompanyReviewListByReviewUnreceived(pageHelper));
		return reviewUnreceivedMap;
	}
	
	//기업리뷰등록(사용자) 메서드
	public int addCompanyReview(CompanyReviewVo companyReviewVo){
		companyReviewVo.setCompanyCd(companyDao.selectCompanyInfoByCompanyCd(companyReviewVo.getCompanyName()));
		companyReviewVo.setLoginId("kji212@naver.com");
		/*SimpleDateFormat setToday;
		setToday = new SimpleDateFormat("yyyy-mm-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DATE, 1);
		String today = setToday.format(calendar.getTime());
		companyReviewVo.setReviewRegDate(today);
		companyReviewVo.setReviewModiDate(today);
		logger.info("CompanyService -> today {}",today);*/
		logger.info("CompanyService -> companyCd2 {}", companyReviewVo.getCompanyCd());
		return companyDao.insertCompanyReview(companyReviewVo);
	}
	
	//기업이름 리스트목록 메서드
	public List<CompanyInfoVo> getCompanyNameList(){
		return companyDao.selectCompanyNameList();
	}
	
	//직무중분류 리스트 목록 메서드
	public List<JobTopIndexVo> getJobTopIndexList(){
		return companyDao.selectJobTopIndexAllList();
	}
	
}
