package com.cafe24.pickmetop.coverletter.model;

import java.util.Date;

public class CoverletterMemberArticleSaveVo {
	String mCletterRecordCd;
	String mCletterArticleCd;
	String cCletterArticleCd;
	String mCletterArticleContent;
	Date mCletterRecordDate;
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
	public Date getmCletterRecordDate() {
		return mCletterRecordDate;
	}
	public void setmCletterRecordDate(Date mCletterRecordDate) {
		this.mCletterRecordDate = mCletterRecordDate;
	}
	@Override
	public String toString() {
		return "CoverletterMemberArticleSaveVo [mCletterRecordCd=" + mCletterRecordCd + ", mCletterArticleCd="
				+ mCletterArticleCd + ", cCletterArticleCd=" + cCletterArticleCd + ", mCletterArticleContent="
				+ mCletterArticleContent + ", mCletterRecordDate=" + mCletterRecordDate + "]";
	}
	
}
