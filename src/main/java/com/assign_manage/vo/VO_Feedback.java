/***********************************
 * 클래스 기능 : 피드백 정보 클래스
 * 작성자 : 문홍일
 * 작성일 : 2025.10.15
 **********************************/
package com.assign_manage.vo;

public class VO_Feedback {

	public int report_no;   //과제물번호
	public String id;       //아이디
	public String feedback; //피드백
	public int score;       //점수
	
	
	public int getReport_no()   { return report_no;}
	public String getId()       { return id;       }
	public String getFeedback() { return feedback; }
	public int getScore()       { return score;    }
	
	public void setReport_no(int report_no)  { this.report_no = report_no; }
	public void setId(String id)             { this.id = id;               }
	public void setFeedback(String feedback) { this.feedback = feedback;   }
	public void setScore(int score)          { this.score = score;         }
}

