package com.cafe24.pickmetop.admin.model;

public class IndustryTopIndexVo {
	String industryTopindexCd;
	String industryTopindexName;
	
	public String getIndustryTopindexCd() {
		return industryTopindexCd;
	}
	public void setIndustryTopindexCd(String industryTopindexCd) {
		this.industryTopindexCd = industryTopindexCd;
	}
	public String getIndustryTopindexName() {
		return industryTopindexName;
	}
	public void setIndustryTopindexName(String industryTopindexName) {
		this.industryTopindexName = industryTopindexName;
	}
	
	@Override
	public String toString() {
		return "IndustryTopIndexVo [industryTopindexCd=" + industryTopindexCd + ", industryTopindexName="
				+ industryTopindexName + "]";
	}
	
	
}
