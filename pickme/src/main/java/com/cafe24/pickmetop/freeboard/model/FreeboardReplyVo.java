package com.cafe24.pickmetop.freeboard.model;

public class FreeboardReplyVo {
	private String replyCd;
	private String loginId;
	private String freeboardCd;
	private String replyContent;
	private String loginNick;
	private String replyRegdate;
	
	public String getReplyCd() {
		return replyCd;
	}
	public void setReplyCd(String replyCd) {
		this.replyCd = replyCd;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getFreeboardCd() {
		return freeboardCd;
	}
	public void setFreeboardCd(String freeboardCd) {
		this.freeboardCd = freeboardCd;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getLoginNick() {
		return loginNick;
	}
	public void setLoginNick(String loginNick) {
		this.loginNick = loginNick;
	}
	public String getReplyRegdate() {
		return replyRegdate;
	}
	public void setReplyRegdate(String replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	@Override
	public String toString() {
		return "FreeboardReplyVo [replyCd=" + replyCd + ", loginId=" + loginId + ", freeboardCd=" + freeboardCd
				+ ", replyContent=" + replyContent + ", loginNick=" + loginNick + ", replyRegdate=" + replyRegdate
				+ "]";
	}

	
}
