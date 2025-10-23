/***********************************
 * 클래스 기능 : 강의별 학생 목록 정보 클래스
 * 작성자 : 이승헌
 * 작성일 : 2025.10.22
 **********************************/
package com.assign_manage.vo;

public class VO_Assignment_student
{
	private String id;         //아이디
    private String user_name;  //이름
    private String report_no;  //과제번호
    private int    score;      //점수
    
	public String getId()        { return id;        }
	public String getUser_name() { return user_name; }
	public String getReport_no() { return report_no; }
	public int    getScore()     { return score;     }
	
	public void setId(String id)               { this.id = id;               }
	public void setUser_name(String user_name) { this.user_name = user_name; }
	public void setReport_no(String report_no) { this.report_no = report_no; }
	public void setScore(int score)            { this.score = score;         }
	
}
