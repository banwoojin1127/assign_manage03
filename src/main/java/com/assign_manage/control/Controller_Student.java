package com.assign_manage.control;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.assign_manage.repository.Repository_Student;
import com.assign_manage.vo.VO_Lecture_list;
import com.assign_manage.vo.VO_Report;
import com.assign_manage.vo.VO_Search_student;
import com.assign_manage.vo.VO_User;

@Controller
@RequestMapping("/student")
public class Controller_Student
{
	private static final String HttpServletRequest = null;
	
	private static final String uploadPath = "D:\\LSH\\팀프로젝트\\1차\\workspace\\assign_manage03\\upload";

	@Autowired
	Repository_Student student;
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String Main()
	{
		return "student/student_main";
	}
	
	@RequestMapping(value="/lecture", method = RequestMethod.GET)
	public String Lecture(@RequestParam(defaultValue = "전체")String type,
			@RequestParam(defaultValue = "1")int page, @RequestParam(defaultValue = "10")int limitno,
			HttpSession session, Model model)
	{		
		VO_User login = (VO_User)session.getAttribute("login");
		
		String id = login.getId();
		
		if (page < 1) page = 1;
	    if (limitno < 1) limitno = 10;
		
		VO_Search_student vo = new VO_Search_student();
		vo.setType(type);
		vo.setPageno(page);
		vo.setLimitno(limitno);
		vo.setId(id);
		
		//전체 갯수
		int total = student.GetTotal(vo);
		
		//최대 페이지 갯수
		int maxpage = total / limitno;
		if( total % limitno != 0 ) maxpage++;
		
		//페이징 블럭 계산
		//시작블럭 = (현재페이지/10) * 10 + 1
		//끝블럭 = 시작블럭 + 10 - 1
		int startbk = ((page-1) / 10) * 10 + 1;
		int endbk   = startbk + 10 - 1;
		//끝블럭 > 전체페이지 갯수 크면 
		//끝블럭 = 전체페이지 갯수
		if( endbk > maxpage )
		{
			endbk = maxpage;
		}			
		
		//목록 조회 
		List<VO_Lecture_list> list = student.GetList(vo);	
		
		model.addAttribute("total",total);
		model.addAttribute("maxpage",maxpage);
		
		model.addAttribute("startbk",startbk);
		model.addAttribute("endbk",endbk);
		
		model.addAttribute("search",vo);
		model.addAttribute("list",list);
		
		return "student/lecture_list";
	}
	
	@RequestMapping(value="/assign", method = RequestMethod.GET)
	public String AssignList()
	{
		return "student/assignment_list";
	}
	
	@RequestMapping(value="/assign/{assign_no}", method = RequestMethod.GET)
	public String AssignView(@PathVariable("assign_no") int no)
	{
		return "student/assignment_view";
	}
	
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public String Report()
	{
		return "redirect:/student";
	}
	
	@RequestMapping(value="/report/submit", method = RequestMethod.GET)
	public String ReportSubmit()
	{
		return "student/report_submit";
	}
	
	@RequestMapping(value="/report/submit", method = RequestMethod.POST)
	public String ReportSubmitOK(VO_Report vo, HttpServletRequest request)
			throws IllegalStateException, IOException
	{
		//로그인 정보를 조회한다.
		VO_User login = (VO_User)request.getSession().getAttribute("login");
		if(login == null)
		{
			return "redirect:/common/login";
		}
		
		//게시글 작성자 아이디를 설정한다.
		vo.setId(login.getId());
		
		
		student.ReportInsert(vo);
		
		return "redirect:/student/report/" + vo.getReport_no();
	}
	
	@RequestMapping(value="/report/{report_no}", method = RequestMethod.GET)
	public String ReportView(@PathVariable("report_no") int no)
	{
		return "student/report_view";
	}
	
	@RequestMapping(value="/report/{report_no}/modify", method = RequestMethod.GET)
	public String ReportModify(@PathVariable("report_no") int no)
	{
		return "student/report_modify";
	}
	
	@RequestMapping(value="/report/{report_no}/modify", method = RequestMethod.POST)
	public String ReportModifyOK(@PathVariable("report_no") int no)
	{
		return "redirect:/student/report/1";
	}
	
	@RequestMapping(value="/statistics", method = RequestMethod.GET)
	public String Statistics()
	{
		return "student/statistics";
	}
}
