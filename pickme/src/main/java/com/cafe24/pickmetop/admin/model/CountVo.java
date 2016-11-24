package com.cafe24.pickmetop.admin.model;

import org.springframework.stereotype.Component;

@Component
public class CountVo {
	private int reviewCount;
	private int interviewCount;
	private int salaryCount;
	
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
	@Override
	public String toString() {
		return "CountVo [reviewCount=" + reviewCount + ", interviewCount=" + interviewCount + ", salaryCount="
				+ salaryCount + "]";
	}
	
	
	
}
