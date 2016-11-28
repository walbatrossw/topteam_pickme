package com.cafe24.pickmetop.coverletter.model;

public class CoverletterBookmarkListVo {
	private String memberCustomBookmarkCd; 
	private String loginId;
	private String recruitCompanyCd;
	private String recruitName;
	private String companyName;
	private String recruitJobCd;
	private String recruitEnddate;
	private String recruitJobJobdetail;
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
	public String getRecruitName() {
		return recruitName;
	}
	public void setRecruitName(String recruitName) {
		this.recruitName = recruitName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getRecruitJobCd() {
		return recruitJobCd;
	}
	public void setRecruitJobCd(String recruitJobCd) {
		this.recruitJobCd = recruitJobCd;
	}
	public String getRecruitEnddate() {
		return recruitEnddate;
	}
	public void setRecruitEnddate(String recruitEnddate) {
		this.recruitEnddate = recruitEnddate;
	}
	public String getRecruitJobJobdetail() {
		return recruitJobJobdetail;
	}
	public void setRecruitJobJobdetail(String recruitJobJobdetail) {
		this.recruitJobJobdetail = recruitJobJobdetail;
	}
	@Override
	public String toString() {
		return "CoverletterBookmarkListVo [memberCustomBookmarkCd=" + memberCustomBookmarkCd + ", loginId=" + loginId
				+ ", recruitCompanyCd=" + recruitCompanyCd + ", recruitName=" + recruitName + ", companyName="
				+ companyName + ", recruitJobCd=" + recruitJobCd + ", recruitEnddate=" + recruitEnddate
				+ ", recruitJobJobdetail=" + recruitJobJobdetail + "]";
	}
	
}
