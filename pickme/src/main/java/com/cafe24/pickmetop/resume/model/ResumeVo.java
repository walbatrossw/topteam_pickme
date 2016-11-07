package com.cafe24.pickmetop.resume.model;

public class ResumeVo {
	
	private String resumeCd;
	private String loginId;
	private String resumeName;
	private String resumeRegdate;
	private String resumeModidate;
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getResumeName() {
		return resumeName;
	}
	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}
	public String getResumeRegdate() {
		return resumeRegdate;
	}
	public void setResumeRegdate(String resumeRegdate) {
		this.resumeRegdate = resumeRegdate;
	}
	public String getResumeModidate() {
		return resumeModidate;
	}
	public void setResumeModidate(String resumeModidate) {
		this.resumeModidate = resumeModidate;
	}
	@Override
	public String toString() {
		return "ResumeVo [resumeCd=" + resumeCd + ", loginId=" + loginId + ", resumeName=" + resumeName
				+ ", resumeRegdate=" + resumeRegdate + ", resumeModidate=" + resumeModidate + "]";
	}
	
}
