package com.cafe24.pickmetop.resume.model;

import java.util.List;

public class ResumeTrainingVo {
	private String trainingCd;
	private String resumeCd;
	private String trainingCountry;
	private String trainingAcademy;
	private String trainingBegindate;
	private String trainingEnddate;
	private String trainingContent;
	private List<ResumeTrainingVo> resumeTrainingVoList;
	public String getTrainingCd() {
		return trainingCd;
	}
	public void setTrainingCd(String trainingCd) {
		this.trainingCd = trainingCd;
	}
	public String getResumeCd() {
		return resumeCd;
	}
	public void setResumeCd(String resumeCd) {
		this.resumeCd = resumeCd;
	}
	public String getTrainingCountry() {
		return trainingCountry;
	}
	public void setTrainingCountry(String trainingCountry) {
		this.trainingCountry = trainingCountry;
	}
	public String getTrainingAcademy() {
		return trainingAcademy;
	}
	public void setTrainingAcademy(String trainingAcademy) {
		this.trainingAcademy = trainingAcademy;
	}
	public String getTrainingBegindate() {
		return trainingBegindate;
	}
	public void setTrainingBegindate(String trainingBegindate) {
		this.trainingBegindate = trainingBegindate;
	}
	public String getTrainingEnddate() {
		return trainingEnddate;
	}
	public void setTrainingEnddate(String trainingEnddate) {
		this.trainingEnddate = trainingEnddate;
	}
	public String getTrainingContent() {
		return trainingContent;
	}
	public void setTrainingContent(String trainingContent) {
		this.trainingContent = trainingContent;
	}
	public List<ResumeTrainingVo> getResumeTrainingVoList() {
		return resumeTrainingVoList;
	}
	public void setResumeTrainingVoList(List<ResumeTrainingVo> resumeTrainingVoList) {
		this.resumeTrainingVoList = resumeTrainingVoList;
	}
	@Override
	public String toString() {
		return "ResumeTrainingVo [trainingCd=" + trainingCd + ", resumeCd=" + resumeCd + ", trainingCountry="
				+ trainingCountry + ", trainingAcademy=" + trainingAcademy + ", trainingBegindate=" + trainingBegindate
				+ ", trainingEnddate=" + trainingEnddate + ", trainingContent=" + trainingContent
				+ ", resumeTrainingVoList=" + resumeTrainingVoList + "]";
	}
}
