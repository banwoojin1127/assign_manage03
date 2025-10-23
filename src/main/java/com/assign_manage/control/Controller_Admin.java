package com.assign_manage.control;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.assign_manage.repository.*;
import com.assign_manage.vo.*;

@Controller
@RequestMapping(value = "/admin")
public class Controller_Admin
{
	//✔ admin url 경로 접두
	private static final String AF = "/admin"; 
	
	//✔ 관리자 > 사용자 관리 - 사용자 관리
	@RequestMapping(method = RequestMethod.GET) 
	public String admin_main()
	{
		return "redirect:/admin/user_management";
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
//	@RequestMapping(value = "/lecture_management", method = RequestMethod.GET) 
//	public String lecture_management(Model model)
//	{
//		List<VO_User> teacher_list = repos_teacher.selectAllTeachers();
//		
//		model.addAttribute("teacher_list",teacher_list);
//				
//		return  AF + "/lecture_management";
//	}
	
	// 모든 강의 조회
	@RequestMapping(value = "/lecture_management", method = RequestMethod.GET)
	public String lecture_management(
        @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
        Model model) {
		
		List<VO_User> teacher_list = repos_teacher.selectAllTeachers();

	    List<VO_Lecture> lectureList;

//	    if (keyword == null || keyword.trim().isEmpty()) 
//	    {
//	        // 전체 조회
//	        lectureList = repos_teacher.selectAllLectures(); 
//	    } 
//	    else 
//	    {
//	        // 검색어가 있는 경우 강의명으로 검색
//	        lectureList = repos_teacher.findLecturesByName(keyword.trim());
//	    }
	    
	    lectureList = repos_teacher.selectAllLectures(keyword.trim()); 

	    model.addAttribute("lectureList", lectureList);
	    model.addAttribute("teacher_list",teacher_list);
	    return AF + "/lecture_management";
	}
	
	// modal 학생 추가시 제한 조건(중복X, 교사,관리자X only학생)
	@RequestMapping(value = "/getUserList")
	//@ResponseBody
	public String getUserList(@RequestParam("lectureNo") int lectureNo,Model model)
	{
		//Repository에서 DB조회
		List<VO_User> studentList = repositoryAdmin.selectUserNotExistsLecturListAndTeacher(lectureNo);
	
		System.out.println("getUserList===>");
		for(VO_User user : studentList)
		{
			System.out.println("id:" + user.getId());
			System.out.println("name:" + user.getUser_name());
		}
		model.addAttribute("list",studentList);
		
		return AF + "/user_list";
	}
	
	// 강의 등록 (GET)
	// 강의 등록 폼을 띄우기 전에 교사 목록을 조회하여 JSP로 전달
	@RequestMapping(value = "/lecture_register", method = RequestMethod.GET) 
	public String lecture_register(Model model)
	{
	    // Repository에 정의된 모든 교사(user_class=1)를 조회하는 메서드를 호출합니다.
	    List<VO_User> teacherList = repositoryAdmin.findAllTeachers(); 
	    
	    // 조회된 교사 목록을 "teacherList"라는 이름으로 Model에 담아 JSP로 전달
	    model.addAttribute("teacherList", teacherList);
	    
	    return AF + "/lecture_register";
	}
	
	// 강의 등록 (POST)
	@RequestMapping(value = "/lecture_register_ok", method = RequestMethod.POST) 
	public String lectureRegisterOk(VO_Lecture lectureVO) // VO_Lecture로 폼 데이터 받기
	{
		System.out.println(lectureVO);
	    try {
	        // 1. Repository 호출하여 DB 삽입(INSERT) 쿼리 실행
	        // VO_Lecture에는 강의명, 정원, 시작/종료일, 그리고 교수 이름(user_name)이 담겨 있어야 합니다.
	        repositoryAdmin.insertLecture(lectureVO); 
	        
	        // 2. 등록 성공 후 목록 페이지로 리다이렉트
	        // success=true 파라미터와 메시지를 전달하여 브라우저에서 confirm/alert 창을 띄움
	        return "redirect:" + AF + "/lecture_management";
	        
	    } catch (Exception e) {
	        // 오류 발생 시 목록 페이지로 리다이렉트하며 오류 메시지 전달
	        System.err.println("강의 등록 오류: " + e.getMessage());
	        return "redirect:" + AF + "/lecture_management"; 
	    }
	}
	
	// 강의 수정 (POST)
	@RequestMapping(value = "/lecture_modify_ok", method = RequestMethod.POST) 
	public String lectureModifyOk(VO_Lecture lectureVO) // VO_Lecture로 폼 데이터 받기
	{
		System.out.println(lectureVO);
	    try {
	        // 1. Repository 호출하여 DB 삽입(INSERT) 쿼리 실행
	        // VO_Lecture에는 강의명, 정원, 시작/종료일, 그리고 교수 이름(user_name)이 담겨 있어야 합니다.
	        repositoryAdmin.updateLecture(lectureVO); 
	        
	        // 2. 등록 성공 후 목록 페이지로 리다이렉트
	        // success=true 파라미터와 메시지를 전달하여 브라우저에서 confirm/alert 창을 띄움
	        return "redirect:" + AF + "/lecture_management";
	        
	    } catch (Exception e) {
	        // 오류 발생 시 목록 페이지로 리다이렉트하며 오류 메시지 전달
	        System.err.println("강의 등록 오류: " + e.getMessage());
	        return "redirect:" + AF + "/lecture_management"; 
	    }
	}
	
	// 학생 추가
	@RequestMapping(value = "/lecture_student", method = RequestMethod.GET) 
	public String lecture_student()
	{
		return  AF + "/lecture_student";
	}	
	
	// 강의 삭제
	@RequestMapping(value = "/lecture_delete", method = RequestMethod.GET) 
	public String lectureDelete(@RequestParam("no") int lectureNo) // no 파라미터로 강의 번호 받기
	{
	    try {
	        // 1. Repository 호출하여 DB 삭제(UPDATE) 쿼리 실행
	        repositoryAdmin.deleteLecture(lectureNo); 
	        
	        // 2. 삭제 성공 후 강의 목록 페이지로 리다이렉트
	        // 리다이렉트 시 성공 메시지를 파라미터로 전달하여 브라우저에서 알림창 띄우기 가능
	        return "redirect:" + AF + "/lecture_management?deleteSuccess=true"; 
	        
	    } catch (Exception e) {
	        System.err.println("강의 삭제 오류: " + e.getMessage());
	        // 3. 오류 발생 시 목록 페이지로 리다이렉트하며 오류 메시지 전달
	        return "redirect:" + AF + "/lecture_management?deleteSuccess=false"; 
	    }
	}
	
	// ✔ 강의 수정 폼 로드 (GET 요청)
	@RequestMapping(value = "/lecture_register/{lecture_no}", method = RequestMethod.GET)
	public String lectureEdit(@PathVariable("lecture_no") int lectureNo, Model model) {
	    // 1. 특정 강의 정보 조회
	    VO_Lecture lectureVO = repositoryAdmin.findLectureByNo(lectureNo);
	    
	    // 2. 전체 교사 목록 조회 (등록 폼과 동일)
	    List<VO_User> teacherList = repositoryAdmin.findAllTeachers(); 
	    
	    // 3. Model에 데이터 담기
	    model.addAttribute("lecture", lectureVO);
	    model.addAttribute("teacherList", teacherList);
	    
	    // 등록 폼과 동일한 JSP를 재사용
	    return AF + "/lecture_modify";
	}
	
	
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




