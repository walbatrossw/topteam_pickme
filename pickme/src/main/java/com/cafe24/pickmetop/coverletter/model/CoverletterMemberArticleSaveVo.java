package com.cafe24.pickmetop.coverletter.model;


public class CoverletterMemberArticleSaveVo {
	private String mCletterRecordCd;
	private String mCletterCd;
	private String cCletterArticleCd;
	private String mCletterRecordDate;
	public String getmCletterRecordCd() {
		return mCletterRecordCd;
	}
	public void setmCletterRecordCd(String mCletterRecordCd) {
		this.mCletterRecordCd = mCletterRecordCd;
	}
	public String getmCletterCd() {
		return mCletterCd;
	}
	public void setmCletterCd(String mCletterCd) {
		this.mCletterCd = mCletterCd;
	}
	public String getcCletterArticleCd() {
		return cCletterArticleCd;
	}
	public void setcCletterArticleCd(String cCletterArticleCd) {
		this.cCletterArticleCd = cCletterArticleCd;
	}
	public String getmCletterRecordDate() {
		return mCletterRecordDate;
	}
	public void setmCletterRecordDate(String mCletterRecordDate) {
		this.mCletterRecordDate = mCletterRecordDate;
	}
	@Override
	public String toString() {
		return "CoverletterMemberArticleSaveVo [mCletterRecordCd=" + mCletterRecordCd + ", mCletterCd=" + mCletterCd
				+ ", cCletterArticleCd=" + cCletterArticleCd + ", mCletterRecordDate=" + mCletterRecordDate + "]";
	}
	
}
