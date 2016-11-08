package com.cafe24.pickmetop.coverletter.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CoverletterCompanyJobVo {
	private String companyName;
	private String midindexName;
	private String recruitJobDetail;
	private String recruitEnddate;
	private String cCletterArticleCd;
	private String recruitJobWorkstatus;
	private MultipartFile recruitJobFile;
	private String recruitJobCd;
	private String cletterArticle;	
	private List<CoverletterCompanyJobVo> coverletterList;
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getMidindexName() {
		return midindexName;
	}
	public void setMidindexName(String midindexName) {
		this.midindexName = midindexName;
	}
	public String getRecruitJobDetail() {
		return recruitJobDetail;
	}
	public void setRecruitJobDetail(String recruitJobDetail) {
		this.recruitJobDetail = recruitJobDetail;
	}
	public String getRecruitEnddate() {
		return recruitEnddate;
	}
	public void setRecruitEnddate(String recruitEnddate) {
		this.recruitEnddate = recruitEnddate;
	}
	public String getcCletterArticleCd() {
		return cCletterArticleCd;
	}
	public void setcCletterArticleCd(String cCletterArticleCd) {
		this.cCletterArticleCd = cCletterArticleCd;
	}
	public String getRecruitJobWorkstatus() {
		return recruitJobWorkstatus;
	}
	public void setRecruitJobWorkstatus(String recruitJobWorkstatus) {
		this.recruitJobWorkstatus = recruitJobWorkstatus;
	}
	public MultipartFile getRecruitJobFile() {
		return recruitJobFile;
	}
	public void setRecruitJobFile(MultipartFile recruitJobFile) {
		this.recruitJobFile = recruitJobFile;
	}
	public String getRecruitJobCd() {
		return recruitJobCd;
	}
	public void setRecruitJobCd(String recruitJobCd) {
		this.recruitJobCd = recruitJobCd;
	}
	public String getCletterArticle() {
		return cletterArticle;
	}
	public void setCletterArticle(String cletterArticle) {
		this.cletterArticle = cletterArticle;
	}
	public List<CoverletterCompanyJobVo> getCoverletterList() {
		return coverletterList;
	}
	public void setCoverletterList(List<CoverletterCompanyJobVo> coverletterList) {
		this.coverletterList = coverletterList;
	}
	@Override
	public String toString() {
		return "CoverletterCompanyJobVo [companyName=" + companyName + ", midindexName=" + midindexName
				+ ", recruitJobDetail=" + recruitJobDetail + ", recruitEnddate=" + recruitEnddate
				+ ", cCletterArticleCd=" + cCletterArticleCd + ", recruitJobWorkstatus=" + recruitJobWorkstatus
				+ ", recruitJobFile=" + recruitJobFile + ", recruitJobCd=" + recruitJobCd + ", cletterArticle="
				+ cletterArticle + ", coverletterList=" + coverletterList + "]";
	}
	
}
