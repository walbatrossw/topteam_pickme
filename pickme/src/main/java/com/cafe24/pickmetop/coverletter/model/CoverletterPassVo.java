package com.cafe24.pickmetop.coverletter.model;

public class CoverletterPassVo {
	private String passCletterCd;
	private String passCletterName;
	private String passCletterCompany;
	private String passCletterContent; 
	private String passCletterRegdate; 
	private String passCletterRegister;
	public String getPassCletterCd() {
		return passCletterCd;
	}
	public void setPassCletterCd(String passCletterCd) {
		this.passCletterCd = passCletterCd;
	}
	public String getPassCletterName() {
		return passCletterName;
	}
	public void setPassCletterName(String passCletterName) {
		this.passCletterName = passCletterName;
	}
	public String getPassCletterCompany() {
		return passCletterCompany;
	}
	public void setPassCletterCompany(String passCletterCompany) {
		this.passCletterCompany = passCletterCompany;
	}
	public String getPassCletterContent() {
		return passCletterContent;
	}
	public void setPassCletterContent(String passCletterContent) {
		this.passCletterContent = passCletterContent;
	}
	public String getPassCletterRegdate() {
		return passCletterRegdate;
	}
	public void setPassCletterRegdate(String passCletterRegdate) {
		this.passCletterRegdate = passCletterRegdate;
	}
	public String getPassCletterRegister() {
		return passCletterRegister;
	}
	public void setPassCletterRegister(String passCletterRegister) {
		this.passCletterRegister = passCletterRegister;
	}
	@Override
	public String toString() {
		return "CoverletterPassVo [passCletterCd=" + passCletterCd + ", passCletterName=" + passCletterName
				+ ", passCletterCompany=" + passCletterCompany + ", passCletterContent=" + passCletterContent
				+ ", passCletterRegdate=" + passCletterRegdate + ", passCletterRegister=" + passCletterRegister + "]";
	}
	
}
