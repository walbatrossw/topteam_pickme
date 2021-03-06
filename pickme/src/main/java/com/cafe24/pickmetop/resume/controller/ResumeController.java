package com.cafe24.pickmetop.resume.controller;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
import com.cafe24.pickmetop.resume.service.ResumeService;


@Controller
public class ResumeController {
	final static Logger Logger = LoggerFactory.getLogger(ResumeController.class);
	@Autowired
	private ResumeService resumeService;
	
	// 00 이력서 및 자기소개서 메인페이지
	@RequestMapping(value="/resumeCoverletterIndex", method = RequestMethod.GET)
	public String resumeCoverletterIndex(Model model){
		Logger.info("자기소개서 메인페이지:{}" , model.toString());
		return "/resumecoverletter/resumeCoverletterIndex";
	}
	
	//01 이력서 리스트(회원이 작성한 이력서 리스트)
	@RequestMapping(value="/resumeList", method = RequestMethod.GET)
	public String resumeList(Model model, HttpSession session){
		String loginId = (String) session.getAttribute("generalId");
		model.addAttribute("resumeList", resumeService.getResumeList(loginId));
		Logger.info("이력서 리스트 : {}", model.toString());
		Logger.info("이력서 리스트 - 세션 ID : {}", session.getAttribute("generalId"));
		if(loginId == null) {
			return "/common/etc/loginCheck";
		}
		return "/resumecoverletter/resume/resumeList";
		
	}
	
	//02 이력서 입력화면(이력서 입력폼)
	@RequestMapping(value="/resumeInsert", method = RequestMethod.GET)
	public String resumeInsert(Model model, HttpSession session){
		String loginId = (String) session.getAttribute("generalId");
		Logger.info("이력서입력화면 : {}", model.toString());
		Logger.info("이력서입력화면 - 세션 ID : {}", session.getAttribute("generalId"));
		if (loginId == null) {
			return "/common/etc/loginCheck";
		} 
		return "/resumecoverletter/resume/resumeInsert";
	}
	
	//02 이력서 입력처리(이력서 입력처리후 리스트로 이동)
	@RequestMapping(value="/resumeInsert", method = RequestMethod.POST)
	public String resumeInsert(ResumeVo resumeVo, 
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
		Logger.info("이력서 입력 : {}", resumeVo.toString());
		Logger.info("개인신상 입력 : {}", resumePersonalVo.toString());
		Logger.info("고등학교 입력 : {}", resumeHighschoolVo.toString());
		Logger.info("대학교 입력 : {}", resumeUniversityVo.toString());
		Logger.info("가족 입력 : {}", resumeFamilyVo.getResumeFamilyVoList().toString());
		Logger.info("병역 입력 : {}", resumeMilitaryserviceVo.toString());
		Logger.info("자격증 입력 : {}", resumeCertificateVo.toString());
		Logger.info("경력 입력 : {}", resumeCareerVo.toString());
		Logger.info("어학 입력 : {}", resumeLanguageVo.toString());
		Logger.info("수상이력 입력 : {}", resumeAwardVo.toString());
		Logger.info("국내외연수 입력 : {}", resumeTrainingVo.toString());
		Logger.info("동아리, 동호회 입력 : {}", resumeClubVo.toString());
		Logger.info("기타,포트폴리오 입력 : {}", resumeEtcVo.toString());
		resumeService.addResume(resumeVo, resumePersonalVo, resumeHighschoolVo, resumeUniversityVo, resumeFamilyVo, resumeMilitaryserviceVo, 
				resumeCertificateVo, resumeCareerVo, resumeLanguageVo, resumeAwardVo, resumeTrainingVo, resumeClubVo, resumeEtcVo, request, session);
		return "redirect:/resumeList";
	}
	
	
	//04 이력서 상세보기 (이력서 리스트에서 이력서 이름 클릭시 상세보기 화면으로 이동)
	@RequestMapping(value="/resumeDetail", method = RequestMethod.GET)
	public String resumeDetail(Model model,	@RequestParam(value="resumeCd") String resumeCd, HttpSession session){
		Logger.info("test {}", model.toString());
		Map<String, Object> resumeDetail = resumeService.getResumeDetail(resumeCd);
		String loginId = (String) session.getAttribute("generalId");
		Logger.info("이력서 정보 {}", resumeDetail.get("resumeDetailInfo").toString());
		Logger.info("개인신상 {}", resumeDetail.get("resumePersonal").toString());
		model.addAttribute("resumeDetailInfo", resumeDetail.get("resumeDetailInfo"));
		model.addAttribute("resumePersonal", resumeDetail.get("resumePersonal"));
		model.addAttribute("resumeHighschool", resumeDetail.get("resumeHighschool"));
		model.addAttribute("resumeUniveristy", resumeDetail.get("resumeUniveristy"));
		model.addAttribute("resumeFamily", resumeDetail.get("resumeFamily"));
		model.addAttribute("resumeMilitaryservice", resumeDetail.get("resumeMilitaryservice"));
		model.addAttribute("resumeCertificate", resumeDetail.get("resumeCertificate"));
		model.addAttribute("resumeCareer", resumeDetail.get("resumeCareer"));
		model.addAttribute("resumeLanguage", resumeDetail.get("resumeLanguage"));
		model.addAttribute("resumeAward", resumeDetail.get("resumeAward"));
		model.addAttribute("resumeTraining", resumeDetail.get("resumeTraining"));
		model.addAttribute("resumeClub", resumeDetail.get("resumeClub"));
		model.addAttribute("resumeEtc", resumeDetail.get("resumeEtc"));
		if (loginId == null) {
			return "/common/etc/loginCheck";
		} 
		return "/resumecoverletter/resume/resumeDetail";
	}
	
	
	
	//05 이력서 수정화면(이력서 리스트에서 수정 버튼 클릭 후 수정화면으로 이동)
	@RequestMapping(value="/resumeUpdateForm", method = RequestMethod.GET)
	public String resumeUpdateForm(Model model, @RequestParam(value="resumeCd") String resumeCd, HttpSession session){
		Map<String, Object> resumeUpdateDetail = resumeService.getResumeDetail(resumeCd);
		String loginId = (String) session.getAttribute("generalId");
		Logger.info("이력서 정보 {}", resumeUpdateDetail.get("resumeDetailInfo").toString());
		Logger.info("개인신상 {}", resumeUpdateDetail.get("resumePersonal").toString());
		model.addAttribute("resumeDetailInfo", resumeUpdateDetail.get("resumeDetailInfo"));
		model.addAttribute("resumePersonal", resumeUpdateDetail.get("resumePersonal"));
		model.addAttribute("resumeHighschool", resumeUpdateDetail.get("resumeHighschool"));
		model.addAttribute("resumeUniveristy", resumeUpdateDetail.get("resumeUniveristy"));
		model.addAttribute("resumeFamily", resumeUpdateDetail.get("resumeFamily"));
		model.addAttribute("resumeMilitaryservice", resumeUpdateDetail.get("resumeMilitaryservice"));
		model.addAttribute("resumeCertificate", resumeUpdateDetail.get("resumeCertificate"));
		model.addAttribute("resumeCareer", resumeUpdateDetail.get("resumeCareer"));
		model.addAttribute("resumeLanguage", resumeUpdateDetail.get("resumeLanguage"));
		model.addAttribute("resumeAward", resumeUpdateDetail.get("resumeAward"));
		model.addAttribute("resumeTraining", resumeUpdateDetail.get("resumeTraining"));
		model.addAttribute("resumeClub", resumeUpdateDetail.get("resumeClub"));
		model.addAttribute("resumeEtc", resumeUpdateDetail.get("resumeEtc"));
		if (loginId == null) {
			return "/common/etc/loginCheck";
		}
		return "/resumecoverletter/resume/resumeUpdate";
	}
	
	//06 이력서 수정처리(수정화면에서 수정처리후 상세보기 화면으로 이동)
	@RequestMapping(value="/resumeUpdate", method = RequestMethod.POST)
	public String resumeUpdate(Model model, 
						ResumeVo resumeVo, 
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
						@RequestParam(value="resumeCd")String resumeCd){
		Logger.info("이력서 수정 : {}", resumeVo.toString());
		Logger.info("개인신상 수정 : {}", resumePersonalVo.toString());
		Logger.info("고등학교 수정 : {}", resumeHighschoolVo.toString());
		Logger.info("대학교 수정 : {}", resumeUniversityVo.toString());
		Logger.info("가족 수정 : {}", resumeFamilyVo.getResumeFamilyVoList().toString());
		Logger.info("병역 수정 : {}", resumeMilitaryserviceVo.toString());
		Logger.info("자격증 수정 : {}", resumeCertificateVo.toString());
		Logger.info("경력 수정 : {}", resumeCareerVo.toString());
		Logger.info("어학 수정 : {}", resumeLanguageVo.toString());
		Logger.info("수상이력 수정 : {}", resumeAwardVo.toString());
		Logger.info("국내외연수 수정 : {}", resumeTrainingVo.toString());
		Logger.info("동아리, 동호회 수정 : {}", resumeClubVo.toString());
		Logger.info("기타,포트폴리오 수정 : {}", resumeEtcVo.toString());
		resumeService.updateResume(resumeVo, resumePersonalVo, resumeHighschoolVo, resumeUniversityVo, 
							resumeFamilyVo, resumeMilitaryserviceVo, resumeCertificateVo, resumeCareerVo, 
							resumeLanguageVo, resumeAwardVo, resumeTrainingVo, resumeClubVo, resumeEtcVo, request, session, resumeCd);
		return "redirect:/resumeList";
	}
	
	//06 이력서 삭제(이력서 리스트에서 바로 삭제처리)
	@RequestMapping(value="/resumeDelete", method = RequestMethod.GET)
	public String resumeDelete(@RequestParam(value="resumeCd")String resumeCd){
		resumeService.deleteResume(resumeCd);
		return "redirect:/resumeList";
	}
	
	
	//00 자격증 및 어학 검색페이지(이력서 입력폼에서 팝업을 통해 검색창을 띄워주고, 검색값을 입력폼에 자동입력 할 수 있게 처리)
	@RequestMapping(value="/resumeCertilangIndex", method = RequestMethod.GET)
	public String resumeCertilangIndex(Model model, HttpSession session){
		String loginId = (String) session.getAttribute("generalId");
		if (loginId == null) {
			return "/common/etc/loginCheck";
		}
		return "/resumecoverletter/resume/resumeCertilangIndex";
	}
}
