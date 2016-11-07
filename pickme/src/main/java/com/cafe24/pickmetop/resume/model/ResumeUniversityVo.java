package com.cafe24.pickmetop.resume.model;

import java.util.List;

public class ResumeUniversityVo {
	private String universityCd;
	private String resumeCd;
	private String universityName;
	private String universityCategory;
	private String universityBegindate;
	private String universityEnddate;
	private String universityMajor;
	private String universityDmajorminor;
	private String universityDmajorminorName;
	private String universityCredit;
	private List<ResumeUniversityVo> resumeUniversityVoList;
	public String getUniversityCd() {
		return universityCd;
	}
	public void setUniversityCd(String universityCd) {
		this.universityCd = universityCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getUniversityName() {
		return universityName;
	}
	public void setUniversityName(String universityName) {
		this.universityName = universityName;
	}
	public String getUniversityCategory() {
		return universityCategory;
	}
	public void setUniversityCategory(String universityCategory) {
		this.universityCategory = universityCategory;
	}
	public String getUniversityBegindate() {
		return universityBegindate;
	}
	public void setUniversityBegindate(String universityBegindate) {
		this.universityBegindate = universityBegindate;
	}
	public String getUniversityEnddate() {
		return universityEnddate;
	}
	public void setUniversityEnddate(String universityEnddate) {
		this.universityEnddate = universityEnddate;
	}
	public String getUniversityMajor() {
		return universityMajor;
	}
	public void setUniversityMajor(String universityMajor) {
		this.universityMajor = universityMajor;
	}
	public String getUniversityDmajorminor() {
		return universityDmajorminor;
	}
	public void setUniversityDmajorminor(String universityDmajorminor) {
		this.universityDmajorminor = universityDmajorminor;
	}
	public String getUniversityDmajorminorName() {
		return universityDmajorminorName;
	}
	public void setUniversityDmajorminorName(String universityDmajorminorName) {
		this.universityDmajorminorName = universityDmajorminorName;
	}
	public String getUniversityCredit() {
		return universityCredit;
	}
	public void setUniversityCredit(String universityCredit) {
		this.universityCredit = universityCredit;
	}
	public List<ResumeUniversityVo> getResumeUniversityVoList() {
		return resumeUniversityVoList;
	}
	public void setResumeUniversityVoList(List<ResumeUniversityVo> resumeUniversityVoList) {
		this.resumeUniversityVoList = resumeUniversityVoList;
	}
	@Override
	public String toString() {
		return "ResumeUniversityVo [universityCd=" + universityCd + ", resumeCd=" + resumeCd + ", universityName="
				+ universityName + ", universityCategory=" + universityCategory + ", universityBegindate="
				+ universityBegindate + ", universityEnddate=" + universityEnddate + ", universityMajor="
				+ universityMajor + ", universityDmajorminor=" + universityDmajorminor + ", universityDmajorminorName="
				+ universityDmajorminorName + ", universityCredit=" + universityCredit + ", resumeUniversityVoList="
				+ resumeUniversityVoList + "]";
	}
	
}
