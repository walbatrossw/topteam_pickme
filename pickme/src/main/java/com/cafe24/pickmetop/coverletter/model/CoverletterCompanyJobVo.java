package com.cafe24.pickmetop.coverletter.model;

public class CoverletterCompanyJobVo {
	
	private String cCletterArticleCd; // 기업 자기소개서 항목코드
	private String recruitJobCd; // 기업 직무별 코드
	private String cCletterArticle;	// 자기소개서 항목
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
	public String getcCletterArticle() {
		return cCletterArticle;
	}
	public void setcCletterArticle(String cCletterArticle) {
		this.cCletterArticle = cCletterArticle;
	}
	@Override
	public String toString() {
		return "CoverletterCompanyJobVo [cCletterArticleCd=" + cCletterArticleCd + ", recruitJobCd=" + recruitJobCd
				+ ", cCletterArticle=" + cCletterArticle + "]";
	}
	
}
