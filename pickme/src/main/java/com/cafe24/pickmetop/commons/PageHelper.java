package com.cafe24.pickmetop.commons;

import org.springframework.stereotype.Component;

public class PageHelper {
    private int startRow;
    private int linePerPage;
    private int lastPage;
    private int startPage;
    private int maxPageCount;
   
    public PageHelper(int page, int linePerPage) {
        this.linePerPage = linePerPage;
        this.startRow = (page-1)*linePerPage;
    }
    //마지막 페이지를 구하는 메서드
	public void setLastPage(int totalCount, int maxLineCount) {
		lastPage = (int)(Math.ceil((double)totalCount/maxLineCount));
    }
	//현재 페이지를 매개변수로 받아 최대로 보여지는 페이지 표시
	//ex) 현재페이지가 5라면 최대로 보여지는 페이지는 5 개이므로 startPage는 1부터 시작
	//다음페이지 버튼을 눌렀을때 6이 되면 스타트 페이지는 6부터 시작 
    public int startPage(int page, int maxPageCount){
    	this.maxPageCount = maxPageCount; 
    	startPage = (int)(Math.ceil(((double)page / maxPageCount) - 1) * maxPageCount + 1);
    	return startPage;
    }
    //페이징에서 StartPage부터 endPage까지 표시하기 위한 endPage를 리턴하는 메서드 
    //endPage크기가 총페이지 수를 넘어가면 endPage수는 자동으로 마지막 페이지 값으로 리턴
    public int endPage(){
    	int endPage = startPage + maxPageCount-1;
    	if(endPage > lastPage){
    		endPage = lastPage;
    	}
    	return endPage;
    }
   
    public int getStartRow() {
        return startRow;
    }
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }
    public int getLinePerPage() {
        return linePerPage;
    }
    public void setLinePerPage(int linePerPage) {
        this.linePerPage = linePerPage;
    }
}