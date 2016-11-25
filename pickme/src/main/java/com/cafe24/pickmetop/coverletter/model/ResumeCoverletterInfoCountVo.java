package com.cafe24.pickmetop.coverletter.model;

public class ResumeCoverletterInfoCountVo {
	private String loginId;
	private int myCoverletterCount;
	private int myResumeCount;
	private int myRecruitBookmarkCount;
	private int myFreeBoardCount;
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public int getMyCoverletterCount() {
		return myCoverletterCount;
	}
	public void setMyCoverletterCount(int myCoverletterCount) {
		this.myCoverletterCount = myCoverletterCount;
	}
	public int getMyResumeCount() {
		return myResumeCount;
	}
	public void setMyResumeCount(int myResumeCount) {
		this.myResumeCount = myResumeCount;
	}
	public int getMyRecruitBookmarkCount() {
		return myRecruitBookmarkCount;
	}
	public void setMyRecruitBookmarkCount(int myRecruitBookmarkCount) {
		this.myRecruitBookmarkCount = myRecruitBookmarkCount;
	}
	public int getMyFreeBoardCount() {
		return myFreeBoardCount;
	}
	public void setMyFreeBoardCount(int myFreeBoardCount) {
		this.myFreeBoardCount = myFreeBoardCount;
	}
	@Override
	public String toString() {
		return "ResumeCoverletterInfoCountVo [loginId=" + loginId + ", myCoverletterCount=" + myCoverletterCount
				+ ", myResumeCount=" + myResumeCount + ", myRecruitBookmarkCount=" + myRecruitBookmarkCount
				+ ", myFreeBoardCount=" + myFreeBoardCount + "]";
	}
	
}
