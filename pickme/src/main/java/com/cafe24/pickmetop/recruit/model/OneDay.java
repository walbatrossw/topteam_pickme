package com.cafe24.pickmetop.recruit.model;

import java.util.List;

public class OneDay {
	private int year;
	private int month;
	private int day;
	private int week;
	private List<Recruit> scheduleList;
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	
	public List<Recruit> getScheduleList() {
		return scheduleList;
	}
	public void setScheduleList(List<Recruit> scheduleList) {
		this.scheduleList = scheduleList;
	}
	@Override
	public String toString() {
		return "OneDay [year=" + year + ", month=" + month + ", day=" + day + ", week=" + week + ", scheduleList="
				+ scheduleList + "]";
	}
	//schedule이 해시코드로 나오지않게하자 
}
