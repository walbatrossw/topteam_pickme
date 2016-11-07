package com.cafe24.pickmetop.recruit.model;

import org.springframework.stereotype.Component;

@Component
public class RecruitCompany {
	String recruitCompanyCd;
	String companyCd;
	String recruitName;
	String recruitBegindate;
	String recruitEnddate;
	String recruitRegdate;
	String recruitRegister;
	String recruitModidate;
	String recruitModify;
	
	public String getRecruitCompanyCd() {
		return recruitCompanyCd;
	}
	public void setRecruitCompanyCd(String recruitCompanyCd) {
		this.recruitCompanyCd = recruitCompanyCd;
	}
	public String getCompanyCd() {
		return companyCd;
	}
	public void setCompanyCd(String companyCd) {
		this.companyCd = companyCd;
	}
	public String getRecruitName() {
		return recruitName;
	}
	public void setRecruitName(String recruitName) {
		this.recruitName = recruitName;
	}
	public String getRecruitBegindate() {
		return recruitBegindate;
	}
	public void setRecruitBegindate(String recruitBegindate) {
		this.recruitBegindate = recruitBegindate;
	}
	public String getRecruitEnddate() {
		return recruitEnddate;
	}
	public void setRecruitEnddate(String recruitEnddate) {
		this.recruitEnddate = recruitEnddate;
	}
	public String getRecruitRegdate() {
		return recruitRegdate;
	}
	public void setRecruitRegdate(String recruitRegdate) {
		this.recruitRegdate = recruitRegdate;
	}
	public String getRecruitRegister() {
		return recruitRegister;
	}
	public void setRecruitRegister(String recruitRegister) {
		this.recruitRegister = recruitRegister;
	}
	public String getRecruitModidate() {
		return recruitModidate;
	}
	public void setRecruitModidate(String recruitModidate) {
		this.recruitModidate = recruitModidate;
	}
	public String getRecruitModify() {
		return recruitModify;
	}
	public void setRecruitModify(String recruitModify) {
		this.recruitModify = recruitModify;
	}
	@Override
	public String toString() {
		return "RecruitCompany [recruitCompanyCd=" + recruitCompanyCd + ", companyCd=" + companyCd + ", recruitName="
				+ recruitName + ", recruitBegindate=" + recruitBegindate + ", recruitEnddate=" + recruitEnddate
				+ ", recruitRegdate=" + recruitRegdate + ", recruitRegister=" + recruitRegister + ", recruitModidate="
				+ recruitModidate + ", recruitModify=" + recruitModify + "]";
	}
	
}
