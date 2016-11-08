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
	public List<CompanyInfoVo> selectCompanyInfoAllList(){
		return sqlSessionFactoryCompany.selectList(NS + ".selectCompanyInfoAllList");
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
	public int selectAllowSearchCount(String jobTopIndexCd, String searchCompanyName){
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("jobTopIndexCd", jobTopIndexCd);
		sqlMap.put("searchCompanyName", searchCompanyName);
		return sqlSessionFactoryCompany.selectOne(NS + ".selectAllowSearchCount", sqlMap);
	}
	/*
	 * ----------------------------------------------------------------------------------------
	 * 
	 * 									   면접후기 관련
	 * 
	 * ----------------------------------------------------------------------------------------
	 * */
	//면접후기 비승인 리스트(관리자)
	public List<CompanyInterviewVo> selectCompanyInterviewListByInterviewUnreceived(PageHelper pageHelper){
		return sqlSessionFactoryCompany.selectList(NS + ".selectCompanyInterviewListByInterviewUnreceived", pageHelper);
	}
}
