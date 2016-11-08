package com.cafe24.pickmetop.coverletter.model;


public class CoverletterMemberArticleSaveVo {
	private String mCletterRecordCd;
	private String mCletterArticleCd;
	private String cCletterArticleCd;
	private String mCletterArticleContent;
	private String mCletterRecordDate;
	public String getmCletterRecordCd() {
		return mCletterRecordCd;
	}
	public void setmCletterRecordCd(String mCletterRecordCd) {
		this.mCletterRecordCd = mCletterRecordCd;
	}
	public String getmCletterArticleCd() {
		return mCletterArticleCd;
	}
	public void setmCletterArticleCd(String mCletterArticleCd) {
		this.mCletterArticleCd = mCletterArticleCd;
	}
	public String getcCletterArticleCd() {
		return cCletterArticleCd;
	}
	public void setcCletterArticleCd(String cCletterArticleCd) {
		this.cCletterArticleCd = cCletterArticleCd;
	}
	public String getmCletterArticleContent() {
		return mCletterArticleContent;
	}
	public void setmCletterArticleContent(String mCletterArticleContent) {
		this.mCletterArticleContent = mCletterArticleContent;
	}
	public String getmCletterRecordDate() {
		return mCletterRecordDate;
	}
	public void setmCletterRecordDate(String mCletterRecordDate) {
		this.mCletterRecordDate = mCletterRecordDate;
	}
	@Override
	public String toString() {
		return "CoverletterMemberArticleSaveVo [mCletterRecordCd=" + mCletterRecordCd + ", mCletterArticleCd="
				+ mCletterArticleCd + ", cCletterArticleCd=" + cCletterArticleCd + ", mCletterArticleContent="
				+ mCletterArticleContent + ", mCletterRecordDate=" + mCletterRecordDate + "]";
	}
	
	
}
