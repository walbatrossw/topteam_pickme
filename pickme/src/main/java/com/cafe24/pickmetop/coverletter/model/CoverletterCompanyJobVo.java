package com.cafe24.pickmetop.coverletter.model;

import java.util.List;

public class CoverletterCompanyJobVo {
	String cCletterArticleCd;
	String recruitJobCd;
	String cletterArticle;	
	List<CoverletterCompanyJobVo> coverletterList;
	public String getcCletterArticleCd() {
		return cCletterArticleCd;
	}
	public void setcCletterArticleCd(String cCletterArticleCd) {
		this.cCletterArticleCd = cCletterArticleCd;
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
		return "CoverletterCompanyJobVo [cCletterArticleCd=" + cCletterArticleCd + ", recruitJobCd=" + recruitJobCd
				+ ", cletterArticle=" + cletterArticle + ", coverletterList=" + coverletterList + "]";
	}
	


}
