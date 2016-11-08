package com.cafe24.pickmetop.coverletter.model;

public class CoverletterMemberArticleVo {
	private String mCletterArticleCd;
	private String mCletterCd;
	private String cCletterArticle;
	private String mCletterArticleContent;
	public String getmCletterArticleCd() {
		return mCletterArticleCd;
	}
	public void setmCletterArticleCd(String mCletterArticleCd) {
		this.mCletterArticleCd = mCletterArticleCd;
	}
	public String getmCletterCd() {
		return mCletterCd;
	}
	public void setmCletterCd(String mCletterCd) {
		this.mCletterCd = mCletterCd;
	}
	public String getcCletterArticle() {
		return cCletterArticle;
	}
	public void setcCletterArticle(String cCletterArticle) {
		this.cCletterArticle = cCletterArticle;
	}
	public String getmCletterArticleContent() {
		return mCletterArticleContent;
	}
	public void setmCletterArticleContent(String mCletterArticleContent) {
		this.mCletterArticleContent = mCletterArticleContent;
	}
	@Override
	public String toString() {
		return "CoverletterMemberArticleVo [mCletterArticleCd=" + mCletterArticleCd + ", mCletterCd=" + mCletterCd
				+ ", cCletterArticle=" + cCletterArticle + ", mCletterArticleContent=" + mCletterArticleContent + "]";
	}
	
}
