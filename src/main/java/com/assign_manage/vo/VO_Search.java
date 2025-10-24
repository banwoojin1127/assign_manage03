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
	
	//VO추가 251020
	private String option;   //검색 옵션
	
	//VO추가 251024
	private int startRow; // DB LIMIT의 OFFSET (시작점)
	private int endRow;   // DB LIMIT의 LIMIT (개수)
	
	private String teacherId; // 교사 아이디

	//----------------------------------------------------------------
	
	
	
	public int getPage_no()    { return page_no; }
	public int getOffset()     { return offset;  }
	public String getKind()    { return kind;    }
	public String getKeyword() { return keyword; }
	
	//getter추가 251020
	public String getOption() { return option; }
	
	//getter추가 251024
	public int getStartRow() { return startRow; }
	public int getEndRow()   { return endRow;   }
	
	public String getTeacherId() { return teacherId; }
	
	//----------------------------------------------------------------
	
	public void setPageno(int pageno)      
	{ 
		this.page_no = pageno;
		this.offset = (this.page_no - 1) * 10;
	}
	public void setKind(String kind)       { this.kind    = kind;    }
	public void setKeyword(String keyword) { this.keyword = keyword; }
	
	//setter추가 251020
	public void setOption(String option) { this.option = option; }
	
	//setter추가 251024
	public void setPage_no(int page_no)   { this.page_no = page_no;   }
	public void setOffset(int offset)     { this.offset = offset;     }
	public void setStartRow(int startRow) { this.startRow = startRow; }
	public void setEndRow(int endRow)     { this.endRow = endRow;     }

	public void setTeacherId(String teacherId) { this.teacherId = teacherId; }
}