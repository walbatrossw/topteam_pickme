package com.cafe24.pickmetop.freeboard.model;

public class FreeboardVo {
	
	private String freeboardCd;
	private String loginId;
	private String freeboardRegdate;
	private String freeboardTitle;
	private String freeboardContent;
	private String freeboardNick;
	private String freeboardCateCd;
	
	public String getFreeboardCd() {
		return freeboardCd;
	}
	public void setFreeboardCd(String freeboardCd) {
		this.freeboardCd = freeboardCd;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getFreeboardRegdate() {
		return freeboardRegdate;
	}
	public void setFreeboardRegdate(String freeboardRegdate) {
		this.freeboardRegdate = freeboardRegdate;
	}
	public String getFreeboardTitle() {
		return freeboardTitle;
	}
	public void setFreeboardTitle(String freeboardTitle) {
		this.freeboardTitle = freeboardTitle;
	}
	public String getFreeboardContent() {
		return freeboardContent;
	}
	public void setFreeboardContent(String freeboardContent) {
		this.freeboardContent = freeboardContent;
	}
	public String getFreeboardNick() {
		return freeboardNick;
	}
	public void setFreeboardNick(String freeboardNick) {
		this.freeboardNick = freeboardNick;
	}
	public String getFreeboardCateCd() {
		return freeboardCateCd;
	}
	public void setFreeboardCateCd(String freeboardCateCd) {
		this.freeboardCateCd = freeboardCateCd;
	}

	
	@Override
	public String toString() {
		return "FreeboardVo [freeboardCd=" + freeboardCd + ", loginId=" + loginId + ", freeboardRegdate="
				+ freeboardRegdate + ", freeboardTitle=" + freeboardTitle + ", freeboardContent=" + freeboardContent
				+ ", freeboardNick=" + freeboardNick + ", freeboardCateCd=" + freeboardCateCd
				+ "]";
	}
}
	
