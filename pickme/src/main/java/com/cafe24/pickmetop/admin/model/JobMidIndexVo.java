package com.cafe24.pickmetop.admin.model;

public class JobMidIndexVo {
	private String jobMidIndexCd;
	private String jobTopIndexCd;
	private String jobMidIndexName;
	
	public String getJobMidIndexCd() {
		return jobMidIndexCd;
	}
	public void setJobMidIndexCd(String jobMidIndexCd) {
		this.jobMidIndexCd = jobMidIndexCd;
	}
	public String getJobTopIndexCd() {
		return jobTopIndexCd;
	}
	public void setJobTopIndexCd(String jobTopIndexCd) {
		this.jobTopIndexCd = jobTopIndexCd;
	}
	public String getJobMidIndexName() {
		return jobMidIndexName;
	}
	public void setJobMidIndexName(String jobMidIndexName) {
		this.jobMidIndexName = jobMidIndexName;
	}
	@Override
	public String toString() {
		return "JobMidIndexVo [jobMidIndexCd=" + jobMidIndexCd + ", jobTopIndexCd=" + jobTopIndexCd
				+ ", jobMidIndexName=" + jobMidIndexName + "]";
	}
	
	
	
	
}
