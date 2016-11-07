package com.cafe24.pickmetop.resume.model;

import java.util.List;

public class ResumeCareerVo {
	private String careerCd;
	private String resumeCd;
	private String careerCompany;
	private String careerBegindate;
	private String careerEnddate;
	private String careerPeriod;
	private String careerResign;
	private String careerLevel;
	private String careerDepartment;
	private String careerTask;
	private List<ResumeCareerVo> resumeCareerVoList;
	public String getCareerCd() {
		return careerCd;
	}
	public void setCareerCd(String careerCd) {
		this.careerCd = careerCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getCareerCompany() {
		return careerCompany;
	}
	public void setCareerCompany(String careerCompany) {
		this.careerCompany = careerCompany;
	}
	public String getCareerBegindate() {
		return careerBegindate;
	}
	public void setCareerBegindate(String careerBegindate) {
		this.careerBegindate = careerBegindate;
	}
	public String getCareerEnddate() {
		return careerEnddate;
	}
	public void setCareerEnddate(String careerEnddate) {
		this.careerEnddate = careerEnddate;
	}
	public String getCareerPeriod() {
		return careerPeriod;
	}
	public void setCareerPeriod(String careerPeriod) {
		this.careerPeriod = careerPeriod;
	}
	public String getCareerResign() {
		return careerResign;
	}
	public void setCareerResign(String careerResign) {
		this.careerResign = careerResign;
	}
	public String getCareerLevel() {
		return careerLevel;
	}
	public void setCareerLevel(String careerLevel) {
		this.careerLevel = careerLevel;
	}
	public String getCareerDepartment() {
		return careerDepartment;
	}
	public void setCareerDepartment(String careerDepartment) {
		this.careerDepartment = careerDepartment;
	}
	public String getCareerTask() {
		return careerTask;
	}
	public void setCareerTask(String careerTask) {
		this.careerTask = careerTask;
	}
	public List<ResumeCareerVo> getResumeCareerVoList() {
		return resumeCareerVoList;
	}
	public void setResumeCareerVoList(List<ResumeCareerVo> resumeCareerVoList) {
		this.resumeCareerVoList = resumeCareerVoList;
	}
	@Override
	public String toString() {
		return "ResumeCareerVo [careerCd=" + careerCd + ", resumeCd=" + resumeCd + ", careerCompany=" + careerCompany
				+ ", careerBegindate=" + careerBegindate + ", careerEnddate=" + careerEnddate + ", careerPeriod="
				+ careerPeriod + ", careerResign=" + careerResign + ", careerLevel=" + careerLevel
				+ ", careerDepartment=" + careerDepartment + ", careerTask=" + careerTask + ", resumeCareerVoList="
				+ resumeCareerVoList + "]";
	}
	
}
