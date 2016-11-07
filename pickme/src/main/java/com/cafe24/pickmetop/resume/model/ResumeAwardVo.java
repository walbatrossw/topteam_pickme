package com.cafe24.pickmetop.resume.model;

import java.util.List;

public class ResumeAwardVo {
	private String awardCd;
	private String resumeCd;
	private String awardName;
	private String awardContent;
	private String awardHost;
	private String awardDate;
	private List<ResumeAwardVo> resumeAwardVoList;
	public String getAwardCd() {
		return awardCd;
	}
	public void setAwardCd(String awardCd) {
		this.awardCd = awardCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getAwardName() {
		return awardName;
	}
	public void setAwardName(String awardName) {
		this.awardName = awardName;
	}
	public String getAwardContent() {
		return awardContent;
	}
	public void setAwardContent(String awardContent) {
		this.awardContent = awardContent;
	}
	public String getAwardHost() {
		return awardHost;
	}
	public void setAwardHost(String awardHost) {
		this.awardHost = awardHost;
	}
	public String getAwardDate() {
		return awardDate;
	}
	public void setAwardDate(String awardDate) {
		this.awardDate = awardDate;
	}
	public List<ResumeAwardVo> getResumeAwardVoList() {
		return resumeAwardVoList;
	}
	public void setResumeAwardVoList(List<ResumeAwardVo> resumeAwardVoList) {
		this.resumeAwardVoList = resumeAwardVoList;
	}
	@Override
	public String toString() {
		return "ResumeAwardVo [awardCd=" + awardCd + ", resumeCd=" + resumeCd + ", awardName=" + awardName
				+ ", awardContent=" + awardContent + ", awardHost=" + awardHost + ", awardDate=" + awardDate
				+ ", resumeAwardVoList=" + resumeAwardVoList + "]";
	}
	
	
}
