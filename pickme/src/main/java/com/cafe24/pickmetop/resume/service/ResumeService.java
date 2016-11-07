package com.cafe24.pickmetop.resume.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.pickmetop.resume.model.ResumeAwardVo;
import com.cafe24.pickmetop.resume.model.ResumeCareerVo;
import com.cafe24.pickmetop.resume.model.ResumeCertificateVo;
import com.cafe24.pickmetop.resume.model.ResumeClubVo;
import com.cafe24.pickmetop.resume.model.ResumeEtcVo;
import com.cafe24.pickmetop.resume.model.ResumeFamilyVo;
import com.cafe24.pickmetop.resume.model.ResumeHighschoolVo;
import com.cafe24.pickmetop.resume.model.ResumeLanguageVo;
import com.cafe24.pickmetop.resume.model.ResumeMilitaryserviceVo;
import com.cafe24.pickmetop.resume.model.ResumePersonalVo;
import com.cafe24.pickmetop.resume.model.ResumeTrainingVo;
import com.cafe24.pickmetop.resume.model.ResumeUniversityVo;
import com.cafe24.pickmetop.resume.model.ResumeVo;
import com.cafe24.pickmetop.resume.repository.ResumeDao;

@Service
public class ResumeService {
	final static Logger Logger = LoggerFactory.getLogger(ResumeService.class);
	@Autowired
	ResumeDao resumeDao;
	
	// 01_이력서 입력
	@Transactional
	public void addResume(ResumeVo resumeVo, ResumePersonalVo resumePersonalVo, ResumeHighschoolVo resumeHighschoolVo, ResumeUniversityVo resumeUniversityVo, 
			ResumeFamilyVo resumeFamilyVo, ResumeMilitaryserviceVo resumeMilitaryserviceVo, ResumeCertificateVo resumeCertificateVo, ResumeCareerVo resumeCareerVo, 
			ResumeLanguageVo resumeLanguageVo, ResumeAwardVo resumeAwardVo, ResumeTrainingVo resumeTrainingVo, ResumeClubVo resumeClubVo, ResumeEtcVo resumeEtcVo){
		
		resumeVo.setLoginId("walbatrossw@gmail.com");
		
		resumeDao.insertResume(resumeVo);
		resumeDao.insertResumePersonal(resumePersonalVo);
		resumeDao.insertResumeHighschool(resumeHighschoolVo);
		resumeDao.insertResumeUniversity(resumeUniversityVo);
		resumeDao.insertResumeFamily(resumeFamilyVo);
		resumeDao.insertResumeMilitaryservice(resumeMilitaryserviceVo);
		resumeDao.insertResumeCertificate(resumeCertificateVo);
		resumeDao.insertResumeCareer(resumeCareerVo);
		resumeDao.insertResumeLanguage(resumeLanguageVo);
		resumeDao.insertResumeAward(resumeAwardVo);
		resumeDao.insertResumeTraining(resumeTrainingVo);
		resumeDao.insertResumeClub(resumeClubVo);
		resumeDao.insertResumeEtc(resumeEtcVo);
		Logger.info("이력서 입력 : {}", resumeVo.toString());
		Logger.info("개인신상 입력 : {}", resumePersonalVo.toString());
		Logger.info("고등학교 입력 : {}", resumeHighschoolVo.toString());
		Logger.info("대학교 입력 : {}", resumeUniversityVo.toString());
		Logger.info("가족 입력 : {}", resumeFamilyVo.toString());
		Logger.info("병역 입력 : {}", resumeMilitaryserviceVo.toString());
		Logger.info("자격증 입력 : {}", resumeCertificateVo.toString());
		Logger.info("경력 입력 : {}", resumeCareerVo.toString());
		Logger.info("어학 입력 : {}", resumeLanguageVo.toString());
		Logger.info("수상이력 입력 : {}", resumeAwardVo.toString());
		Logger.info("국내외연수 입력 : {}", resumeTrainingVo.toString());
		Logger.info("동아리, 동호회 입력 : {}", resumeClubVo.toString());
		Logger.info("기타,포트폴리오 입력 : {}", resumeEtcVo.toString());
	}
	
	// 02_이력서 리스트
	public List<ResumeVo> getResumeList(){
		return resumeDao.selectResumeList();
	}
	
	// 03_이력서 상세보기
	public ResumeVo getResumeDetail(String resumeCd){
		return resumeDao.selectResumeDetailByResumeCd(resumeCd);
	}
	
}
