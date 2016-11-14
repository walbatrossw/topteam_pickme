package com.cafe24.pickmetop.coverletter.model;

public class CoverletterCompanyJobInfoVo {
	private String recruitJobCd; // 기업 직무별 코드
	private String recruitName; // 채용공고명
	private String companyName; // 기업명
	private String jobMidindexName; // 직무중분류명
	private String recruitJobJobdetail; // 채용상세직무
	private String recruitEnddate; // 채용마감일
	private String recruitJobEducation; //채용학력
	private String recruitJobWorkstatus; //채용형태
	public String getRecruitJobCd() {
		return recruitJobCd;
	}
	public void setRecruitJobCd(String recruitJobCd) {
		this.recruitJobCd = recruitJobCd;
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
	public String getJobMidindexName() {
		return jobMidindexName;
	}
	public void setJobMidindexName(String jobMidindexName) {
		this.jobMidindexName = jobMidindexName;
	}
	public String getRecruitJobJobdetail() {
		return recruitJobJobdetail;
	}
	public void setRecruitJobJobdetail(String recruitJobJobdetail) {
		this.recruitJobJobdetail = recruitJobJobdetail;
	}
	public String getRecruitEnddate() {
		return recruitEnddate;
	}
	public void setRecruitEnddate(String recruitEnddate) {
		this.recruitEnddate = recruitEnddate;
	}
	public String getRecruitJobEducation() {
		return recruitJobEducation;
	}
	public void setRecruitJobEducation(String recruitJobEducation) {
		this.recruitJobEducation = recruitJobEducation;
	}
	public String getRecruitJobWorkstatus() {
		return recruitJobWorkstatus;
	}
	public void setRecruitJobWorkstatus(String recruitJobWorkstatus) {
		this.recruitJobWorkstatus = recruitJobWorkstatus;
	}
	@Override
	public String toString() {
		return "CoverletterCompanyJobInfoVo [recruitJobCd=" + recruitJobCd + ", recruitName=" + recruitName
				+ ", companyName=" + companyName + ", jobMidindexName=" + jobMidindexName + ", recruitJobJobdetail="
				+ recruitJobJobdetail + ", recruitEnddate=" + recruitEnddate + ", recruitJobEducation="
				+ recruitJobEducation + ", recruitJobWorkstatus=" + recruitJobWorkstatus + "]";
	}
}
