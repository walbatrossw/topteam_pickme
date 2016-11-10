package com.cafe24.pickmetop.recruit.model;

public class RecruitCompanyBookmarkVo {
	String memberCustomBookmarkCd;
	String loginId;
	String recruitCompanyCd;
	public String getMemberCustomBookmarkCd() {
		return memberCustomBookmarkCd;
	}
	public void setMemberCustomBookmarkCd(String memberCustomBookmarkCd) {
		this.memberCustomBookmarkCd = memberCustomBookmarkCd;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getRecruitCompanyCd() {
		return recruitCompanyCd;
	}
	public void setRecruitCompanyCd(String recruitCompanyCd) {
		this.recruitCompanyCd = recruitCompanyCd;
	}
	@Override
	public String toString() {
		return "RecruitCompanyBookmarkVo [memberCustomBookmarkCd=" + memberCustomBookmarkCd + ", loginId=" + loginId
				+ ", recruitCompanyCd=" + recruitCompanyCd + "]";
	}
	
}
