package com.cafe24.pickmetop.recruit.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cafe24.pickmetop.admin.model.JobMidIndexVo;
import com.cafe24.pickmetop.admin.model.JobTopIndexVo;
import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;
import com.cafe24.pickmetop.recruit.model.Recruit;
import com.cafe24.pickmetop.recruit.model.RecruitCompany;
import com.cafe24.pickmetop.recruit.model.RecruitCompanyJobVo;
import com.cafe24.pickmetop.recruit.repository.RecruitDao;

@Service
public class RecruitService {
	final static Logger logger = LoggerFactory.getLogger(RecruitService.class);
	@Autowired
	RecruitDao recruitDao;
	String companyCd = "";
	//final String imgDir = "D:\\git_pickme\\topteam_pickme\\pickme\\src\\main\\webapp\\recruitImgs";
	final String imgDir = "C:\\Users\\202-09\\Desktop\\PickMe_Workspace\\TeamGit\\topteam_pickme\\pickme\\src\\main\\webapp\\upload\\recruitimg";

	
	//임시 기업명 입력
	public void insertTemporaryCompany(Recruit recruit){
		recruitDao.insertTemporaryCompany(recruit);
	}
	
	//임시기업명 개수 
	public int selectDefaultCd(){
		return recruitDao.selectDefaultCd();
	}
	//직무 대분류 전체
	public List<JobTopIndexVo> getJobTopIndexCd(){
		return recruitDao.getJopTopIndexCd();
	}
	//직무 중분류 전체리스트 
	public List<JobMidIndexVo> getJobMidIndexCd(){
		return recruitDao.getJobMidIndexCd();
	}
	//전체 기업리스트
	public List<String> selectCompany(){
		return recruitDao.selectCompany();
	}
	//입력받은 기업명으로 기업코드 검색
	public String getCompanyCd(String companyName){
		return recruitDao.getCompanyCd(companyName);
	}
	
	//companyRecruit입력
	public void insertRecruitCompany(Recruit recruit,HttpSession session){
		//test id값
		String id = (String) session.getAttribute("id");
		RecruitCompany recruitCompany = new RecruitCompany();
		
		//객체내에 값setting
		//RecruitCompanyCd를 문자열 + 증가하는수로 setting
		int count = recruitDao.getCountOfRecruit() +1;
		companyCd = "recruitCompany"+count;
		
		recruitCompany.setRecruitCompanyCd(companyCd);
		recruitCompany.setCompanyCd(recruit.getCompanyCd());
		recruitCompany.setRecruitName(recruit.getCompanyName());
		recruitCompany.setRecruitBegindate(recruit.getRecruitBegindate());
		recruitCompany.setRecruitEnddate(recruit.getRecruitEnddate());
		recruitCompany.setRecruitRegister(id);
		recruitCompany.setRecruitModify(id);
			
		logger.info("recruitCompany : {}",recruitCompany.toString());
			
		recruitDao.insertRecruitCompany(recruitCompany);
	}

	
	//companyRecruitJob입력
	public void insertRecruitCompanyJob(Recruit recruit){

		for(int i=0; i<recruit.getRecruitJobEducation().size(); i++){
			
			//recruitJobCd = 문자열 + 증가하는 값
			String recruitJobCd = "";
			int count = recruitDao.getCountOfRecruitJob()+1;
			recruitJobCd= "recruitCompanyJob" + count;
			
			logger.info("recruit {}",recruit.toString());
			logger.info("for 문 {}",recruit.getRecruitJobEducation().size());
			RecruitCompanyJobVo recruitCompanyJobVo = new RecruitCompanyJobVo();
			recruitCompanyJobVo.setRecruitJobCd(recruitJobCd);
			recruitCompanyJobVo.setCompanyCd(recruit.getCompanyCd());
			recruitCompanyJobVo.setRecruitCompanyCd(companyCd);
			recruitCompanyJobVo.setJobMidindexCd(recruit.getJobMidIndexCd().get(i));
			recruitCompanyJobVo.setRecruitJobWorkstatus(recruit.getRecruitJobWorkstatus().get(i));
			recruitCompanyJobVo.setRecruitJobJobdetail(recruit.getRecruitJobJobdetail().get(i));
			recruitCompanyJobVo.setRecruitJobEducation(recruit.getRecruitJobEducation().get(i));
			
			//file이름 
			MultipartFile recruitImgs = recruit.getRecruitJobFile();
			String saveFileName = recruit.getRecruitJobFile().getOriginalFilename().substring(0,recruit.getRecruitJobFile().getOriginalFilename().length()-4);

			
			String ext = recruitImgs.getOriginalFilename().substring(recruitImgs.getOriginalFilename().lastIndexOf(".") + 1);
			ext = ext.toLowerCase();
			saveFileName=saveFileName+ "_" + System.currentTimeMillis()+"."+ext;
			//controller에서 유효성검사하기 
			String type = recruitImgs.getContentType();
			logger.info("생성된 파일이름 : {}", saveFileName);
			
			recruitCompanyJobVo.setRecruitJobFile(saveFileName );
			
			// file저장
			String fullFileName = imgDir + "\\" + saveFileName ;
			logger.info("fullFileName : {}", fullFileName);
			File saveFile = new File(fullFileName);
			try {
				// img가 saveFile로 이동
				recruitImgs.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			//자기소개서항목입력 
			//for(???){
			CoverletterCompanyJobVo cletterArticle = new CoverletterCompanyJobVo();
			int numberOfCoverletter = recruitDao.getCountOfCoverletterJob();
			numberOfCoverletter++;
			String coverletterCd = "coverletterCd"+numberOfCoverletter;
			cletterArticle.setRecruitJobCd(recruitJobCd);
			cletterArticle.setcCletterArticleCd(coverletterCd);
			recruitDao.insertCoverletterArticle(cletterArticle);
			
			logger.info("recruitCompanyJobVo : {}",recruitCompanyJobVo.toString());	
			recruitDao.insertRecruitJob(recruitCompanyJobVo);
		}
	}
}

