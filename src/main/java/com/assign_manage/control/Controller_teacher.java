package com.assign_manage.control;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.assign_manage.repository.Repository_Admin;
import com.assign_manage.repository.Repository_Teacher;
import com.assign_manage.vo.VO_Assignment;
import com.assign_manage.vo.VO_Lecture;
import com.assign_manage.vo.VO_SearchFilter_AllStudent;
import com.assign_manage.vo.VO_User;

@Controller
@RequestMapping("/teacher")
public class Controller_teacher {

    @Autowired
    private Repository_Teacher repository;
    @Autowired
	private Repository_Admin repositoryAdmin;

    /** 교사 메인 페이지 **/
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String main() {
        return "teacher/teacher_main";
    }

    /** 강의 관리 **/
    @RequestMapping(value = "/lecture_management", method = RequestMethod.GET)
    public String lecture_management() {
        return "teacher/lecture_management";
    }

    /** 과제 목록 (기본 첫 번째 강의 기준) **/
    @RequestMapping(value = "/assignment_list", method = RequestMethod.GET)
    public String assignment_list_default(Model model) {
        List<VO_Lecture> lectureList = repository.selectAllLectures();
        model.addAttribute("lectureList", lectureList);

        int defaultLectureNo = lectureList.isEmpty() ? 0 : lectureList.get(0).getLecture_no();
        model.addAttribute("selectedLectureNo", defaultLectureNo);

        List<VO_Assignment> assignmentList = repository.selectAssignmentsByLecture(defaultLectureNo);
        model.addAttribute("assignmentList", assignmentList);

        return "teacher/assignment_list";
    }

    /** 과제 목록 (특정 강의 선택 시) **/
    @RequestMapping(value = "/assignment_list/{lecture_no}", method = RequestMethod.GET)
    public String assignment_list(@PathVariable("lecture_no") int lecture_no, Model model) {
        List<VO_Lecture> lectureList = repository.selectAllLectures();
        model.addAttribute("lectureList", lectureList);
        model.addAttribute("selectedLectureNo", lecture_no);

        List<VO_Assignment> assignmentList = repository.selectAssignmentsByLecture(lecture_no);
        model.addAttribute("assignmentList", assignmentList);

        return "teacher/assignment_list";
    }

    /** 과제 추가 **/
    @RequestMapping(value = "/assignment_add", method = RequestMethod.POST)
    public String assignment_add(
        @RequestParam("lecture_no") int lecture_no,
        @RequestParam("week") String week,
        @RequestParam("assign_name") String assign_name,
        @RequestParam(value = "assign_note", required = false) String assign_note,
        @RequestParam(value = "assign_method", required = false, defaultValue = "파일 제출") String assign_method,
        @RequestParam("end_date") String end_date
    ) {
        VO_Assignment vo = new VO_Assignment();
        vo.setLecture_no(lecture_no);
        vo.setAssign_name(week + " " + assign_name);
        vo.setAssign_note(assign_note != null ? assign_note : "");
        vo.setAssign_method(assign_method);
        vo.setCreate_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        vo.setEnd_date(end_date);

        repository.insertAssignment(vo);

        return "redirect:/teacher/assignment_list/" + lecture_no;
    }

    /** 과제 상세 보기 **/
    @RequestMapping(value = "/assignment_view/{assign_no}", method = RequestMethod.GET)
    public String assignment_view(@PathVariable("assign_no") int assign_no, Model model) {
        // ✅ Repository_Teacher 안에 selectAssignmentByNo(int assign_no) 메서드가 존재해야 합니다.
        VO_Assignment assignment = repository.selectAssignmentByNo(assign_no);

        if (assignment == null) {
            // 혹시 잘못된 번호라면 오류 페이지로 보내거나 메시지 출력
            model.addAttribute("errorMsg", "해당 과제를 찾을 수 없습니다.");
            return "teacher/assignment_not_found";
        }

        model.addAttribute("assignment", assignment);
        return "teacher/assignment_view"; // JSP 파일명: assignment_view.jsp
    }

    /** 통계 **/
    @RequestMapping(value = "/statistics", method = RequestMethod.GET)
    public String statistics() {
        return "teacher/statistics";
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
	
	// ===============================================
	// 반우진 작업 시작부분
	// ===============================================
	
	/** 학생 목록 **/
	@RequestMapping(value = "/student_list", method = RequestMethod.GET)
	public String student_list(Model model
			,	@RequestParam VO_SearchFilter_AllStudent filter
			) {
		if(filter != null)
		{
			filter.setOffset();
		}
		List<VO_User> userList = repository.findAllStudent(filter); // Repository에서 전체 조회
		model.addAttribute("userList", userList); // JSP에서 ${userList}로 접근 가능
		
		return "teacher/student_list";
	}
	// ===============================================
	// 반우진 작업 끝 부분
	// ===============================================
}
