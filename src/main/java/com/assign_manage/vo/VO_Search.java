/***********************************
 * 클래스 기능 : 게시물 정보 클래스
 * 작성자 : 이하늘
 * 작성일 : 2025.10.15
 **********************************/
package com.assign_manage.vo;

public class VO_Search 
{
	private int page_no;     //페이지 번호
	private int offset;      //limit 시작번호
	private String kind; 	 //게시물 종류
	private String keyword;	 //검색 키워드
	
	public int getPage_no()    { return page_no; }
	public int getOffset()     { return offset;  }
	public String getKind()    { return kind;    }
	public String getKeyword() { return keyword; }
	
	public void setPageno(int pageno)      
	{ 
		this.page_no = pageno;
		this.offset = (this.page_no - 1) * 10;
	}
	public void setKind(String kind)       { this.kind    = kind;    }
	public void setKeyword(String keyword) { this.keyword = keyword; }
}