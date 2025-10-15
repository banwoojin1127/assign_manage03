/***********************************
 * 클래스 기능 : 과제물 정보 클래스
 * 작성자 : 이하늘
 * 작성일 : 2025.10.15
 **********************************/
package com.assign_manage.vo;

public class VO_Report
{
	private int report_no;   //과제물번호
	private int assign_no;   //과제번호
	private int id;          //아이디
	private int report_note; //제출내용
	private int create_date; //생성일
	private int delete_date; //삭제일
	
	public int getReport_no()   { return report_no;   }
	public int getAssign_no()   { return assign_no;   }
	public int getId()          { return id;          }
	public int getReport_note() { return report_note; }
	public int getCreate_date() { return create_date; }
	public int getDelete_date() { return delete_date; }
	
	public void setReport_no(int report_no)     { this.report_no   = report_no;   }
	public void setAssign_no(int assign_no)     { this.assign_no   = assign_no;   }
	public void setId(int id)                   { this.id          = id;          }
	public void setReport_note(int report_note) { this.report_note = report_note; }
	public void setCreate_date(int create_date) { this.create_date = create_date; }
	public void setDelete_date(int delete_date) { this.delete_date = delete_date; }

}