package com.assign_manage.vo;

public class VO_Answer
{
	private int quest_no;		// 질문번호
	private String id;			// 아이디
	private String answer_note;	// 답변내용
	private String create_date;	// 생성일
	private String delete_date;	// 삭제일
	
	public int getQuest_no()		{ return quest_no;		}
	public String getId()			{ return id;			}
	public String getAnswer_note()	{ return answer_note;	}
	public String getCreate_date()	{ return create_date;	}
	public String getDelete_date()	{ return delete_date;	}
	
	public void setQuest_no(int quest_no)			{ this.quest_no = quest_no;			}
	public void setId(String id)					{ this.id = id;						}
	public void setAnswer_note(String answer_note)	{ this.answer_note = answer_note;	}
	public void setCreate_date(String create_date)	{ this.create_date = create_date;	}
	public void setDelete_date(String delete_date)	{ this.delete_date = delete_date;	}
}
