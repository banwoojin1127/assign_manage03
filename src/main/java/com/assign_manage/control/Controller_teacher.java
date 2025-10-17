package com.assign_manage.control;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/teacher")
public class Controller_teacher
{
	// !!! 페이지명.do <- 사용 자제 할 것 !!!

	

	
	
	
	//메인화면
	@RequestMapping(value="", method = RequestMethod.GET)
	public String main()
	{
		return "teacher/teacher_main";
	}	
	
	//강의관리 
	@RequestMapping(value="/lecture_management", method = RequestMethod.GET)
	public String lecture_management()
	{
		return "teacher/lecture_management";
	}
	
	
	//강의에서 과제 조회
	@RequestMapping(value="/assignment_list", method = RequestMethod.GET)
	public String assignment_list()
	{
		return "teacher/assignment_list";
	}	
	
	
	
	//강의에서 과제 조회(번호)
	@RequestMapping(value="/assignment_list/{report_no}", method = RequestMethod.GET)
	public String assignment_list(@PathVariable("report_no") int no)
	{
		return "teacher/assignment_list";
	}	
	
	
	
	//과제 상세보기
	@RequestMapping(value="/assignment_view", method = RequestMethod.GET)
	public String assignment_view()
	{
		return "teacher/assignment_view";
	}	
	
	
	
	// 과제 상세보기(번호)
	@RequestMapping(value="/assignment_view/{report_no}", method = RequestMethod.GET)
	public String assignment_view(@PathVariable("report_no") int no)
	{
		return "teacher/assignment_view";
	}	
	
	
	//레포트 상세보기
	@RequestMapping(value="/report_view", method = RequestMethod.GET)
	public String report_view()
	{
		return "teacher/report_view";
	}	
	
	
	//레포트 상세보기(번호)
	@RequestMapping(value="/report_view/{report_no}", method = RequestMethod.GET)
	public String report_view(@PathVariable("report_no") int no)
	{
		return "teacher/report_view";
	}	
	
	
	//과제 피드백
	@RequestMapping(value="/report_feedback", method = RequestMethod.GET)
	public String report_feedback()
	{
		return "teacher/report_feedback";
	}		
	
	
	//통계
	@RequestMapping(value="/statistics", method = RequestMethod.GET)
	public String statistics()
	{
		return "teacher/statistics";	
	}	
	
	//학생 관리
	@RequestMapping(value="/student_list", method = RequestMethod.GET)
	public String student_list()
	{
		return "teacher/student_list";
	}	
	
	

   
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
