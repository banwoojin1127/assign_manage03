/***********************************
 * 클래스 기능 : 수강목록 정보 클래스
 * 작성자 : 이승헌
 * 작성일 : 2025.10.15
 **********************************/
package com.assign_manage.vo;

public class VO_Lecture_list
{
	private String id;          //아이디
	private int    lecture_no;  //강의번호
	private String create_date; //등록일
	private String delete_date; //삭제일
	
	//Getter
	public String getId()          { return id; }
	public int getLecture_no()     { return lecture_no; }
	public String getCreate_date() { return create_date; }
	public String getDelete_date() { return delete_date; }
	
	//Setter
	public void setId(String id)                   { this.id = id; }
	public void setLecture_no(int lecture_no)      { this.lecture_no = lecture_no; }
	public void setCreate_date(String create_date) { this.create_date = create_date; }
	public void setDelete_date(String delete_date) { this.delete_date = delete_date; }
}
