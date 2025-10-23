/***********************************
 * 클래스 기능 : 메인페이지 정보 클래스
 * 작성자 : 이승헌
 * 작성일 : 2025.10.23
 **********************************/
package com.assign_manage.vo;

public class VO_Main
{
	private int    assign_no;    //과제번호
    private String assign_name;  //과제명
    private String lecture_name; //강의명
    private String teacher_name; //교사 이름
    private int    days_left;    //남은 기한
    
	public int    getAssign_no()    { return assign_no;    }
	public String getAssign_name()  { return assign_name;  }
	public String getLecture_name() { return lecture_name; }
	public String getTeacher_name() { return teacher_name; }
	public int    getDays_left()    { return days_left;    }
	
	public void setAssign_no(int assign_no)          { this.assign_no = assign_no;       }
	public void setAssign_name(String assign_name)   { this.assign_name = assign_name;   }
	public void setLecture_name(String lecture_name) { this.lecture_name = lecture_name; }
	public void setTeacher_name(String teacher_name) { this.teacher_name = teacher_name; }
	public void setDays_left(int days_left)          { this.days_left = days_left;       }
    
}
