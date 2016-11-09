package com.cafe24.pickmetop.recruit.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cafe24.pickmetop.coverletter.model.CoverletterCompanyJobVo;

public class Recruit {

	private String companyName;
	private String companyCd;
	private String recruitName;
	private String recruitBegindate;
	private String recruitEnddate;
	private String recruitImgName;
	private MultipartFile recruitJobFile;
	private List<String> jobMidIndexCd;
	private List<String> recruitJobWorkstatus;
	private List<String> recruitJobJobdetail;
	private List<String> recruitJobEducation;
	private List<CoverletterCompanyJobVo> cCletterArticle;
	private List<Recruit> recruitList;
	private String recruitCompanyCd;
	private String companySite;
	private String begin;
	private String end;
	private String workStatus;
	private String jobDetail;
	
	
	public String getWorkStatus() {
		return workStatus;
	}
	public void setWorkStatus(String workStatus) {
		this.workStatus = workStatus;
	}
	public String getJobDetail() {
		return jobDetail;
	}
	public void setJobDetail(String jobDetail) {
		this.jobDetail = jobDetail;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyCd() {
		return companyCd;
	}
	public void setCompanyCd(String companyCd) {
		this.companyCd = companyCd;
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
	public String getRecruitImgName() {
		return recruitImgName;
	}
	public void setRecruitImgName(String recruitImgName) {
		this.recruitImgName = recruitImgName;
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
	public String getRecruitCompanyCd() {
		return recruitCompanyCd;
	}
	public void setRecruitCompanyCd(String recruitCompanyCd) {
		this.recruitCompanyCd = recruitCompanyCd;
	}
	public String getCompanySite() {
		return companySite;
	}
	public void setCompanySite(String companySite) {
		this.companySite = companySite;
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
		return "Recruit [companyName=" + companyName + ", companyCd=" + companyCd + ", recruitName=" + recruitName
				+ ", recruitBegindate=" + recruitBegindate + ", recruitEnddate=" + recruitEnddate + ", recruitImgName="
				+ recruitImgName + ", recruitJobFile=" + recruitJobFile + ", jobMidIndexCd=" + jobMidIndexCd
				+ ", recruitJobWorkstatus=" + recruitJobWorkstatus + ", recruitJobJobdetail=" + recruitJobJobdetail
				+ ", recruitJobEducation=" + recruitJobEducation + ", cCletterArticle=" + cCletterArticle
				+ ", recruitList=" + recruitList + ", recruitCompanyCd=" + recruitCompanyCd + ", companySite="
				+ companySite + ", begin=" + begin + ", end=" + end + "]";
	}
	

	
	

	
}
