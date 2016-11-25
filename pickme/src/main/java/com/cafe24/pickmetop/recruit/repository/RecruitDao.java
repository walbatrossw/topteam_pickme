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
import com.cafe24.pickmetop.recruit.model.RecruitCompanyBookmarkVo;
import com.cafe24.pickmetop.recruit.model.RecruitCompanyJobVo;
import com.cafe24.pickmetop.recruit.service.RecruitService;

@Repository
public class RecruitDao {
	final static Logger logger = LoggerFactory.getLogger(RecruitDao.class);
	private final String NS = "com.cafe24.pickmetop.recruit.repository.RecruitMapper";
	@Autowired
	@Resource(name = "sqlSessionRecruit")
	private SqlSessionTemplate sqlSessionFactoryRecruit;	
	
	//자기소개서 갯수 
	public int countCletter(String recruitJobCd){
		return sqlSessionFactoryRecruit.selectOne(NS+".countCletter",recruitJobCd);
	}
	//수정화면
	public List<Recruit> recruitUpdateForm(String recruitCompanyCd){
		return sqlSessionFactoryRecruit.selectList(NS+".recruitUpdateForm",recruitCompanyCd);
	}
	
	
	//달력 전체 시작일 리스트& 검색
	public List<Recruit> selectBeginListOnSearchKeyword(Map companySearchMap){
		return sqlSessionFactoryRecruit.selectList(NS+".selectBeginListOnSearchKeyword",companySearchMap);
	}
	
	//달력 전체 종료일 리스트& 검색
	public List<Recruit> selectEndListOnSearchKeyword(Map companySearchMap){
		logger.info("cd : {}" ,companySearchMap.get("jobTopIndexCd"));
		return sqlSessionFactoryRecruit.selectList(NS+".selectEndListOnSearchKeyword",companySearchMap);
	}
	
	//loginId로 북마크 확인 
	public String checkBookmarkByLoginId(RecruitCompanyBookmarkVo recruitCompanyBookmarkVo){
		String aa = sqlSessionFactoryRecruit.selectOne(NS+".checkBookmarkByLoginId",recruitCompanyBookmarkVo);
		logger.info("aa : {} ",aa);
		
		return sqlSessionFactoryRecruit.selectOne(NS+".checkBookmarkByLoginId",recruitCompanyBookmarkVo);
	}
	//loginId 북마크 삭제 
	public int deleteBookmark(RecruitCompanyBookmarkVo recruitCompanyBookmarkVo){
		logger.info("recruitCompanyBookmarkVo : {}",recruitCompanyBookmarkVo);
		return sqlSessionFactoryRecruit.delete(NS+".deleteBookmark",recruitCompanyBookmarkVo);
	}
	//loginId 북마크 등록
	public int insertBookmark(RecruitCompanyBookmarkVo recruitCompanyBookmarkVo){
		logger.info("recruitCompanyBookmarkVo : {}",recruitCompanyBookmarkVo);
		return sqlSessionFactoryRecruit.insert(NS+".insertBookmark",recruitCompanyBookmarkVo);
	}
	
	//채용 디테일 
	public List<Recruit> selectForRecruitCompanyDetail(String recruitCompanyCd){
		logger.info("recruitCompanyCd : {} ", recruitCompanyCd);
		return sqlSessionFactoryRecruit.selectList(NS+".selectForRecruitCompanyDetail",recruitCompanyCd);
	}
	
	//산업군topindex 전체 리스트
	public List<IndustryTopIndexVo> selectAllTopIndustry(){
		return sqlSessionFactoryRecruit.selectList(NS+".selectAllTopIndustry");
	}

	//CoverletterJob의 마지막코드 
	public int getCountOfCoverletterJob(){
		return sqlSessionFactoryRecruit.selectOne(NS+".getCountOfCoverletterJob");
	}
	//자소서 항목입력
	public int insertCoverletterArticle(CoverletterCompanyJobVo cletterArticle){
		return sqlSessionFactoryRecruit.insert(NS+".insertCoverletterArticle",cletterArticle);
	}
	//임시기업입력
	public int insertTemporaryCompany(Recruit recruit){
		return sqlSessionFactoryRecruit.insert(NS+".insertTemporaryCompany",recruit);
	}
	
	//임시기업코드 열갯수 
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
	
	//RecruitCompanyJob의 마지막 Code
	public int getCountOfRecruitJob(){
		return sqlSessionFactoryRecruit.selectOne(NS+".getCountOfRecruitJob");
	}
	
	//RecruitCompany 의 마지막 Code
	public int getCountOfRecruit(){
		return sqlSessionFactoryRecruit.selectOne(NS+".getCountOfRecruit");
	}
	
	//기업명으로 기업코드를 검색
	public String getCompanyCd(String companyName){
		return sqlSessionFactoryRecruit.selectOne(NS+".getCompanyCd",companyName);
	}
	
	//전체 기업명
	public List<String> selectCompany(){
		return sqlSessionFactoryRecruit.selectList(NS+".selectCompany");
	}
	
	//RecruitCompanyJob 입력 
	public int insertRecruitJob(RecruitCompanyJobVo recruitCompanyJobVo){
		return sqlSessionFactoryRecruit.insert(NS+".insertRecruitJob",recruitCompanyJobVo);
	}
	
	
	//RecruitCompany 입력
	public int insertRecruitCompany(RecruitCompany recruitCompany){
		return sqlSessionFactoryRecruit.insert(NS+".insertRecruit",recruitCompany);
	}
}
