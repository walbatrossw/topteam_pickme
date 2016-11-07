package com.cafe24.pickmetop.coverletter.model;

public class CoverletterCompanyJobVo {
	String cCletterArticleCd;
	String recruitJobCd;
	String cletterArticle;
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
	@Override
	public String toString() {
		return "CoverletterCompanyJobVo [cCletterArticleCd=" + cCletterArticleCd + ", recruitJobCd=" + recruitJobCd
				+ ", cletterArticle=" + cletterArticle + "]";
	}
	
	
}
