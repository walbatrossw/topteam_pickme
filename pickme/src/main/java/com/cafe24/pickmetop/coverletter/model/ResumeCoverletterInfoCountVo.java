package com.cafe24.pickmetop.coverletter.model;

public class ResumeCoverletterInfoCountVo {
	private String loginId;
	private int myCoverletterCount;
	private int myResumeCount;
	private int myRecruitBookmarkCount;
	private int myFreeboardWriteCount;
	private int myFreeboardBookmarkCount;
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
	public int getMyFreeboardWriteCount() {
		return myFreeboardWriteCount;
	}
	public void setMyFreeboardWriteCount(int myFreeboardWriteCount) {
		this.myFreeboardWriteCount = myFreeboardWriteCount;
	}
	public int getMyFreeboardBookmarkCount() {
		return myFreeboardBookmarkCount;
	}
	public void setMyFreeboardBookmarkCount(int myFreeboardBookmarkCount) {
		this.myFreeboardBookmarkCount = myFreeboardBookmarkCount;
	}
	@Override
	public String toString() {
		return "ResumeCoverletterInfoCountVo [loginId=" + loginId + ", myCoverletterCount=" + myCoverletterCount
				+ ", myResumeCount=" + myResumeCount + ", myRecruitBookmarkCount=" + myRecruitBookmarkCount
				+ ", myFreeboardWriteCount=" + myFreeboardWriteCount + ", myFreeboardBookmarkCount="
				+ myFreeboardBookmarkCount + "]";
	}
	
}
