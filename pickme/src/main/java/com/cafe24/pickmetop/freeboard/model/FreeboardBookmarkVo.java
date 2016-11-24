package com.cafe24.pickmetop.freeboard.model;

public class FreeboardBookmarkVo {
	private String freeboardBookmarkCd;
	private String freeboardCd;
	private String loginId;
	private String freeboardBookmarkRegdate;
	public String getFreeboardBookmarkCd() {
		return freeboardBookmarkCd;
	}
	public void setFreeboardBookmarkCd(String freeboardBookmarkCd) {
		this.freeboardBookmarkCd = freeboardBookmarkCd;
	}
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
	public String getFreeboardBookmarkRegdate() {
		return freeboardBookmarkRegdate;
	}
	public void setFreeboardBookmarkRegdate(String freeboardBookmarkRegdate) {
		this.freeboardBookmarkRegdate = freeboardBookmarkRegdate;
	}
	@Override
	public String toString() {
		return "FreeboardBookmarkVo [freeboardBookmarkCd=" + freeboardBookmarkCd + ", freeboardCd=" + freeboardCd
				+ ", loginId=" + loginId + ", freeboardBookmarkRegdate=" + freeboardBookmarkRegdate + "]";
	}
	
	
	
	
}
