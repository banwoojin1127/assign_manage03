/***********************************
 * 클래스 기능 : 검색_학생 클래스
 * 작성자 : 이승헌
 * 작성일 : 2025.10.17
 **********************************/
package com.assign_manage.vo;

public class VO_Search_student 
{
	private int pageno;     //페이지 번호
	private int offset;     //limit 시작번호
	private int limitno; 	//게시물 리미트 갯수
	private String type;    //검색 타입
	private String keyword;	//검색 키워드
	private String id;      //학생 아이디
	
	public int getPageno()     { return pageno;  }
	public int getOffset()     { return offset;  }
	public int getLimitno()    { return limitno; }
	public String getType()    { return type;    }
	public String getKeyword() { return keyword; }
	public String getId() { return id; }
	
	public void setPageno(int pageno)      
	{ 
		this.pageno = pageno;
		this.offset = (this.pageno - 1) * 10;
	}
	public void setLimitno(int limitno)    { this.limitno = limitno; }
	public void setType(String type)       { this.type = type;       }
	public void setKeyword(String keyword) { this.keyword = keyword; }
	public void setId(String id) { this.id = id; }
}