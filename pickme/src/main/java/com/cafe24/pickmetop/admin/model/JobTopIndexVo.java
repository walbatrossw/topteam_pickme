package com.cafe24.pickmetop.admin.model;

public class JobTopIndexVo {
	private String jobTopIndexCd;
	private String jobTopIndexName;
	
	public String getJobTopIndexCd() {
		return jobTopIndexCd;
	}
	public void setJobTopIndexCd(String jobTopIndexCd) {
		this.jobTopIndexCd = jobTopIndexCd;
	}
	public String getJobTopIndexName() {
		return jobTopIndexName;
	}
	public void setJobTopIndexName(String jobTopIndexName) {
		this.jobTopIndexName = jobTopIndexName;
	}
	@Override
	public String toString() {
		return "JobTopIndexVo [jobTopIndexCd=" + jobTopIndexCd + ", jobTopIndexName=" + jobTopIndexName + "]";
	}
	
	
}
