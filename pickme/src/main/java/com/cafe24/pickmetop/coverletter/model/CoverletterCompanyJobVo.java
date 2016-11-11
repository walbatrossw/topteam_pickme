package com.cafe24.pickmetop.coverletter.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CoverletterCompanyJobVo {
	
	private String recruitCompanyCd;
	private String recruitName;
	private String recruitEnddate;
	private String recruitJobCd;
	private String recruitJobJobdetail;
	private String recruitJobEducation;
	private String recruitJobWorkstatus;
	private String cCletterArticleCd;
	private String cCletterArticle;	
	private String companyName;
	private String jobMidindexName;
	private MultipartFile recruitJobFile;
	private List<CoverletterCompanyJobVo> coverletterList;
	public String getRecruitCompanyCd() {
		return recruitCompanyCd;
	}
	public void setRecruitCompanyCd(String recruitCompanyCd) {
		this.recruitCompanyCd = recruitCompanyCd;
	}
	public String getRecruitName() {
		return recruitName;
	}
	public void setRecruitName(String recruitName) {
		this.recruitName = recruitName;
	}
	public String getRecruitEnddate() {
		return recruitEnddate;
	}
	public void setRecruitEnddate(String recruitEnddate) {
		this.recruitEnddate = recruitEnddate;
	}
	public String getRecruitJobCd() {
		return recruitJobCd;
	}
	public void setRecruitJobCd(String recruitJobCd) {
		this.recruitJobCd = recruitJobCd;
	}
	public String getRecruitJobJobdetail() {
		return recruitJobJobdetail;
	}
	public void setRecruitJobJobdetail(String recruitJobJobdetail) {
		this.recruitJobJobdetail = recruitJobJobdetail;
	}
	public String getRecruitJobEducation() {
		return recruitJobEducation;
	}
	public void setRecruitJobEducation(String recruitJobEducation) {
		this.recruitJobEducation = recruitJobEducation;
	}
	public String getRecruitJobWorkstatus() {
		return recruitJobWorkstatus;
	}
	public void setRecruitJobWorkstatus(String recruitJobWorkstatus) {
		this.recruitJobWorkstatus = recruitJobWorkstatus;
	}
	public String getcCletterArticleCd() {
		return cCletterArticleCd;
	}
	public void setcCletterArticleCd(String cCletterArticleCd) {
		this.cCletterArticleCd = cCletterArticleCd;
	}
	public String getCletterArticle() {
		return cCletterArticle;
	}
	public void setCletterArticle(String cletterArticle) {
		this.cCletterArticle = cletterArticle;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getJobMidindexName() {
		return jobMidindexName;
	}
	public void setJobMidindexName(String jobMidindexName) {
		this.jobMidindexName = jobMidindexName;
	}
	public MultipartFile getRecruitJobFile() {
		return recruitJobFile;
	}
	public void setRecruitJobFile(MultipartFile recruitJobFile) {
		this.recruitJobFile = recruitJobFile;
	}
	public List<CoverletterCompanyJobVo> getCoverletterList() {
		return coverletterList;
	}
	public void setCoverletterList(List<CoverletterCompanyJobVo> coverletterList) {
		this.coverletterList = coverletterList;
	}
	@Override
	public String toString() {
		return "CoverletterCompanyJobVo [recruitCompanyCd=" + recruitCompanyCd + ", recruitName=" + recruitName
				+ ", recruitEnddate=" + recruitEnddate + ", recruitJobCd=" + recruitJobCd + ", recruitJobJobdetail="
				+ recruitJobJobdetail + ", recruitJobEducation=" + recruitJobEducation + ", recruitJobWorkstatus="
				+ recruitJobWorkstatus + ", cCletterArticleCd=" + cCletterArticleCd + ", cletterArticle="
				+ cCletterArticle + ", companyName=" + companyName + ", jobMidindexName=" + jobMidindexName
				+ ", recruitJobFile=" + recruitJobFile + ", coverletterList=" + coverletterList + "]";
	}
	
	
}
