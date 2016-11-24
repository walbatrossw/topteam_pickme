package com.cafe24.pickmetop.coverletter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobInfoVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberArticleSaveVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberArticleVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberVo;
import com.cafe24.pickmetop.coverletter.repository.CoverletterDao;


@Service
public class CoverletterService {
	final static Logger logger = LoggerFactory.getLogger(CoverletterService.class);
	@Autowired
	CoverletterDao coverletterDao;
	
	// 00 나의 페이지 마감임박 기업채용공고(10개)
	public List<CoverletterCompanyJobInfoVo> getCompanyJobCoverletterListForInfo(String LoginId){
		return coverletterDao.selectCoverletterCompanyJobListForInfo(LoginId);
	}
	
	// 01 자기소개서 리스트(회원이 직접 작성한 자기소개서 리스트)
	public List<CoverletterMemberVo> getMemberCoverletterList(String loginId){
		return coverletterDao.selectCoverletterMemberList(loginId);
	}
	
	// 02 기업채용공고의 자기소개서 리스트(자기소개서를 검색이나 체크리스트 체크를 통해 입력화면으로 이동)
	public List<CoverletterCompanyJobInfoVo> getCompanyJobCoverletterList(){
		return coverletterDao.selectCoverletterCompanyJobList();
	}
	
	// 03_01 자기소개서 입력화면(자기소개서이름(채용기업명+채용명+상세직무), 자기소개서 제출 마감일자, 채용직무의 자기소개서항목리스트)
	public Map<String, Object> getCompanyOneJobCletter(String recruitJobCd){
		Map<String, Object> companyOneJobMap = new HashMap<String, Object>();
		companyOneJobMap.put("companyOneJobCletterInfo", coverletterDao.selectOneCletterCompanyJobInfo(recruitJobCd));
		logger.info("companyOneJobCletterInfo {}", companyOneJobMap.toString());
		companyOneJobMap.put("companyOneJobArticleList", coverletterDao.selectListCletterArticleByJobCd(recruitJobCd));
		logger.info("companyOneJobArticleList {}", companyOneJobMap.toString());
		return companyOneJobMap;
	}
	
	// 03_02 자기소개서 입력처리(자기소개서 이름/마감시간/문항/내용)
	public void addCoverletter(CoverletterMemberVo coverletterMember, 
							CoverletterMemberArticleVo memberArticle,
							CoverletterMemberArticleSaveVo saveRecord,
							HttpSession session
							){
		coverletterMember.setLoginId((String) session.getAttribute("generalId"));
		coverletterDao.insertCoverletter(coverletterMember);
		coverletterDao.insertCoverletterArticle(memberArticle);
		coverletterDao.insertCoverletterSaveRecord(saveRecord);
		logger.info("coverletterMember {}", coverletterMember.toString());
		logger.info("memberArticle {}", memberArticle.toString());
		logger.info("saveRecord {}", saveRecord.toString());
	}
	
	// 03_02 자기소개서 상세보기
	public Map<String, Object> getMemberCoverletter(String mCletterCd){
		Map<String, Object> memberCoverletterMap = new HashMap<String, Object>();
		memberCoverletterMap.put("memeberCoverletterInfo", coverletterDao.selectOneMemeberCoverletterInfo(mCletterCd));
		logger.info("memeberCoverletterInfo {}", memberCoverletterMap.toString());
		memberCoverletterMap.put("memeberCoverletterArticleList", coverletterDao.selectMemeberCoverletterArticleList(mCletterCd));
		logger.info("memeberCoverletterArticleList {}", memberCoverletterMap.toString());
		memberCoverletterMap.put("memeberCoverletterArticleSaveRecord", coverletterDao.selectMemeberCoverletterArticleSaveRecord(mCletterCd));
		logger.info("memeberCoverletterArticleSaveRecord {}", memberCoverletterMap.toString());
		return memberCoverletterMap;
	}
	
	// 04_01 나의 자기소개서 & 이력서 메인
	public Map<String, Object> getMemberInfo(String loginId){
		return null;
	}
	
	// 05_01_01 합격자기소개서 리스트(팝업용:사용자)
	// 05_01_02 합격자기소개서 리스트(관리자페이지용: 관리자)
	// 05_02 합격자기소개서 입력폼
	// 05_03 합격자기소개서 입력처리
	// 05_04 합격자기소개서 상세보기
	// 05_05 합격자기소개서 수정
	// 05_06 합격자기소개서 삭제
	
	
}
