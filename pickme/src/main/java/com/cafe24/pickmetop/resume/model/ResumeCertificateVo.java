package com.cafe24.pickmetop.resume.model;

import java.util.List;

public class ResumeCertificateVo {
	private String memberCertificateCd;
	private String resumeCd;
	private String certificateCd;
	private String certificateName;
	private String certificateGrade;
	private String certificateHost;
	private String certificateBegindate;
	private String certificateEnddate;
	private String certificateRegnum;
	private	List<ResumeCertificateVo> resumeCertificateVoList;
	public String getMemberCertificateCd() {
		return memberCertificateCd;
	}
	public void setMemberCertificateCd(String memberCertificateCd) {
		this.memberCertificateCd = memberCertificateCd;
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
	public String getCertificateName() {
		return certificateName;
	}
	public void setCertificateName(String certificateName) {
		this.certificateName = certificateName;
	}
	public String getCertificateGrade() {
		return certificateGrade;
	}
	public void setCertificateGrade(String certificateGrade) {
		this.certificateGrade = certificateGrade;
	}
	public String getCertificateHost() {
		return certificateHost;
	}
	public void setCertificateHost(String certificateHost) {
		this.certificateHost = certificateHost;
	}
	public String getCertificateBegindate() {
		return certificateBegindate;
	}
	public void setCertificateBegindate(String certificateBegindate) {
		this.certificateBegindate = certificateBegindate;
	}
	public String getCertificateEnddate() {
		return certificateEnddate;
	}
	public void setCertificateEnddate(String certificateEnddate) {
		this.certificateEnddate = certificateEnddate;
	}
	public String getCertificateRegnum() {
		return certificateRegnum;
	}
	public void setCertificateRegnum(String certificateRegnum) {
		this.certificateRegnum = certificateRegnum;
	}
	public List<ResumeCertificateVo> getResumeCertificateVoList() {
		return resumeCertificateVoList;
	}
	public void setResumeCertificateVoList(List<ResumeCertificateVo> resumeCertificateVoList) {
		this.resumeCertificateVoList = resumeCertificateVoList;
	}
	@Override
	public String toString() {
		return "ResumeCertificateVo [memberCertificateCd=" + memberCertificateCd + ", resumeCd=" + resumeCd
				+ ", certificateCd=" + certificateCd + ", certificateName=" + certificateName + ", certificateGrade="
				+ certificateGrade + ", certificateHost=" + certificateHost + ", certificateBegindate="
				+ certificateBegindate + ", certificateEnddate=" + certificateEnddate + ", certificateRegnum="
				+ certificateRegnum + ", resumeCertificateVoList=" + resumeCertificateVoList + "]";
	}
	
}
