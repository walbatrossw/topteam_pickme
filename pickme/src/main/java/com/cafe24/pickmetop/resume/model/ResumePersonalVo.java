package com.cafe24.pickmetop.resume.model;

import org.springframework.web.multipart.MultipartFile;

public class ResumePersonalVo {
	private String personalCd;
	private String resumeCd;
	private String personalKorname;
	private String personalEngname;
	private String personalBirthdate;
	private String personalGender;
	private String personalPhone;
	private String personalCellphone;
	private String personalEmail;
	private String personalSns;
	private String personalAddr;
	private MultipartFile personalPhoto;
	private String personalRegdate;
	private String personalModidate;
	public String getPersonalCd() {
		return personalCd;
	}
	public void setPersonalCd(String personalCd) {
		this.personalCd = personalCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getPersonalKorname() {
		return personalKorname;
	}
	public void setPersonalKorname(String personalKorname) {
		this.personalKorname = personalKorname;
	}
	public String getPersonalEngname() {
		return personalEngname;
	}
	public void setPersonalEngname(String personalEngname) {
		this.personalEngname = personalEngname;
	}
	public String getPersonalBirthdate() {
		return personalBirthdate;
	}
	public void setPersonalBirthdate(String personalBirthdate) {
		this.personalBirthdate = personalBirthdate;
	}
	public String getPersonalGender() {
		return personalGender;
	}
	public void setPersonalGender(String personalGender) {
		this.personalGender = personalGender;
	}
	public String getPersonalPhone() {
		return personalPhone;
	}
	public void setPersonalPhone(String personalPhone) {
		this.personalPhone = personalPhone;
	}
	public String getPersonalCellphone() {
		return personalCellphone;
	}
	public void setPersonalCellphone(String personalCellphone) {
		this.personalCellphone = personalCellphone;
	}
	public String getPersonalEmail() {
		return personalEmail;
	}
	public void setPersonalEmail(String personalEmail) {
		this.personalEmail = personalEmail;
	}
	public String getPersonalSns() {
		return personalSns;
	}
	public void setPersonalSns(String personalSns) {
		this.personalSns = personalSns;
	}
	public String getPersonalAddr() {
		return personalAddr;
	}
	public void setPersonalAddr(String personalAddr) {
		this.personalAddr = personalAddr;
	}
	public MultipartFile getPersonalPhoto() {
		return personalPhoto;
	}
	public void setPersonalPhoto(MultipartFile personalPhoto) {
		this.personalPhoto = personalPhoto;
	}
	public String getPersonalRegdate() {
		return personalRegdate;
	}
	public void setPersonalRegdate(String personalRegdate) {
		this.personalRegdate = personalRegdate;
	}
	public String getPersonalModidate() {
		return personalModidate;
	}
	public void setPersonalModidate(String personalModidate) {
		this.personalModidate = personalModidate;
	}
	@Override
	public String toString() {
		return "ResumePersonalVo [personalCd=" + personalCd + ", resumeCd=" + resumeCd + ", personalKorname="
				+ personalKorname + ", personalEngname=" + personalEngname + ", personalBirthdate=" + personalBirthdate
				+ ", personalGender=" + personalGender + ", personalPhone=" + personalPhone + ", personalCellphone="
				+ personalCellphone + ", personalEmail=" + personalEmail + ", personalSns=" + personalSns
				+ ", personalAddr=" + personalAddr + ", personalPhoto=" + personalPhoto + ", personalRegdate="
				+ personalRegdate + ", personalModidate=" + personalModidate + "]";
	}
	
}
