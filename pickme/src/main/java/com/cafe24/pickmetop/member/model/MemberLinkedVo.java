package com.cafe24.pickmetop.member.model;

public class MemberLinkedVo {

	private String linkedId;
	private String linkedNick;
	private String linkedRegdate;
	private String linkedLogdate;
	private int linkedState;
	public String getLinkedId() {
		return linkedId;
	}
	public void setLinkedId(String linkedId) {
		this.linkedId = linkedId;
	}
	public String getLinkedNick() {
		return linkedNick;
	}
	public void setLinkedNick(String linkedNick) {
		this.linkedNick = linkedNick;
	}
	public String getLinkedRegdate() {
		return linkedRegdate;
	}
	public void setLinkedRegdate(String linkedRegdate) {
		this.linkedRegdate = linkedRegdate;
	}
	public String getLinkedLogdate() {
		return linkedLogdate;
	}
	public void setLinkedLogdate(String linkedLogdate) {
		this.linkedLogdate = linkedLogdate;
	}
	public int getLinkedState() {
		return linkedState;
	}
	public void setLinkedState(int linkedState) {
		this.linkedState = linkedState;
	}
	@Override
	public String toString() {
		return "MemberLinkedVo [linkedId=" + linkedId + ", linkedNick=" + linkedNick + ", linkedRegdate="
				+ linkedRegdate + ", linkedLogdate=" + linkedLogdate + ", linkedState=" + linkedState + "]";
	}
		
	
	
	
}
