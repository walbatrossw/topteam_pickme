package com.cafe24.pickmetop.member.model;

import java.sql.Date;

public class MemberWorkstateVo {
	
	private String withdrawCd;
	private String companyCd;
	private String loginId;
	private String workstateState;
	private Date workstateBegindate;
	private Date workstateEnddate;
	private String workstateRegdate;
	private String workstateModidate;
	public String getWithdrawCd() {
		return withdrawCd;
	}
	public void setWithdrawCd(String withdrawCd) {
		this.withdrawCd = withdrawCd;
	}
	public String getCompanyCd() {
		return companyCd;
	}
	public void setCompanyCd(String companyCd) {
		this.companyCd = companyCd;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getWorkstateState() {
		return workstateState;
	}
	public void setWorkstateState(String workstateState) {
		this.workstateState = workstateState;
	}
	public Date getWorkstateBegindate() {
		return workstateBegindate;
	}
	public void setWorkstateBegindate(Date workstateBegindate) {
		this.workstateBegindate = workstateBegindate;
	}
	public Date getWorkstateEnddate() {
		return workstateEnddate;
	}
	public void setWorkstateEnddate(Date workstateEnddate) {
		this.workstateEnddate = workstateEnddate;
	}
	public String getWorkstateRegdate() {
		return workstateRegdate;
	}
	public void setWorkstateRegdate(String workstateRegdate) {
		this.workstateRegdate = workstateRegdate;
	}
	public String getWorkstateModidate() {
		return workstateModidate;
	}
	public void setWorkstateModidate(String workstateModidate) {
		this.workstateModidate = workstateModidate;
	}
	@Override
	public String toString() {
		return "MemberWorkstateVo [withdrawCd=" + withdrawCd + ", companyCd=" + companyCd + ", loginId=" + loginId
				+ ", workstateState=" + workstateState + ", workstateBegindate=" + workstateBegindate
				+ ", workstateEnddate=" + workstateEnddate + ", workstateRegdate=" + workstateRegdate
				+ ", workstateModidate=" + workstateModidate + "]";
	}
	
	
	
}
