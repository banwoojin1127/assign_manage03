/***********************************
 * 클래스 기능 : 과제물 정보 클래스
 * 작성자 : 이하늘
 * 작성일 : 2025.10.15
 **********************************/
package com.assign_manage.vo;

import java.util.List;

public class VO_Report
{
	private int report_no;      //과제물번호
	private int assign_no;      //과제번호
	private String id;          //아이디
	private String report_note; //제출내용
	private String create_date; //생성일
	private String delete_date; //삭제일
	
	private List<VO_File> files;  // VO_File 타입 필드 추가
	
	//VO_File getter, setter
	public List<VO_File> getFiles() { return files; }

    public void setFiles(List<VO_File> files) { this.files = files; }

	//getter
	public int getReport_no()      { return report_no;   }
	public int getAssign_no()	   { return assign_no;   }
	public String getId()          { return id;          }
	public String getReport_note() { return report_note; }
	public String getCreate_date() { return create_date; }
	public String getDelete_date() { return delete_date; }
	
	
	//setter
	public void setReport_no(int report_no)    	   { this.report_no   = report_no;   }
	public void setAssign_no(int assign_no)	       { this.assign_no   = assign_no;   }
	public void setId(String id)                   { this.id          = id;          }
	public void setReport_note(String report_note) { this.report_note = report_note; }
	public void setCreate_date(String create_date) { this.create_date = create_date; }
	public void setDelete_date(String delete_date) { this.delete_date = delete_date; }

}	
