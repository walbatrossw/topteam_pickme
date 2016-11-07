package com.cafe24.pickmetop.member.model;

public class MemberGeneralVo {
	
	private String generalId;
	
	private String generalPw;
	
	private String generalNick;
	private int generalLevel;
	private String generalDate;
	private String generalLogdate;
	private int generalState;
	public String getGeneralId() {
		return generalId;
	}
	public void setGeneralId(String generalId) {
		this.generalId = generalId;
	}
	public String getGeneralPw() {
		return generalPw;
	}
	public void setGeneralPw(String generalPw) {
		this.generalPw = generalPw;
	}
	public String getGeneralNick() {
		return generalNick;
	}
	public void setGeneralNick(String generalNick) {
		this.generalNick = generalNick;
	}
	public int getGeneralLevel() {
		return generalLevel;
	}
	public void setGeneralLevel(int generalLevel) {
		this.generalLevel = generalLevel;
	}
	public String getGeneralDate() {
		return generalDate;
	}
	public void setGeneralDate(String generalDate) {
		this.generalDate = generalDate;
	}
	public String getGeneralLogdate() {
		return generalLogdate;
	}
	public void setGeneralLogdate(String generalLogdate) {
		this.generalLogdate = generalLogdate;
	}
	public int getGeneralState() {
		return generalState;
	}
	public void setGeneralState(int generalState) {
		this.generalState = generalState;
	}
	@Override
	public String toString() {
		return "MemberGeneralVo [generalId=" + generalId + ", generalPw=" + generalPw + ", generalNick=" + generalNick
				+ ", generalLevel=" + generalLevel + ", generalDate=" + generalDate + ", generalLogdate="
				+ generalLogdate + ", generalState=" + generalState + "]";
	}
	
		
}
