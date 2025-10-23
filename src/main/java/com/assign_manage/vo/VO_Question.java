/***********************************
 * 클래스 기능 : 질문 정보 클래스
 * 작성자 : 반우진
 * 작성일 : 2025.10.15
 **********************************/

package com.assign_manage.vo;

public class VO_Question
{
	private int quest_no;		// 질문번호
	private int assign_no;		// 과제번호
	private String id;			// 아이디
	private String quest_note;	// 질문내용
	private String create_date;	// 생성일
	private String delete_date;	// 삭제일
	
	// 추가
	private String user_name;	// 이름
	
	// getter
	public int getQuest_no()		{ return quest_no;		}
	public int getAssign_no()		{ return assign_no;		}
	public String getId()			{ return id;			}
	public String getQuest_note()	{ return quest_note;	}
	public String getCreate_date()	{ return create_date;	}
	public String getDelete_date()	{ return delete_date;	}
	public String getUser_name()	{ return user_name;	    }
	
	// setter
	public void setQuest_no(int quest_no)			{ this.quest_no = quest_no;			}
	public void setAssign_no(int assign_no)			{ this.assign_no = assign_no;		}
	public void setId(String id)					{ this.id = id;						}
	public void setQuest_note(String quest_note)	{ this.quest_note = quest_note;		}
	public void setCreate_date(String create_date)	{ this.create_date = create_date;	}
	public void setDelete_date(String delete_date)	{ this.delete_date = delete_date;	}
	public void setUser_name(String user_name)	    { this.user_name = user_name;	    }
}
