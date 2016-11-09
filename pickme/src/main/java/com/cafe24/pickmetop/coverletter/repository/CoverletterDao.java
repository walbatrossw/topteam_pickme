package com.cafe24.pickmetop.coverletter.repository;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;
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
	
	// 02 기업채용공고의 자기소개서 리스트(자기소개서를 검색이나 체크리스트 체크를 통해 입력화면으로 이동)
	public List<CoverletterCompanyJobVo> selectCoverletterCompanyJobList(){
		return sqlSessionFactoryCoverletter.selectList(nameSpace+".selectCoverletterCompanyJobList");
	}
	
	// 03 자기소개서 입력화면() = 하나의 기업채용공고 자기소개서 항목리스트 상세보기
	public CoverletterCompanyJobVo selectCoverletterCompanyJobByRecruitJobCd(String recruitJobCd){
		return sqlSessionFactoryCoverletter.selectOne(nameSpace+".selectCoverletterCompanyJobByRecruitJobCd", recruitJobCd);
	}
	
	public int insertMemberCoverletter(CoverletterMemberVo coverletterMemberVo){
		return sqlSessionFactoryCoverletter.insert(nameSpace+".insertMemberCoverletter", coverletterMemberVo);
	}
}
