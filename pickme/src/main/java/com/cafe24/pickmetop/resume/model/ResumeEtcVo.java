package com.cafe24.pickmetop.resume.model;

import org.springframework.web.multipart.MultipartFile;

public class ResumeEtcVo {
	private String etcCd;
	private String resumeCd;
	private String etcTitle;
	private String etcContent;
	private MultipartFile etcFile;
	private String etcBegindate;
	private String etcEnddate;
	public String getEtcCd() {
		return etcCd;
	}
	public void setEtcCd(String etcCd) {
		this.etcCd = etcCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getEtcTitle() {
		return etcTitle;
	}
	public void setEtcTitle(String etcTitle) {
		this.etcTitle = etcTitle;
	}
	public String getEtcContent() {
		return etcContent;
	}
	public void setEtcContent(String etcContent) {
		this.etcContent = etcContent;
	}
	public MultipartFile getEtcFile() {
		return etcFile;
	}
	public void setEtcFile(MultipartFile etcFile) {
		this.etcFile = etcFile;
	}
	public String getEtcBegindate() {
		return etcBegindate;
	}
	public void setEtcBegindate(String etcBegindate) {
		this.etcBegindate = etcBegindate;
	}
	public String getEtcEnddate() {
		return etcEnddate;
	}
	public void setEtcEnddate(String etcEnddate) {
		this.etcEnddate = etcEnddate;
	}
	@Override
	public String toString() {
		return "ResumeEtcVo [etcCd=" + etcCd + ", resumeCd=" + resumeCd + ", etcTitle=" + etcTitle + ", etcContent="
				+ etcContent + ", etcFile=" + etcFile + ", etcBegindate=" + etcBegindate + ", etcEnddate=" + etcEnddate
				+ "]";
	}
	
}
