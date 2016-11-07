package com.cafe24.pickmetop.recruit.model;

import java.util.List;

import org.springframework.stereotype.Component;


@Component
public class RecruitCompanyJobVo {
String recruitJobCd;
String recruitCompanyCd;
String companyCd;
String jobMidindexCd;
String recruitJobWorkstatus;
String recruitJobJobdetail;
String recruitJobEducation;
String recruitJobFile;

//List<String> cCletterArticle;
public String getRecruitJobCd() {
	return recruitJobCd;
}
public void setRecruitJobCd(String recruitJobCd) {
	this.recruitJobCd = recruitJobCd;
}
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
public String getJobMidindexCd() {
	return jobMidindexCd;
}
public void setJobMidindexCd(String jobMidindexCd) {
	this.jobMidindexCd = jobMidindexCd;
}
public String getRecruitJobWorkstatus() {
	return recruitJobWorkstatus;
}
public void setRecruitJobWorkstatus(String recruitJobWorkstatus) {
	this.recruitJobWorkstatus = recruitJobWorkstatus;
}
public String getRecruitJobJobdetail() {
	return recruitJobJobdetail;
}
public void setRecruitJobJobdetail(String recruitJobJobdetail) {
	this.recruitJobJobdetail = recruitJobJobdetail;
}
public String getRecruitJobEducation() {
	return recruitJobEducation;
}
public void setRecruitJobEducation(String recruitJobEducation) {
	this.recruitJobEducation = recruitJobEducation;
}
public String getRecruitJobFile() {
	return recruitJobFile;
}
public void setRecruitJobFile(String recruitJobFile) {
	this.recruitJobFile = recruitJobFile;
}
@Override
public String toString() {
	return "RecruitCompanyJobVo [recruitJobCd=" + recruitJobCd + ", recruitCompanyCd=" + recruitCompanyCd
			+ ", companyCd=" + companyCd + ", jobMidindexCd=" + jobMidindexCd + ", recruitJobWorkstatus="
			+ recruitJobWorkstatus + ", recruitJobJobdetail=" + recruitJobJobdetail + ", recruitJobEducation="
			+ recruitJobEducation + ", recruitJobFile=" + recruitJobFile + "]";
}



}
