package com.assign_manage.vo;

public class VO_Log
{
	public int		log_no;			// 로그번호
	public String	id;				// id
	public String	visit_page;		// 방문페이지
	public String	visit_time;		// 방문시간
	public String	leave_time;		// 떠난시간
	public String	request_value;	// 요청값
	
	public int getLog_no()			{ return log_no;		}
	public String getId()			{ return id;			}
	public String getVisit_page()	{ return visit_page;	}
	public String getVisit_time()	{ return visit_time;	}
	public String getLeave_time()	{ return leave_time;	}
	public String getRequest_value(){ return request_value;	}
	
	public void setLog_no(int log_no)					{ this.log_no = log_no;					}
	public void setId(String id)						{ this.id = id;							}
	public void setVisit_page(String visit_page)		{ this.visit_page = visit_page;			}
	public void setVisit_time(String visit_time)		{ this.visit_time = visit_time;			}
	public void setLeave_time(String leave_time)		{ this.leave_time = leave_time;			}
	public void setRequest_value(String request_value)	{ this.request_value = request_value;	}
	
}
