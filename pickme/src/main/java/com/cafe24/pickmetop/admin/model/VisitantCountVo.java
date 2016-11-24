package com.cafe24.pickmetop.admin.model;

public class VisitantCountVo {
	private int visitantCd;
	private int visitantTodayCount;
	private int visitantTotalCount;
	private String visitantRegdate;
	
	public int getVisitantCd() {
		return visitantCd;
	}
	public void setVisitantCd(int visitantCd) {
		this.visitantCd = visitantCd;
	}
	public int getVisitantTodayCount() {
		return visitantTodayCount;
	}
	public void setVisitantTodayCount(int visitantTodayCount) {
		this.visitantTodayCount = visitantTodayCount;
	}
	public int getVisitantTotalCount() {
		return visitantTotalCount;
	}
	public void setVisitantTotalCount(int visitantTotalCount) {
		this.visitantTotalCount = visitantTotalCount;
	}
	public String getVisitantRegdate() {
		return visitantRegdate;
	}
	public void setVisitantRegdate(String visitantRegdate) {
		this.visitantRegdate = visitantRegdate;
	}
	@Override
	public String toString() {
		return "VisitantCountVo [visitantCd=" + visitantCd + ", visitantTodayCount=" + visitantTodayCount
				+ ", visitantTotalCount=" + visitantTotalCount + ", visitantRegdate=" + visitantRegdate + "]";
	}
	
	
	
	
}
