package com.cafe24.pickmetop.coverletter.model;

import java.util.Date;

public class CoverletterMemberVo {
	String mCletterCd;
	String recruitJobCd;
	String loginId;
	String mCletterName;
	Date mCletterRegdate;
	Date mCletterModidate;
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
	public Date getmCletterRegdate() {
		return mCletterRegdate;
	}
	public void setmCletterRegdate(Date mCletterRegdate) {
		this.mCletterRegdate = mCletterRegdate;
	}
	public Date getmCletterModidate() {
		return mCletterModidate;
	}
	public void setmCletterModidate(Date mCletterModidate) {
		this.mCletterModidate = mCletterModidate;
	}
	@Override
	public String toString() {
		return "CoverletterMemberVo [mCletterCd=" + mCletterCd + ", recruitJobCd=" + recruitJobCd + ", loginId="
				+ loginId + ", mCletterName=" + mCletterName + ", mCletterRegdate=" + mCletterRegdate
				+ ", mCletterModidate=" + mCletterModidate + "]";
	}
	
	

}
