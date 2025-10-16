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
@RequestMapping("/student")
public class Controller_Student
{
	// !!! 페이지명.do <- 사용 자제 할 것 !!!

	@RequestMapping(value="", method = RequestMethod.GET)
	public String main()
	{
		return "student/student_main";
	}
	
	@RequestMapping(value="/lecture", method = RequestMethod.GET)
	public String lecture()
	{
		return "student/lecture_list";
	}
	
	@RequestMapping(value="/assign", method = RequestMethod.GET)
	public String assignList()
	{
		return "student/assignment_list";
	}
	
	@RequestMapping(value="/assign/{assign_no}", method = RequestMethod.GET)
	public String assignView(@PathVariable("assign_no") int no)
	{
		return "student/assignment_view";
	}
	
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public String report()
	{
		return "redirect:/student";
	}
	
	@RequestMapping(value="/report/submit", method = RequestMethod.GET)
	public String reportSubmit()
	{
		return "student/report_submit";
	}
	
	@RequestMapping(value="/report/submit", method = RequestMethod.POST)
	public String reportSubmitOK()
	{
		return "redirect:/student/report/1";
	}
	
	@RequestMapping(value="/report/{report_no}", method = RequestMethod.GET)
	public String reportView(@PathVariable("report_no") int no)
	{
		return "student/report_view";
	}
	
	@RequestMapping(value="/report/{report_no}/modify", method = RequestMethod.GET)
	public String reportModify(@PathVariable("report_no") int no)
	{
		return "student/report_modify";
	}
	
	@RequestMapping(value="/report/{report_no}/modify", method = RequestMethod.POST)
	public String reportModifyOK(@PathVariable("report_no") int no)
	{
		return "redirect:/student/report/1";
	}
	
	@RequestMapping(value="/statistics", method = RequestMethod.GET)
	public String statistics()
	{
		return "student/statistics";
	}
}
