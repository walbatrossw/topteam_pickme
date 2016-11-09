package com.cafe24.pickmetop.company.model;

import org.springframework.stereotype.Component;

@Component
public class CompanyInfoVo {
	private String companyCd;
	private String industryMidindexCd;
	private String companyTypeCd;
	private String companyName;
	private String companySite;
	private String companyBirthdate;
	private int companySales;
	private String companyCeo;
	private String companyZipcode;
	private String companyAddr;
	private String companyPhone;
	private String companyRegdate;
	private String companyRegister;
	private String companyModidate;
	private String companyModify;
	private int companyTotalRate;
	
	private int reviewCount;
	private int interviewCount;
	private int salaryCount;
	private String industryTopIndexName;
	
	public String getCompanyCd() {
		return companyCd;
	}
	public void setCompanyCd(String companyCd) {
		this.companyCd = companyCd;
	}
	public String getIndustryMidindexCd() {
		return industryMidindexCd;
	}
	public void setIndustryMidindexCd(String industryMidindexCd) {
		this.industryMidindexCd = industryMidindexCd;
	}
	public String getCompanyTypeCd() {
		return companyTypeCd;
	}
	public void setCompanyTypeCd(String companyTypeCd) {
		this.companyTypeCd = companyTypeCd;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanySite() {
		return companySite;
	}
	public void setCompanySite(String companySite) {
		this.companySite = companySite;
	}
	public String getCompanyBirthdate() {
		return companyBirthdate;
	}
	public void setCompanyBirthdate(String companyBirthdate) {
		this.companyBirthdate = companyBirthdate;
	}
	public int getCompanySales() {
		return companySales;
	}
	public void setCompanySales(int companySales) {
		this.companySales = companySales;
	}
	public String getCompanyCeo() {
		return companyCeo;
	}
	public void setCompanyCeo(String companyCeo) {
		this.companyCeo = companyCeo;
	}
	public String getCompanyZipcode() {
		return companyZipcode;
	}
	public void setCompanyZipcode(String companyZipcode) {
		this.companyZipcode = companyZipcode;
	}
	public String getCompanyAddr() {
		return companyAddr;
	}
	public void setCompanyAddr(String companyAddr) {
		this.companyAddr = companyAddr;
	}
	public String getCompanyPhone() {
		return companyPhone;
	}
	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	public String getCompanyRegdate() {
		return companyRegdate;
	}
	public void setCompanyRegdate(String companyRegdate) {
		this.companyRegdate = companyRegdate;
	}
	public String getCompanyRegister() {
		return companyRegister;
	}
	public void setCompanyRegister(String companyRegister) {
		this.companyRegister = companyRegister;
	}
	public String getCompanyModidate() {
		return companyModidate;
	}
	public void setCompanyModidate(String companyModidate) {
		this.companyModidate = companyModidate;
	}
	public String getCompanyModify() {
		return companyModify;
	}
	public void setCompanyModify(String companyModify) {
		this.companyModify = companyModify;
	}
	public int getCompanyTotalRate() {
		return companyTotalRate;
	}
	public void setCompanyTotalRate(int companyTotalRate) {
		this.companyTotalRate = companyTotalRate;
	}
	
	
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public int getInterviewCount() {
		return interviewCount;
	}
	public void setInterviewCount(int interviewCount) {
		this.interviewCount = interviewCount;
	}
	public int getSalaryCount() {
		return salaryCount;
	}
	public void setSalaryCount(int salaryCount) {
		this.salaryCount = salaryCount;
	}
	public String getIndustryTopIndexName() {
		return industryTopIndexName;
	}
	public void setIndustryTopIndexName(String industryTopIndexName) {
		this.industryTopIndexName = industryTopIndexName;
	}
	@Override
	public String toString() {
		return "CompanyInfoVo [companyCd=" + companyCd + ", industryMidindexCd=" + industryMidindexCd
				+ ", companyTypeCd=" + companyTypeCd + ", companyName=" + companyName + ", companySite=" + companySite
				+ ", companyBirthdate=" + companyBirthdate + ", companySales=" + companySales + ", companyCeo="
				+ companyCeo + ", companyZipcode=" + companyZipcode + ", companyAddr=" + companyAddr + ", companyPhone="
				+ companyPhone + ", companyRegdate=" + companyRegdate + ", companyRegister=" + companyRegister
				+ ", companyModidate=" + companyModidate + ", companyModify=" + companyModify + ", companyTotalRate="
				+ companyTotalRate + ", reviewCount=" + reviewCount + ", interviewCount=" + interviewCount
				+ ", salaryCount=" + salaryCount + ", industryTopIndexName=" + industryTopIndexName + "]";
	}
	
	
}
