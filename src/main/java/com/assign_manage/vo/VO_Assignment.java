/***********************************
 * 클래스 기능 : 과제 정보 클래스
 * 작성자 : 이하늘
 * 작성일 : 2025.10.15
 **********************************/
package com.assign_manage.vo;

public class VO_Assignment 
{
	private int assign_no;        //과제번호
	private int lecture_no;       //강의번호
	private String assign_name;   //과제명
	private String assign_note;   //내용(설명)
	private String assign_method; //제출방식
	private String create_date;   //생성일
	private String end_date;      //종료일
	private String delete_date;   //삭제일
	
	// 추가
    private String lecture_name;   // 강의명
    private String teacher_name;   // 교사 이름
	
    public int getAssign_no()        { return assign_no;    }
	public int getLecture_no()       { return lecture_no;    }
	public String getAssign_name()   { return assign_name;   }
	public String getAssign_note()   { return assign_note;   }
	public String getAssign_method() { return assign_method; }
	public String getCreate_date()   { return create_date;   }
	public String getEnd_date()      { return end_date;      }
	public String getDelete_date()   { return delete_date;   }
	public String getLecture_name()  { return lecture_name;  }
	public String getTeacher_name()  { return teacher_name;  }
	
	public void setAssign_no(int assign_no)            { this.assign_no     = assign_no;     }
	public void setLecture_no(int lecture_no)          { this.lecture_no    = lecture_no;    }
	public void setAssign_name(String assign_name)     { this.assign_name   = assign_name;   }
	public void setAssign_note(String assign_note)     { this.assign_note   = assign_note;   }
	public void setAssign_method(String assign_method) { this.assign_method = assign_method; }
	public void setCreate_date(String create_date)     { this.create_date   = create_date;   }
	public void setEnd_date(String end_date)           { this.end_date      = end_date;      }
	public void setDelete_date(String delete_date)     { this.delete_date   = delete_date;   }
	public void setLecture_name(String lecture_name)   { this.lecture_name = lecture_name;   }
	public void setTeacher_name(String teacher_name)   { this.teacher_name = teacher_name;   }
}
