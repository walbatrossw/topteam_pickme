package com.cafe24.pickmetop.member.model;

import java.sql.Date;

public class MemberWithdrawVo {

	private String withdrawCd;
	private String withdrawId;
	private int withdrawState;
	private Date withdrawDate;
	private String generalId;
	public String getWithdrawCd() {
		return withdrawCd;
	}
	public void setWithdrawCd(String withdrawCd) {
		this.withdrawCd = withdrawCd;
	}
	public String getWithdrawId() {
		return withdrawId;
	}
	public void setWithdrawId(String withdrawId) {
		this.withdrawId = withdrawId;
	}
	public int getWithdrawState() {
		return withdrawState;
	}
	public void setWithdrawState(int withdrawState) {
		this.withdrawState = withdrawState;
	}
	public Date getWithdrawDate() {
		return withdrawDate;
	}
	public void setWithdrawDate(Date withdrawDate) {
		this.withdrawDate = withdrawDate;
	}
	public String getGeneralId() {
		return generalId;
	}
	public void setGeneralId(String generalId) {
		this.generalId = generalId;
	}
	@Override
	public String toString() {
		return "MemberWithdrawVo [withdrawCd=" + withdrawCd + ", withdrawId=" + withdrawId + ", withdrawState="
				+ withdrawState + ", withdrawDate=" + withdrawDate + ", generalId=" + generalId + "]";
	}
	
	
}
