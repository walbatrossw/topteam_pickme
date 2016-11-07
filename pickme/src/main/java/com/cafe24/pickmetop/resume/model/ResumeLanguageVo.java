package com.cafe24.pickmetop.resume.model;

import java.util.List;

public class ResumeLanguageVo {
	private String languageCd;
	private String resumeCd;
	private String certificateCd;
	private String languageName;
	private String languageTest;
	private String languageGrade;
	private String languageLevel;
	private String languageBegindate;
	private String languageEnddate;
	private String languageRegnum;
	private String languageHost;
	private List<ResumeLanguageVo> resumeLanguageVoList;
	public String getLanguageCd() {
		return languageCd;
	}
	public void setLanguageCd(String languageCd) {
		this.languageCd = languageCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getCertificateCd() {
		return certificateCd;
	}
	public void setCertificateCd(String certificateCd) {
		this.certificateCd = certificateCd;
	}
	public String getLanguageName() {
		return languageName;
	}
	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}
	public String getLanguageTest() {
		return languageTest;
	}
	public void setLanguageTest(String languageTest) {
		this.languageTest = languageTest;
	}
	public String getLanguageGrade() {
		return languageGrade;
	}
	public void setLanguageGrade(String languageGrade) {
		this.languageGrade = languageGrade;
	}
	public String getLanguageLevel() {
		return languageLevel;
	}
	public void setLanguageLevel(String languageLevel) {
		this.languageLevel = languageLevel;
	}
	public String getLanguageBegindate() {
		return languageBegindate;
	}
	public void setLanguageBegindate(String languageBegindate) {
		this.languageBegindate = languageBegindate;
	}
	public String getLanguageEnddate() {
		return languageEnddate;
	}
	public void setLanguageEnddate(String languageEnddate) {
		this.languageEnddate = languageEnddate;
	}
	public String getLanguageRegnum() {
		return languageRegnum;
	}
	public void setLanguageRegnum(String languageRegnum) {
		this.languageRegnum = languageRegnum;
	}
	public String getLanguageHost() {
		return languageHost;
	}
	public void setLanguageHost(String languageHost) {
		this.languageHost = languageHost;
	}
	public List<ResumeLanguageVo> getResumeLanguageVoList() {
		return resumeLanguageVoList;
	}
	public void setResumeLanguageVoList(List<ResumeLanguageVo> resumeLanguageVoList) {
		this.resumeLanguageVoList = resumeLanguageVoList;
	}
	@Override
	public String toString() {
		return "ResumeLanguageVo [languageCd=" + languageCd + ", resumeCd=" + resumeCd + ", certificateCd="
				+ certificateCd + ", languageName=" + languageName + ", languageTest=" + languageTest
				+ ", languageGrade=" + languageGrade + ", languageLevel=" + languageLevel + ", languageBegindate="
				+ languageBegindate + ", languageEnddate=" + languageEnddate + ", languageRegnum=" + languageRegnum
				+ ", languageHost=" + languageHost + ", resumeLanguageVoList=" + resumeLanguageVoList + "]";
	}
	
}
