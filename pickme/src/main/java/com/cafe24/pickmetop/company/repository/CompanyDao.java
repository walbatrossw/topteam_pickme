package com.cafe24.pickmetop.company.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.pickmetop.admin.model.JobTopIndexVo;
import com.cafe24.pickmetop.commons.PageHelper;
import com.cafe24.pickmetop.company.model.*;
import com.cafe24.pickmetop.company.service.CompanyService;

@Repository 
public class CompanyDao {
	private static final Logger logger = LoggerFactory.getLogger(CompanyDao.class);
	final String NS = "com.cafe24.pickmetop.company.repository.CompanyMapper";
	@Autowired
	@Resource(name = "sqlSessionCompany")
	private SqlSessionTemplate sqlSessionFactoryCompany;
	/*
	 * ----------------------------------------------------------------------------------------
	 * 
	 * 									   기업메인페이지 관련
	 * 
	 * ----------------------------------------------------------------------------------------
	 * */
	public List<CompanyInfoVo> selectCompanyByTotalRate(){
		return sqlSessionFactoryCompany.selectList(NS + ".selectCompanyByTotalRate");
	}
	/*
	 * ----------------------------------------------------------------------------------------
	 * 
	 * 									   기업정보페이지 관련
	 * 
	 * ----------------------------------------------------------------------------------------
	 * */
	public List<CompanyInfoVo> selectCompanyInfoList(Map<String, Object> companyInfoMap){
		return sqlSessionFactoryCompany.selectList(NS + ".selectCompanyInfoList", companyInfoMap);
	}
	
	public int selectCompanyInfoListCount(String searchCompanyName){
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("searchCompanyName", searchCompanyName);
		return sqlSessionFactoryCompany.selectOne(NS + ".selectCompanyInfoListCount", sqlMap);
	}
	
	public CompanyInfoVo selectCompanyInfoDetailByCompanyName(String companyName){
		return sqlSessionFactoryCompany.selectOne(NS + ".selectCompanyInfoDetailByCompanyName", companyName);
	}
	/*
	 * ----------------------------------------------------------------------------------------
	 * 
	 * 									   기업리뷰 관련
	 * 
	 * ----------------------------------------------------------------------------------------
	 * */	
	//기업리뷰 목록(승인)
	public List<CompanyReviewVo> selectCompanyReviewListByReviewAllow(Map<String, Object> reviewSearchMap){
		return sqlSessionFactoryCompany.selectList(NS +".selectCompanyReviewListByReviewAllow", reviewSearchMap);
	}
	//기업리뷰등록(사용자) 메서드
	public int insertCompanyReview(CompanyReviewVo companyReviewVo){
		return sqlSessionFactoryCompany.insert(NS + ".insertCompanyReview", companyReviewVo);
	}
	//기업코드검색
	public String selectCompanyInfoByCompanyCd(String companyName){
		return sqlSessionFactoryCompany.selectOne(NS + ".selectCompanyInfoByCompanyCd", companyName);
	}
	
	//기업정보 테이블에서 기업이름 리스트 전체
	public List<CompanyInfoVo> selectCompanyNameList(){
		return sqlSessionFactoryCompany.selectList(NS + ".selectCompanyNameList");
	}
	//직무중분류 테이블에서 리스트 전체
	public List<JobTopIndexVo> selectJobTopIndexAllList(){
		return sqlSessionFactoryCompany.selectList(NS + ".selectJobTopIndexAllList");
	}
	//기업리뷰목록(비승인)
	public List<CompanyReviewVo> selectCompanyReviewListByReviewUnreceived(PageHelper pageHelper){
		return sqlSessionFactoryCompany.selectList(NS + ".selectCompanyReviewListByReviewUnreceived", pageHelper);
	}
	//기업리뷰상세보기
	public CompanyReviewVo selectCompanyListByReviewCd(int companyReviewCd){
		return sqlSessionFactoryCompany.selectOne(NS + ".selectCompanyListByReviewCd", companyReviewCd);
	}
	//기업리뷰승인 업데이트
	public int updateCompanyReviewAllow(Map<String, Object> allow){
		return sqlSessionFactoryCompany.update(NS + ".updateCompanyReviewAllow", allow);
	}
	//기업리뷰승인시 평점누적
	public int updateCompanyInfoTotalRate(Map<String, Object> allow){
		return sqlSessionFactoryCompany.update(NS + ".updateCompanyInfoTotalRate", allow);
	}
	//기업리뷰삭제
	public int deleteCompanyReview(int companyReviewCd){
		return sqlSessionFactoryCompany.delete(NS + ".deleteCompanyReview", companyReviewCd);
	}
	//기업리뷰 목록 카운트
	public int selectAllowTotalCount(String tbName, String tbColumn, int allow){
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("tbName", tbName);
		sqlMap.put("tbColumn", tbColumn);
		sqlMap.put("allow", allow);
		return sqlSessionFactoryCompany.selectOne(NS + ".selectAllowTotalCount", sqlMap);
	}
	public int selectAllowSearchCount(String tbName, String tbColumn, String jobTopIndexCd, String searchCompanyName){
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("tbName", tbName);
		sqlMap.put("tbColumn", tbColumn);
		sqlMap.put("jobTopIndexCd", jobTopIndexCd);
		sqlMap.put("searchCompanyName", searchCompanyName);
		return sqlSessionFactoryCompany.selectOne(NS + ".selectAllowSearchCount", sqlMap);
	}
	public int updateCompnayReviewLikeByuserChoice(Map<String, Object> sqlMap){
		return sqlSessionFactoryCompany.update(NS + ".updateCompnayReviewLikeByuserChoice", sqlMap);
	}
	/*
	 * ----------------------------------------------------------------------------------------
	 * 
	 * 									   면접후기 관련
	 * 
	 * ----------------------------------------------------------------------------------------
	 * */
	//면접후기 등록
	public int insertCompanyInterview(CompanyInterviewVo companyInterviewVo){
		return sqlSessionFactoryCompany.insert(NS + ".insertCompanyInterview", companyInterviewVo);
	}
	//면접후기 비승인 리스트(관리자)
	public List<CompanyInterviewVo> selectCompanyInterviewListByInterviewUnreceived(PageHelper pageHelper){
		return sqlSessionFactoryCompany.selectList(NS + ".selectCompanyInterviewListByInterviewUnreceived", pageHelper);
	}
	//면접후기 승인 리스트
	public List<CompanyInterviewVo> selectCompanyInterviewListByInterviewAllow(Map<String, Object> interviewSearchMap){
		return sqlSessionFactoryCompany.selectList(NS + ".selectCompanyInterviewListByInterviewAllow", interviewSearchMap);
	}
	//면접후기 디테일
	public CompanyInterviewVo selectCompanyInterviewDetailByCompanyInterviewCd(int interviewCd){
		return sqlSessionFactoryCompany.selectOne(NS + ".selectCompanyInterviewDetailByCompanyInterviewCd", interviewCd);
	}
	//면접후기 승인 업데이트
	public int updateCompanyInterviewAllow(Map<String, Object> allow){
		return sqlSessionFactoryCompany.update(NS + ".updateCompanyInterviewAllow", allow);
	}
	//면접후기 삭제처리
	public int deleteCompanyInterview(int interviewCd){
		return sqlSessionFactoryCompany.delete(NS + ".deleteCompanyInterview", interviewCd);
	}
	/*
	 * ----------------------------------------------------------------------------------------
	 * 
	 * 									  연봉정보 관련
	 * 
	 * ----------------------------------------------------------------------------------------
	 * */
	//연봉정보 등록
	public int insertCompanySalary(CompanySalaryVo companySalaryVo){
		return sqlSessionFactoryCompany.insert(NS + ".insertCompanySalary", companySalaryVo);
	}
	//연봉정보 미승인 리스트
	public List<CompanySalaryVo> selectCompanySalaryListBySalaryUnreceived(PageHelper pageHelper){
		return sqlSessionFactoryCompany.selectList(NS + ".selectCompanySalaryListBySalaryUnreceived", pageHelper);
	}
	//연봉정보 디테일(관리자)
	public CompanySalaryVo selectCompanySalaryDetailBySalaryCd(int salaryCd){
		return sqlSessionFactoryCompany.selectOne(NS + ".selectCompanySalaryDetailBySalaryCd", salaryCd);
	}
	//연봉정보 승인처리
	public int updateCompanySalaryAllow(Map<String, Object> sqlMap){
		return sqlSessionFactoryCompany.update(NS + ".updateCompanySalaryAllow", sqlMap);
	}
	//연봉정보 승인하면 연봉정보 통계 테이블 업데이트
	public int updateCompanyStatisticsSalary(Map<String, Object> sqlMap){
		return sqlSessionFactoryCompany.update(NS + ".updateCompanyStatisticsSalary", sqlMap);
	}
	//연봉정보 삭제처리
	public int deleteCompanySalary(int salaryCd){
		return sqlSessionFactoryCompany.update(NS + ".deleteCompanySalary", salaryCd);
	}
	//연봉정보 통계
	public CompanyStatisticsVo selectCompanyStatisticsSalaryByCompanyName(String companyName){
		return sqlSessionFactoryCompany.selectOne(NS + ".selectCompanyStatisticsSalaryByCompanyName", companyName);
	}
}
