package com.cafe24.pickmetop.resume.model;

public class ResumeHighschoolVo {
	private String highschoolCd;
	private String resumeCd;
	private String highschoolName;
	private String highschoolCategory;
	private String highschoolBegindate;
	private String highschoolEnddate;
	public String getHighschoolCd() {
		return highschoolCd;
	}
	public void setHighschoolCd(String highschoolCd) {
		this.highschoolCd = highschoolCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getHighschoolName() {
		return highschoolName;
	}
	public void setHighschoolName(String highschoolName) {
		this.highschoolName = highschoolName;
	}
	public String getHighschoolCategory() {
		return highschoolCategory;
	}
	public void setHighschoolCategory(String highschoolCategory) {
		this.highschoolCategory = highschoolCategory;
	}
	public String getHighschoolBegindate() {
		return highschoolBegindate;
	}
	public void setHighschoolBegindate(String highschoolBegindate) {
		this.highschoolBegindate = highschoolBegindate;
	}
	public String getHighschoolEnddate() {
		return highschoolEnddate;
	}
	public void setHighschoolEnddate(String highschoolEnddate) {
		this.highschoolEnddate = highschoolEnddate;
	}
	@Override
	public String toString() {
		return "ResumeHighschoolVo [highschoolCd=" + highschoolCd + ", resumeCd=" + resumeCd + ", highschoolName="
				+ highschoolName + ", highschoolCategory=" + highschoolCategory + ", highschoolBegindate="
				+ highschoolBegindate + ", highschoolEnddate=" + highschoolEnddate + "]";
	}
	
}
