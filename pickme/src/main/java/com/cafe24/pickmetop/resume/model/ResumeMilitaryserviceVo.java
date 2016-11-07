package com.cafe24.pickmetop.resume.model;

public class ResumeMilitaryserviceVo {
	private String militaryserviceCd;
	private String resumeCd;
	private String militaryserviceState;
	private String militaryserviceGroup;
	private String militaryserviceLevel;
	private String militaryserviceBranch;
	private String militaryserviceBegindate;
	private String militaryserviceEnddate;
	public String getMilitaryserviceCd() {
		return militaryserviceCd;
	}
	public void setMilitaryserviceCd(String militaryserviceCd) {
		this.militaryserviceCd = militaryserviceCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getMilitaryserviceState() {
		return militaryserviceState;
	}
	public void setMilitaryserviceState(String militaryserviceState) {
		this.militaryserviceState = militaryserviceState;
	}
	public String getMilitaryserviceGroup() {
		return militaryserviceGroup;
	}
	public void setMilitaryserviceGroup(String militaryserviceGroup) {
		this.militaryserviceGroup = militaryserviceGroup;
	}
	public String getMilitaryserviceLevel() {
		return militaryserviceLevel;
	}
	public void setMilitaryserviceLevel(String militaryserviceLevel) {
		this.militaryserviceLevel = militaryserviceLevel;
	}
	public String getMilitaryserviceBranch() {
		return militaryserviceBranch;
	}
	public void setMilitaryserviceBranch(String militaryserviceBranch) {
		this.militaryserviceBranch = militaryserviceBranch;
	}
	public String getMilitaryserviceBegindate() {
		return militaryserviceBegindate;
	}
	public void setMilitaryserviceBegindate(String militaryserviceBegindate) {
		this.militaryserviceBegindate = militaryserviceBegindate;
	}
	public String getMilitaryserviceEnddate() {
		return militaryserviceEnddate;
	}
	public void setMilitaryserviceEnddate(String militaryserviceEnddate) {
		this.militaryserviceEnddate = militaryserviceEnddate;
	}
	@Override
	public String toString() {
		return "ResumeMilitaryserviceVo [militaryserviceCd=" + militaryserviceCd + ", resumeCd=" + resumeCd
				+ ", militaryserviceState=" + militaryserviceState + ", militaryserviceGroup=" + militaryserviceGroup
				+ ", militaryserviceLevel=" + militaryserviceLevel + ", militaryserviceBranch=" + militaryserviceBranch
				+ ", militaryserviceBegindate=" + militaryserviceBegindate + ", militaryserviceEnddate="
				+ militaryserviceEnddate + "]";
	}
	
}
