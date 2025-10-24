/***********************************
 * 클래스 기능 : 강의 정보 클래스
 * 작성자 : 이승헌
 * 작성일 : 2025.10.15
 **********************************/
package com.assign_manage.vo;

public class VO_Lecture
{
	private int    lecture_no;   //강의번호
	private String id;           //아이디
	private String lecture_name; //강의명
	private int    cap;          //정원
	private String create_date;  //생성일
	private String start_date;   //시작일
	private String end_date;     //종료일
	private String delete_date;  //삭제일
	
	private String user_name;	 //유저이름 
	private int    cnt;			 //수강인원
	
	//Getter
	public int getLecture_no()      { return lecture_no; }
	public String getId()           { return id; }
	public String getLecture_name() { return lecture_name; }
	public int getCap()             { return cap; }
	public String getCreate_date()  { return create_date; }
	public String getStart_date()   { return start_date; }
	public String getEnd_date()     { return end_date; }
	public String getDelete_date()  { return delete_date; }
	
	public String getUser_name() 	{ return user_name;	}
	public int getCnt() 			{ return cnt; }
	//Setter
	public void setLecture_no(int lecture_no)        { this.lecture_no = lecture_no; }
	public void setId(String id)                     { this.id = id; }
	public void setLecture_name(String lecture_name) { this.lecture_name = lecture_name; }
	public void setCap(int cap)                      { this.cap = cap; }
	public void setCreate_date(String create_date)   { this.create_date = create_date; }
	public void setStart_date(String start_date)     { this.start_date = start_date; }
	public void setEnd_date(String end_date)         { this.end_date = end_date; }
	public void setDelete_date(String delete_date)   { this.delete_date = delete_date; }
	public void setUser_name(String user_name) 		 { this.user_name = user_name;}
	
	public void setCnt(int cnt) 					 { this.cnt = cnt; }
	@Override
	public String toString() {
		return "VO_Lecture [lecture_no=" + lecture_no + ", id=" + id + ", lecture_name=" + lecture_name + ", cap=" + cap
				+ ", create_date=" + create_date + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", delete_date=" + delete_date + ", user_name=" + user_name + ", cnt=" + cnt + "]";
	}
	public void setUser_id(String id2) {
		// TODO Auto-generated method stub
		
	}
	
}
