package com.cafe24.pickmetop.resume.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
	
	/****증명사진 및 포트폴리오 파일 저장 로컬 디렉토리****/
	/*HOME LOCAL*/
	//final String imgDir = "C:\\Users\\DoubleS\\Desktop\\TeamProject\\Workspace\\Git\\topteam_pickme\\pickme\\src\\main\\webapp\\upload\\resumefile\\photo";
	//final String pdfDir = "C:\\Users\\DoubleS\\Desktop\\TeamProject\\Workspace\\Git\\topteam_pickme\\pickme\\src\\main\\webapp\\upload\\resumefile\\portfolio";
	
	/*KSMART LOCAL*/
	final String imgDir = "C:\\Users\\202-09\\Desktop\\PickMe_Workspace\\TeamGit\\topteam_pickme\\pickme\\src\\main\\webapp\\upload\\resumefile\\photo";
	final String pdfDir = "C:\\Users\\202-09\\Desktop\\PickMe_Workspace\\TeamGit\\topteam_pickme\\pickme\\src\\main\\webapp\\upload\\resumefile\\portfolio";
	
	// 01_이력서 입력
	@Transactional
	public void addResume(ResumeVo resumeVo, 
			ResumePersonalVo resumePersonalVo, 
			ResumeHighschoolVo resumeHighschoolVo, 
			ResumeUniversityVo resumeUniversityVo, 
			ResumeFamilyVo resumeFamilyVo, 
			ResumeMilitaryserviceVo resumeMilitaryserviceVo, 
			ResumeCertificateVo resumeCertificateVo, 
			ResumeCareerVo resumeCareerVo, 
			ResumeLanguageVo resumeLanguageVo, 
			ResumeAwardVo resumeAwardVo, 
			ResumeTrainingVo resumeTrainingVo, 
			ResumeClubVo resumeClubVo, 
			ResumeEtcVo resumeEtcVo, 
			HttpServletRequest request, 
			HttpSession session){
		
		/*CAFE24 배포시(사진 및 포트폴리오 저장)*/
		//final String imgDir = request.getSession().getServletContext().getRealPath("/")+"upload/resumefile/photo";
		//final String pdfDir = request.getSession().getServletContext().getRealPath("/")+"upload/resumefile/portfolio";
		
		/****이력서 증명사진 입력****/
		
		// 증명사진 파일명 생성 = 파일명 + 시스템time
		MultipartFile personalPhotoFile = resumePersonalVo.getPersonalPhotoFile();
		String savePhotoFileName = resumePersonalVo.getPersonalPhotoFile().getOriginalFilename().substring(0, resumePersonalVo.getPersonalPhotoFile().getOriginalFilename().length()-4);
		String photoExt = personalPhotoFile.getOriginalFilename().substring(personalPhotoFile.getOriginalFilename().lastIndexOf(".")+1);
		photoExt = photoExt.toLowerCase();
		savePhotoFileName = savePhotoFileName + "_" + System.currentTimeMillis() + "." + photoExt;
		resumePersonalVo.setPersonalPhotoName(savePhotoFileName);
		Logger.info("생성된 이력서 사진파일명 : {}", savePhotoFileName);
		
		// 이력서 사진파일 저장
		String fullPhotoName = imgDir + "/" + savePhotoFileName;
		Logger.info("사진파일명 :{}", fullPhotoName);
		File savePhotoFile = new File(fullPhotoName);
		try {
			personalPhotoFile.transferTo(savePhotoFile);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}		
		
		/****포트폴리오 파일 입력****/
		// 포트폴리오 파일명 생성 = 입력파일명  + 시스템time
		MultipartFile etcFile = resumeEtcVo.getEtcFile();
		String saveEtcFileName = resumeEtcVo.getEtcFile().getOriginalFilename().substring(0, resumeEtcVo.getEtcFile().getOriginalFilename().length()-4);
		String etcExt = etcFile.getOriginalFilename().substring(etcFile.getOriginalFilename().lastIndexOf(".")+1);
		etcExt = etcExt.toLowerCase();
		saveEtcFileName = saveEtcFileName + "_" + System.currentTimeMillis() + "." + etcExt;
		resumeEtcVo.setEtcFileName(saveEtcFileName);
		Logger.info("생성된 포트폴리오 파일명 : {}", saveEtcFileName);
		
		//포트폴리오 파일 저장
		String fullEtcName = pdfDir + "/" + saveEtcFileName;
		Logger.info("포트폴리오 파일명 :{}", fullEtcName);
		File saveEtcFile = new File(fullEtcName);
		try {
			etcFile.transferTo(saveEtcFile);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}	
		
		resumeVo.setLoginId((String) session.getAttribute("generalId"));
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
		Logger.info("session : {}", session);
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
	public List<ResumeVo> getResumeList(String loginId){
		return resumeDao.selectResumeList(loginId);
	}
	
	// 03 이력서 상세보기
	public Map<String, Object> getResumeDetail(String resumeCd){
		Map<String, Object> resumeDatailMap = new HashMap<String, Object>();
		resumeDatailMap.put("resumeDetailInfo", resumeDao.selectResumeDetailInfoByResumeCd(resumeCd));
		resumeDatailMap.put("resumePersonal", resumeDao.selectResumePersonalByResumeCd(resumeCd));
		resumeDatailMap.put("resumeHighschool", resumeDao.selectResumeHighschoolByResumeCd(resumeCd));
		resumeDatailMap.put("resumeUniveristy", resumeDao.selectResumeUniversityByResumeCd(resumeCd));
		resumeDatailMap.put("resumeFamily", resumeDao.selectResumeFamilyByResumeCd(resumeCd));
		resumeDatailMap.put("resumeMilitaryservice", resumeDao.selectResumeMilitaryserviceByResumeCd(resumeCd));
		resumeDatailMap.put("resumeCertificate", resumeDao.selectResumeCertificateByResumeCd(resumeCd));
		resumeDatailMap.put("resumeCareer", resumeDao.selectResumeCareerByResumeCd(resumeCd));
		resumeDatailMap.put("resumeLanguage", resumeDao.selectResumeLanguageByResumeCd(resumeCd));
		resumeDatailMap.put("resumeAward", resumeDao.selectResumeAwardByResumeCd(resumeCd));
		resumeDatailMap.put("resumeTraining", resumeDao.selectResumeTrainingByResumeCd(resumeCd));
		resumeDatailMap.put("resumeClub", resumeDao.selectResumeClubByResumeCd(resumeCd));
		resumeDatailMap.put("resumeEtc", resumeDao.selectResumeEtcByResumeCd(resumeCd));
		return resumeDatailMap;
	}
	
	// 04 이력서 수정처리
	public void updateResume(ResumeVo resumeVo, 
			ResumePersonalVo resumePersonalVo, 
			ResumeHighschoolVo resumeHighschoolVo, 
			ResumeUniversityVo resumeUniversityVo, 
			ResumeFamilyVo resumeFamilyVo, 
			ResumeMilitaryserviceVo resumeMilitaryserviceVo, 
			ResumeCertificateVo resumeCertificateVo, 
			ResumeCareerVo resumeCareerVo, 
			ResumeLanguageVo resumeLanguageVo, 
			ResumeAwardVo resumeAwardVo, 
			ResumeTrainingVo resumeTrainingVo, 
			ResumeClubVo resumeClubVo, 
			ResumeEtcVo resumeEtcVo, 
			HttpServletRequest request, 
			HttpSession session, 
			String resumeCd){

		/*CAFE24 배포시(사진 및 포트폴리오 저장)*/
		//final String imgDir = request.getSession().getServletContext().getRealPath("/")+"upload/resumefile/photo";
		//final String pdfDir = request.getSession().getServletContext().getRealPath("/")+"upload/resumefile/portfolio";
		
		/****이력서 증명사진 수정****/
		
		// 증명사진 파일명 생성 = 파일명 + 시스템time
		MultipartFile personalPhotoFile = resumePersonalVo.getPersonalPhotoFile();
		String savePhotoFileName = resumePersonalVo.getPersonalPhotoFile().getOriginalFilename().substring(0, resumePersonalVo.getPersonalPhotoFile().getOriginalFilename().length()-4);
		String photoExt = personalPhotoFile.getOriginalFilename().substring(personalPhotoFile.getOriginalFilename().lastIndexOf(".")+1);
		photoExt = photoExt.toLowerCase();
		savePhotoFileName = savePhotoFileName + "_" + System.currentTimeMillis() + "." + photoExt;
		resumePersonalVo.setPersonalPhotoName(savePhotoFileName);
		Logger.info("생성된 이력서 사진파일명 : {}", savePhotoFileName);
		
		// 이력서 사진파일 수정
		String fullPhotoName = imgDir + "/" + savePhotoFileName;
		Logger.info("사진파일명 :{}", fullPhotoName);
		File savePhotoFile = new File(fullPhotoName);
		try {
			personalPhotoFile.transferTo(savePhotoFile);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}		
		
		/****포트폴리오 파일 수정****/
		// 포트폴리오 파일명 생성 = 입력파일명  + 시스템time
		MultipartFile etcFile = resumeEtcVo.getEtcFile();
		String saveEtcFileName = resumeEtcVo.getEtcFile().getOriginalFilename().substring(0, resumeEtcVo.getEtcFile().getOriginalFilename().length()-4);
		String etcExt = etcFile.getOriginalFilename().substring(etcFile.getOriginalFilename().lastIndexOf(".")+1);
		etcExt = etcExt.toLowerCase();
		saveEtcFileName = saveEtcFileName + "_" + System.currentTimeMillis() + "." + etcExt;
		resumeEtcVo.setEtcFileName(saveEtcFileName);
		Logger.info("생성된 포트폴리오 파일명 : {}", saveEtcFileName);
		
		//포트폴리오 파일 저장
		String fullEtcName = pdfDir + "/" + saveEtcFileName;
		Logger.info("포트폴리오 파일명 :{}", fullEtcName);
		File saveEtcFile = new File(fullEtcName);
		try {
			etcFile.transferTo(saveEtcFile);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}	
		
		resumeVo.setLoginId((String) session.getAttribute("generalId"));
		resumeDao.deleteFirstResume(resumeCd);
		resumeDao.updateResume(resumeVo);
		resumeDao.updateResumePersonal(resumePersonalVo);
		resumeDao.updateResumeHighschool(resumeHighschoolVo);
		resumeDao.updateResumeUniversity(resumeUniversityVo);
		resumeDao.updateResumeFamily(resumeFamilyVo);
		resumeDao.updateResumeMilitaryservice(resumeMilitaryserviceVo);
		resumeDao.updateResumeCertificate(resumeCertificateVo);
		resumeDao.updateResumeCareer(resumeCareerVo);
		resumeDao.updateResumeLanguage(resumeLanguageVo);
		resumeDao.updateResumeAward(resumeAwardVo);
		resumeDao.updateResumeTraining(resumeTrainingVo);
		resumeDao.updateResumeClub(resumeClubVo);
		resumeDao.updateResumeEtc(resumeEtcVo);
		Logger.info("session : {}", session);
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
	
	// 05 이력서 삭제처리
	public int deleteResume(String resumeCd){
		return resumeDao.deleteResume(resumeCd);
	}
}
