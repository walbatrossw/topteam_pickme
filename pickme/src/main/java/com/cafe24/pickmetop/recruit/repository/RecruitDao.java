package com.cafe24.pickmetop.recruit.repository;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.pickmetop.admin.model.IndustryTopIndexVo;
import com.cafe24.pickmetop.admin.model.JobMidIndexVo;
import com.cafe24.pickmetop.admin.model.JobTopIndexVo;
import com.cafe24.pickmetop.company.model.CompanyInfoVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;
import com.cafe24.pickmetop.recruit.model.Recruit;
import com.cafe24.pickmetop.recruit.model.RecruitCompany;
import com.cafe24.pickmetop.recruit.model.RecruitCompanyJobVo;
import com.cafe24.pickmetop.recruit.service.RecruitService;

@Repository
public class RecruitDao {
	final static Logger logger = LoggerFactory.getLogger(RecruitDao.class);
	private final String NS = "com.cafe24.pickmetop.recruit.repository.RecruitMapper";
	@Autowired
	@Resource(name = "sqlSessionRecruit")
	private SqlSessionTemplate sqlSessionFactoryRecruit;	
	
	//
	public List<IndustryTopIndexVo> selectAllTopIndustry(){
		return sqlSessionFactoryRecruit.selectList(NS+".selectAllTopIndustry");
	}
	//채용달력 종료일 select 
	public List<Recruit> selectscheduleListByEndDate(String scheduleDate){
		return sqlSessionFactoryRecruit.selectList(NS+".selectscheduleListByEndDate",scheduleDate);
	}

	//채용달력 시작일 select 
	public List<Recruit> selectScheduleListByBeginDate(String scheduleDate){
		return sqlSessionFactoryRecruit.selectList(NS+".selectScheduleListByBeginDate",scheduleDate);
	}
	
	//CoverletterJob의 총열갯수 
	public int getCountOfCoverletterJob(){
		return sqlSessionFactoryRecruit.selectOne(NS+".getCountOfCoverletterJob");
	}
	
	public int insertCoverletterArticle(CoverletterCompanyJobVo cletterArticle){
		return sqlSessionFactoryRecruit.insert(NS+".insertCoverletterArticle",cletterArticle);
	}
	public int insertTemporaryCompany(Recruit recruit){
		return sqlSessionFactoryRecruit.insert(NS+".insertTemporaryCompany",recruit);
	}
	
	//default기업코드 열갯수 
	public int selectDefaultCd(){
		return sqlSessionFactoryRecruit.selectOne(NS+".selectDefaultCd");
	}
	
	//전체 직무 대분류
	public List<JobTopIndexVo> getJopTopIndexCd(){
		return sqlSessionFactoryRecruit.selectList(NS+".getJobTopIndexCd");
	}
	
	//전체 직무 중분류 
	public List<JobMidIndexVo> getJobMidIndexCd(){
		return sqlSessionFactoryRecruit.selectList(NS+".getJobMidIndexCd");
	}
	
	//RecruitCompanyJob의 전체갯수 검색
	public int getCountOfRecruitJob(){
		return sqlSessionFactoryRecruit.selectOne(NS+".getCountOfRecruitJob");
	}
	
	//RecruitCompany 전체 입력갯수를 검색
	public int getCountOfRecruit(){
		return sqlSessionFactoryRecruit.selectOne(NS+".getCountOfRecruit");
	}
	
	//기업명으로 기업코드를 검색
	public String getCompanyCd(String companyName){
		return sqlSessionFactoryRecruit.selectOne(NS+".getCompanyCd",companyName);
	}
	
	//전체 기업명을 검색
	public List<String> selectCompany(){
		return sqlSessionFactoryRecruit.selectList(NS+".selectCompany");
	}
	
	//RecruitCompanyJob입력 
	public int insertRecruitJob(RecruitCompanyJobVo recruitCompanyJobVo){
		return sqlSessionFactoryRecruit.insert(NS+".insertRecruitJob",recruitCompanyJobVo);
	}
	
	
	//RecruitCompany입력
	public int insertRecruitCompany(RecruitCompany recruitCompany){
		return sqlSessionFactoryRecruit.insert(NS+".insertRecruit",recruitCompany);
	}
}
