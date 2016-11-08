package com.cafe24.pickmetop.recruit.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;

public class Recruit {

	String CompanyName;
	String CompanyCd;
	String recruitName;
	String recruitBegindate;
	String recruitEnddate;
	MultipartFile recruitJobFile;
	List<String> jobMidIndexCd;
	List<String> recruitJobWorkstatus;
	List<String> recruitJobJobdetail;
	List<String> recruitJobEducation;
	List<CoverletterCompanyJobVo> cCletterArticle;
	List<Recruit> recruitList;
	String recruitCompanyCd;
	String companySite;
	String begin;
	String end;
	
	
	
	public String getCompanySite() {
		return companySite;
	}
	public void setCompanySite(String companySite) {
		this.companySite = companySite;
	}
	public String getRecruitCompanyCd() {
		return recruitCompanyCd;
	}
	public void setRecruitCompanyCd(String recruitCompanyCd) {
		this.recruitCompanyCd = recruitCompanyCd;
	}
	public String getCompanyName() {
		return CompanyName;
	}
	public void setCompanyName(String companyName) {
		CompanyName = companyName;
	}
	public String getCompanyCd() {
		return CompanyCd;
	}
	public void setCompanyCd(String companyCd) {
		CompanyCd = companyCd;
	}
	public String getRecruitName() {
		return recruitName;
	}
	public void setRecruitName(String recruitName) {
		this.recruitName = recruitName;
	}
	public String getRecruitBegindate() {
		return recruitBegindate;
	}
	public void setRecruitBegindate(String recruitBegindate) {
		this.recruitBegindate = recruitBegindate;
	}
	public String getRecruitEnddate() {
		return recruitEnddate;
	}
	public void setRecruitEnddate(String recruitEnddate) {
		this.recruitEnddate = recruitEnddate;
	}
	public MultipartFile getRecruitJobFile() {
		return recruitJobFile;
	}
	public void setRecruitJobFile(MultipartFile recruitJobFile) {
		this.recruitJobFile = recruitJobFile;
	}
	public List<String> getJobMidIndexCd() {
		return jobMidIndexCd;
	}
	public void setJobMidIndexCd(List<String> jobMidIndexCd) {
		this.jobMidIndexCd = jobMidIndexCd;
	}
	public List<String> getRecruitJobWorkstatus() {
		return recruitJobWorkstatus;
	}
	public void setRecruitJobWorkstatus(List<String> recruitJobWorkstatus) {
		this.recruitJobWorkstatus = recruitJobWorkstatus;
	}
	public List<String> getRecruitJobJobdetail() {
		return recruitJobJobdetail;
	}
	public void setRecruitJobJobdetail(List<String> recruitJobJobdetail) {
		this.recruitJobJobdetail = recruitJobJobdetail;
	}
	public List<String> getRecruitJobEducation() {
		return recruitJobEducation;
	}
	public void setRecruitJobEducation(List<String> recruitJobEducation) {
		this.recruitJobEducation = recruitJobEducation;
	}
	public List<CoverletterCompanyJobVo> getcCletterArticle() {
		return cCletterArticle;
	}
	public void setcCletterArticle(List<CoverletterCompanyJobVo> cCletterArticle) {
		this.cCletterArticle = cCletterArticle;
	}
	public List<Recruit> getRecruitList() {
		return recruitList;
	}
	public void setRecruitList(List<Recruit> recruitList) {
		this.recruitList = recruitList;
	}
	public String getBegin() {
		return begin;
	}
	public void setBegin(String begin) {
		this.begin = begin;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "Recruit [CompanyName=" + CompanyName + ", CompanyCd=" + CompanyCd + ", recruitName=" + recruitName
				+ ", recruitBegindate=" + recruitBegindate + ", recruitEnddate=" + recruitEnddate + ", recruitJobFile="
				+ recruitJobFile + ", jobMidIndexCd=" + jobMidIndexCd + ", recruitJobWorkstatus=" + recruitJobWorkstatus
				+ ", recruitJobJobdetail=" + recruitJobJobdetail + ", recruitJobEducation=" + recruitJobEducation
				+ ", cCletterArticle=" + cCletterArticle + ", recruitList=" + recruitList + ", begin=" + begin
				+ ", end=" + end + "]";
	}
	
	
	

	
}
