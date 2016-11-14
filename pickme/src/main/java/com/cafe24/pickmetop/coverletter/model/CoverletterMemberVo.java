package com.cafe24.pickmetop.coverletter.model;

import java.util.List;

public class CoverletterMemberVo {
	private String mCletterCd;
	private String recruitJobCd;
	private String loginId;
	private String mCletterName;
	private String mCletterRegdate;
	private String mCletterModidate;
	private String mCletterEnddate;
	private List<CoverletterMemberArticleVo> coverletterMemberArticleVoList;
	private List<CoverletterMemberArticleSaveVo> coverletterMemberArticleSaveVo;
	public String getmCletterCd() {
		return mCletterCd;
	}
	public void setmCletterCd(String mCletterCd) {
		this.mCletterCd = mCletterCd;
	}
	public String getRecruitJobCd() {
		return recruitJobCd;
	}
	public void setRecruitJobCd(String recruitJobCd) {
		this.recruitJobCd = recruitJobCd;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getmCletterName() {
		return mCletterName;
	}
	public void setmCletterName(String mCletterName) {
		this.mCletterName = mCletterName;
	}
	public String getmCletterRegdate() {
		return mCletterRegdate;
	}
	public void setmCletterRegdate(String mCletterRegdate) {
		this.mCletterRegdate = mCletterRegdate;
	}
	public String getmCletterModidate() {
		return mCletterModidate;
	}
	public void setmCletterModidate(String mCletterModidate) {
		this.mCletterModidate = mCletterModidate;
	}
	public String getmCletterEnddate() {
		return mCletterEnddate;
	}
	public void setmCletterEnddate(String mCletterEnddate) {
		this.mCletterEnddate = mCletterEnddate;
	}
	public List<CoverletterMemberArticleVo> getCoverletterMemberArticleVoList() {
		return coverletterMemberArticleVoList;
	}
	public void setCoverletterMemberArticleVoList(List<CoverletterMemberArticleVo> coverletterMemberArticleVoList) {
		this.coverletterMemberArticleVoList = coverletterMemberArticleVoList;
	}
	public List<CoverletterMemberArticleSaveVo> getCoverletterMemberArticleSaveVo() {
		return coverletterMemberArticleSaveVo;
	}
	public void setCoverletterMemberArticleSaveVo(List<CoverletterMemberArticleSaveVo> coverletterMemberArticleSaveVo) {
		this.coverletterMemberArticleSaveVo = coverletterMemberArticleSaveVo;
	}
	@Override
	public String toString() {
		return "CoverletterMemberVo [mCletterCd=" + mCletterCd + ", recruitJobCd=" + recruitJobCd + ", loginId="
				+ loginId + ", mCletterName=" + mCletterName + ", mCletterRegdate=" + mCletterRegdate
				+ ", mCletterModidate=" + mCletterModidate + ", mCletterEnddate=" + mCletterEnddate
				+ ", coverletterMemberArticleVoList=" + coverletterMemberArticleVoList
				+ ", coverletterMemberArticleSaveVo=" + coverletterMemberArticleSaveVo + "]";
	}
	
}
