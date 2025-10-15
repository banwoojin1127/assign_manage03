/***********************************
 * 클래스 기능 : 로그 정보 클래스
 * 작성자 : 반우진
 * 작성일 : 2025.10.15
 **********************************/

package com.assign_manage.vo;

public class VO_Log
{
	private int		log_no;			// 로그번호
	private String	id;				// id
	private String	visit_page;		// 방문페이지
	private String	visit_time;		// 방문시간
	private String	leave_time;		// 떠난시간
	private String	request_value;	// 요청값
	
	// getter
	public int getLog_no()			{ return log_no;		}
	public String getId()			{ return id;			}
	public String getVisit_page()	{ return visit_page;	}
	public String getVisit_time()	{ return visit_time;	}
	public String getLeave_time()	{ return leave_time;	}
	public String getRequest_value(){ return request_value;	}
	
	// setter
	public void setLog_no(int log_no)					{ this.log_no = log_no;					}
	public void setId(String id)						{ this.id = id;							}
	public void setVisit_page(String visit_page)		{ this.visit_page = visit_page;			}
	public void setVisit_time(String visit_time)		{ this.visit_time = visit_time;			}
	public void setLeave_time(String leave_time)		{ this.leave_time = leave_time;			}
	public void setRequest_value(String request_value)	{ this.request_value = request_value;	}
	
}
