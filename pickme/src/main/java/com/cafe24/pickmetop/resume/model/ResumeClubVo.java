package com.cafe24.pickmetop.resume.model;

import java.util.List;

public class ResumeClubVo {
	private String clubCd;
	private String resumeCd;
	private String clubName;
	private String clubHost;
	private String clubBegindate;
	private String clubEnddate;
	private String clubContent;
	private List<ResumeClubVo> resumeClubVoList;
	public String getClubCd() {
		return clubCd;
	}
	public void setClubCd(String clubCd) {
		this.clubCd = clubCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getClubName() {
		return clubName;
	}
	public void setClubName(String clubName) {
		this.clubName = clubName;
	}
	public String getClubHost() {
		return clubHost;
	}
	public void setClubHost(String clubHost) {
		this.clubHost = clubHost;
	}
	public String getClubBegindate() {
		return clubBegindate;
	}
	public void setClubBegindate(String clubBegindate) {
		this.clubBegindate = clubBegindate;
	}
	public String getClubEnddate() {
		return clubEnddate;
	}
	public void setClubEnddate(String clubEnddate) {
		this.clubEnddate = clubEnddate;
	}
	public String getClubContent() {
		return clubContent;
	}
	public void setClubContent(String clubContent) {
		this.clubContent = clubContent;
	}
	public List<ResumeClubVo> getResumeClubVoList() {
		return resumeClubVoList;
	}
	public void setResumeClubVoList(List<ResumeClubVo> resumeClubVoList) {
		this.resumeClubVoList = resumeClubVoList;
	}
	@Override
	public String toString() {
		return "ResumeClubVo [clubCd=" + clubCd + ", resumeCd=" + resumeCd + ", clubName=" + clubName + ", clubHost="
				+ clubHost + ", clubBegindate=" + clubBegindate + ", clubEnddate=" + clubEnddate + ", clubContent="
				+ clubContent + ", resumeClubVoList=" + resumeClubVoList + "]";
	}
	
}
