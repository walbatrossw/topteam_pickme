package com.cafe24.pickmetop.coverletter.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobInfoVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberArticleSaveVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberArticleVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberVo;

@Repository
public class CoverletterDao {
	final static Logger logger = LoggerFactory.getLogger(CoverletterDao.class);
	private final String nameSpace = "com.cafe24.pickmetop.coverletter.repository.CoverletterMapper";
	@Autowired
	@Resource(name="sqlSessionCoverletter")
	private SqlSessionTemplate sqlSessionFactoryCoverletter;
	
	// 01 회원이 작성한 자기소개서 리스트
	public List<CoverletterMemberVo> selectCoverletterMemberList(){
		return sqlSessionFactoryCoverletter.selectList(nameSpace + ".selectCoverletterMemberList");
	}
	
	// 02 기업채용공고의 직무별리스트(자기소개서를 검색이나 체크리스트 체크를 통해 입력화면으로 이동)
	public List<CoverletterCompanyJobInfoVo> selectCoverletterCompanyJobList(){
		return sqlSessionFactoryCoverletter.selectList(nameSpace+".selectCoverletterCompanyJobList");
	}
	
	// 03_01 자기소개서 입력화면(채용기업명/채용명/채용직무/채용상세직무/채용마감일자)
	public CoverletterCompanyJobInfoVo selectOneCletterCompanyJobInfo(String recruitJobCd){
		logger.info("자소서입력화면 : 직무별 채용정보 {} ", recruitJobCd.toString());
		return sqlSessionFactoryCoverletter.selectOne(nameSpace+".selectOneCletterCompanyJobInfo", recruitJobCd);
	}
	
	// 03_02 자기소개서 입력화면(자기소개서 항목리스트)
	public List<CoverletterCompanyJobVo> selectListCletterArticleByJobCd(String recruitJobCd){
		logger.info("자소서입력화면: 자소서항목리스트 {}", recruitJobCd.toString());
		return sqlSessionFactoryCoverletter.selectList(nameSpace+".selectListCletterArticleByJobCd", recruitJobCd);
	}
	
	// 03_03 자기소개서 입력처리
	public int insertCoverletter(CoverletterMemberVo coverletterMember){
		return sqlSessionFactoryCoverletter.insert(nameSpace + ".insertCoverletter", coverletterMember);
	}
	// 03_04 자기소개서 항목 입력처리
	public int insertCoverletterArticle(CoverletterMemberArticleVo memberArticle){
		return sqlSessionFactoryCoverletter.insert(nameSpace + ".insertCoverletterArticle", memberArticle);
	}
	// 03_05 자기소개서 저장기록 입력처리
	public int insertCoverletterSaveRecord(CoverletterMemberArticleSaveVo saveRecord){
		return sqlSessionFactoryCoverletter.insert(nameSpace + ".insertCoverletterSaveRecord", saveRecord);
	}
	
	// 04_01 회원의 자기소개서 정보
	public CoverletterMemberVo selectOneMemeberCoverletterInfo(String mCletterCd){
		logger.info("자기소개서 정보 : {}", mCletterCd.toString());
		return sqlSessionFactoryCoverletter.selectOne(nameSpace+".selectOneMemeberCoverletterInfo", mCletterCd);
	}
	
	// 04_02 회원이 작성한 자기소개서 항목 및 내용 리스트
	public List<CoverletterMemberArticleVo> selectMemeberCoverletterArticleList(String mCletterCd){
		logger.info("자기소개서 항목 및 내용 리스트 : {}", mCletterCd.toString());
		return sqlSessionFactoryCoverletter.selectList(nameSpace+".selectMemeberCoverletterArticleList", mCletterCd);
	}
	
	// 04_03 회원이 작성한 자기소개서 저장기록
	public CoverletterMemberArticleSaveVo selectMemeberCoverletterArticleSaveRecord(String mCletterCd){
		logger.info("자기소개서 저장기록 : {}", mCletterCd.toString());
		return sqlSessionFactoryCoverletter.selectOne(nameSpace+".selectMemeberCoverletterArticleSaveRecord", mCletterCd);
	}
	
}
