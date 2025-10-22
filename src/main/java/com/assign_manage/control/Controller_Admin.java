package com.assign_manage.control;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.assign_manage.repository.*;
import com.assign_manage.vo.*;

@Controller
@RequestMapping(value = "/admin")
public class Controller_Admin
{
	//✔ admin url 경로 접두
	private static final String AF = "/admin"; 
	
	//✔ 관리자 > 사용자 관리 - 사용자 관리
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String admin_main()
	{
		return  AF + "/user_management";
	}
	
	@Autowired
	private Repository_Admin repositoryAdmin;
	
	// 사용자 관리 - 모든 사용자 조회
	@RequestMapping(value = "/user_management", method = RequestMethod.GET)
	public String userManagement(Model model) {
	// Repository → Service → Controller
		List<VO_User> userList = repositoryAdmin.findAllUsers(); // Repository에서 전체 조회
		model.addAttribute("userList", userList); // JSP에서 ${userList}로 접근 가능
	
		return  AF + "/user_management"; 
	}

	
	
	
	// 사용자 상세보기
	@RequestMapping(value = "/user_view", method = RequestMethod.GET) 
	public String user_view()
	{
		return  AF + "/user_view";
	}
	
	// 사용자 편집 조회
	@RequestMapping(value = "/user_view_edit", method = RequestMethod.GET) 
	public String user_view_edit()
	{
		return  AF + "/user_view_edit";
	}
	
	// 사용자 편집 처리
	@RequestMapping(value = "/user_view_edit_ok", method = RequestMethod.POST) 
	public String user_view_edit_ok()
	{
		return  AF + "/user_view_edit_ok";
	}
	
	
	
	//✔ 관리자 > 사용자 관리 - 교사 등록 조회
	@RequestMapping(value = "/teacher_signup", method = RequestMethod.GET) 
	public String teacher_signup()
	{
		return  AF + "/teacher_signup";
	}
	
	// 교사 등록 처리
	@RequestMapping(value = "/teacher_signup_ok", method = RequestMethod.POST) 
	public String teacher_signup_ok()
	{
		return  AF + "/teacher_signup_ok";
	}
	
	
	@Autowired
	Repository_Teacher repos_teacher; 
	//✔ 관리자 > 강의 관리 - 강의 조회
	@RequestMapping(value = "/lecture_management", method = RequestMethod.GET) 
	public String lecture_management(Model model)
	{
		List<VO_User> teacher_list = repos_teacher.selectAllTeachers();
		
		model.addAttribute("teacher_list",teacher_list);
				
		return  AF + "/lecture_management";
	}
	
	// 강의 추가
	@RequestMapping(value = "/lecture_management_ok", method = RequestMethod.POST) 
	public String lecture_management_ok()
	{
		return  AF + "/lecture_management_ok";
	}
	
	// 모든 강의 조회
	
	
	// 강의 검색 제한
	
	
	
	//✔ 관리자 > 과제 관리 - 과제 리스트
	@RequestMapping(value = "/assignment_list", method = RequestMethod.GET) 
	public String assignment_list()
	{
		return  AF + "/assignment_list";
	}

	// 과제 추가
	@RequestMapping(value = "/assignment_list_ok", method = RequestMethod.GET) 
	public String assignment_list_ok()
	{
		return  AF + "/assignment_list_ok";
	}
	
	// 과제 상세보기
	@RequestMapping(value = "/assignment_view", method = RequestMethod.GET) 
	public String assignment_view()
	{
		return  AF + "/assignment_view";
	}	
	
	// 과제 상세보기 수정 처리
	@RequestMapping(value = "/assignment_view_ok", method = RequestMethod.POST) 
	public String assignment_view_ok()
	{
		return  AF + "/assignment_view_ok";
	}
	
	
	
	//✔ 관리자 > 과제 관리 > 과제물 관리
	@RequestMapping(value = "/report_view", method = RequestMethod.GET) 
	public String report_view()
	{
		return  AF + "/report_view";
	}
	
	// 과제물 피드백 조회
	@RequestMapping(value = "/report_feedback", method = RequestMethod.GET) 
	public String report_feedback()
	{
		return  AF + "/report_feedback";
	}
	
	// 과제물 피드백 작성 및 수정 처리
	@RequestMapping(value = "/report_feedback_ok", method = RequestMethod.POST) 
	public String report_feedback_ok()
	{
		return  AF + "/report_feedback_ok";
	}
	
	
	
	//✔ 관리자 > 통계 및 리포트
	@RequestMapping(value = "/statistics", method = RequestMethod.GET) 
	public String statistics()
	{
		return  AF + "/statistics";
	}
}