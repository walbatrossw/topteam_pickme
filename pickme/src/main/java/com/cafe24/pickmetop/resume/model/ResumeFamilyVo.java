package com.cafe24.pickmetop.resume.model;

import java.util.List;

public class ResumeFamilyVo {
	private String familyCd;
	private String resumeCd;
	private String familyRelation;
	private String familyName;
	private String familyBirthdate;
	private String familyEducation;
	private String familyJob;
	private String familyCohabit;
	private List<ResumeFamilyVo> resumeFamilyVoList;
	public String getFamilyCd() {
		return familyCd;
	}
	public void setFamilyCd(String familyCd) {
		this.familyCd = familyCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getFamilyRelation() {
		return familyRelation;
	}
	public void setFamilyRelation(String familyRelation) {
		this.familyRelation = familyRelation;
	}
	public String getFamilyName() {
		return familyName;
	}
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getFamilyBirthdate() {
		return familyBirthdate;
	}
	public void setFamilyBirthdate(String familyBirthdate) {
		this.familyBirthdate = familyBirthdate;
	}
	public String getFamilyEducation() {
		return familyEducation;
	}
	public void setFamilyEducation(String familyEducation) {
		this.familyEducation = familyEducation;
	}
	public String getFamilyJob() {
		return familyJob;
	}
	public void setFamilyJob(String familyJob) {
		this.familyJob = familyJob;
	}
	public String getFamilyCohabit() {
		return familyCohabit;
	}
	public void setFamilyCohabit(String familyCohabit) {
		this.familyCohabit = familyCohabit;
	}
	public List<ResumeFamilyVo> getResumeFamilyVoList() {
		return resumeFamilyVoList;
	}
	public void setResumeFamilyVoList(List<ResumeFamilyVo> resumeFamilyVoList) {
		this.resumeFamilyVoList = resumeFamilyVoList;
	}
	@Override
	public String toString() {
		return "ResumeFamilyVo [familyCd=" + familyCd + ", resumeCd=" + resumeCd + ", familyRelation=" + familyRelation
				+ ", familyName=" + familyName + ", familyBirthdate=" + familyBirthdate + ", familyEducation="
				+ familyEducation + ", familyJob=" + familyJob + ", familyCohabit=" + familyCohabit
				+ ", resumeFamilyVoList=" + resumeFamilyVoList + "]";
	}
	
}
