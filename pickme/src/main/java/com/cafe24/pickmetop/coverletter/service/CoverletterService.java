package com.cafe24.pickmetop.coverletter.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterMemberVo;
import com.cafe24.pickmetop.coverletter.repository.CoverletterDao;


@Service
public class CoverletterService {
	final static Logger logger = LoggerFactory.getLogger(CoverletterService.class);
	@Autowired
	CoverletterDao coverletterDao;
	
	// 01 자기소개서 리스트(회원이 직접 작성한 자기소개서 리스트)
	public List<CoverletterMemberVo> getMemberCoverletterList(){
		return coverletterDao.selectCoverletterMemberList();
	}
	
	// 02 기업채용공고의 자기소개서 리스트(자기소개서를 검색이나 체크리스트 체크를 통해 입력화면으로 이동)
	public List<CoverletterCompanyJobVo> getCompanyJobCoverletterList(){
		return coverletterDao.selectCoverletterCompanyJobList();
	}
	
	// 03 자기소개서 입력처리
	public void addMemberCoverletter(CoverletterMemberVo coverletterMemberVo){
		coverletterDao.insertMemberCoverletter(coverletterMemberVo);
	}
}
