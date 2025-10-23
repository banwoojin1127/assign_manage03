/*
 * 용도 : 필터, 정렬 조건을 달아서 DB에서 검색할때 쓸 vo
 * 작성자 : 반우진
 * 작성일 : 2025-10-23
 */

package com.assign_manage.vo;

public class VO_SearchFilter_AllStudent {
    // 필드
    private String q; // 검색어
    private String filter; // 필터
    private String sort; // 정렬
    private int pageSize;// 페이지당 항목수
    private int pageNum;//현재 페이지
    private int offset; // 항목수 * (0 + 페이지)

    // ===============================================
    // 생성자 (Constructors)
    // ===============================================

    // 1. 기본 생성자 (Default Constructor) - Spring 데이터 바인딩에 필수
    public VO_SearchFilter_AllStudent() {
    	this.q = "";
    	this.filter = "";
    	this.sort = "";
    	this.pageSize = 10;
    	this.pageNum = 1;
    }
    
    // 2. 전체 필드 생성자 (All Args Constructor)
    public VO_SearchFilter_AllStudent(String q, String filter, String sort, int pageSize, int pageNum) {
        this.q = q;
        this.filter = filter;
        this.sort = sort;
        this.pageSize = pageSize;
        this.pageNum = pageNum;
        
        // offset은 생성자 내부에서 계산하여 설정
        this.setOffset(pageNum, pageSize); 
    }

    // ===============================================
    // 겟터 (Getters)
    // ===============================================

    public String getQ() {
        return q;
    }
    public String getFilter() {
        return filter;
    }
    public String getSort() {
        return sort;
    }
    public int getPageSize() {
        return pageSize;
    }
    public int getPageNum() {
        return pageNum;
    }
    public int getOffset() {
        return offset;
    }

    // ===============================================
    // 셋터 (Setters)
    // ===============================================

    public void setQ(String q) {
        this.q = q;
    }
    public void setFilter(String filter) {
        this.filter = filter;
    }
    public void setSort(String sort) {
        this.sort = sort;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
        // pageSize가 변경될 때 offset도 다시 계산하는 로직을 추가하는 것이 좋습니다.
        this.setOffset(); 
    }
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
        // pageNum이 변경될 때 offset도 다시 계산하는 로직을 추가하는 것이 좋습니다.
        this.setOffset(); 
    }

    // setOffset() 오버로딩 (내부 호출용)
    public void setOffset() {
        setOffset(this.pageNum, this.pageSize);
    }
    
    // setOffset() 오버로딩 (생성자/직접 호출용)
    private void setOffset(int pageNum, int pageSize) {
        if(pageNum <= 0 || pageSize <= 0) // pageNum은 1부터 시작, pageSize는 1 이상
        {
            this.offset = 0;
            return;
        }
        // 페이지 번호는 1부터 시작한다고 가정하고 -1을 해줍니다.
        this.offset = (pageNum - 1) * pageSize;
    }


    // 내용 확인용 메서드
    public void showInnerData() {
        System.out.println("Q: " + this.q);
        System.out.println("Filter: " + this.filter);
        System.out.println("Sort: " + this.sort);
        System.out.println("PageSize: " + this.pageSize);
        System.out.println("PageNum: " + this.pageNum);
        System.out.println("Offset: " + this.offset);
    }
}