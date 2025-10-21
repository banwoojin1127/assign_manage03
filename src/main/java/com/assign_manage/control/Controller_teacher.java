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

import com.assign_manage.repository.Repository_Teacher;
import com.assign_manage.vo.VO_Assignment;
import com.assign_manage.vo.VO_Lecture;

@Controller
@RequestMapping("/teacher")
public class Controller_teacher {

    @Autowired
    private Repository_Teacher repository;

    @RequestMapping(value="", method=RequestMethod.GET)
    public String main() {
        return "teacher/teacher_main";
    }

    @RequestMapping(value="/lecture_management", method=RequestMethod.GET)
    public String lecture_management() {
        return "teacher/lecture_management";
    }

    // 과제 목록 기본
    @RequestMapping(value="/assignment_list", method=RequestMethod.GET)
    public String assignment_list_default(Model model) {
        List<VO_Lecture> lectureList = repository.selectAllLectures();
        model.addAttribute("lectureList", lectureList);

        int defaultLectureNo = lectureList.isEmpty() ? 0 : lectureList.get(0).getLecture_no();
        model.addAttribute("selectedLectureNo", defaultLectureNo);

        List<VO_Assignment> assignmentList = repository.selectAssignmentsByLecture(defaultLectureNo);
        model.addAttribute("assignmentList", assignmentList);

        return "teacher/assignment_list";
    }

    // 과제 목록 특정 강의
    @RequestMapping(value="/assignment_list/{lecture_no}", method=RequestMethod.GET)
    public String assignment_list(@PathVariable("lecture_no") int lecture_no, Model model) {
        List<VO_Lecture> lectureList = repository.selectAllLectures();
        model.addAttribute("lectureList", lectureList);
        model.addAttribute("selectedLectureNo", lecture_no);

        List<VO_Assignment> assignmentList = repository.selectAssignmentsByLecture(lecture_no);
        model.addAttribute("assignmentList", assignmentList);

        return "teacher/assignment_list";
    }

    // 과제 추가
    @RequestMapping(value="/assignment_add", method=RequestMethod.POST)
    public String assignment_add(
        @RequestParam("lecture_no") int lecture_no,
        @RequestParam("week") String week,
        @RequestParam("assign_name") String assign_name,
        @RequestParam(value="assign_note", required=false) String assign_note,
        @RequestParam(value="assign_method", required=false, defaultValue="파일 제출") String assign_method,
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

    // 과제 상세 보기
    @RequestMapping(value="/assignment_view/{assign_no}", method=RequestMethod.GET)
    public String assignment_view(@PathVariable("assign_no") int assign_no, Model model) {
        VO_Assignment assignment = repository.selectAssignmentByNo(assign_no); // Repository에 메서드 추가 필요
        model.addAttribute("assignment", assignment);
        return "teacher/assignment_view";
    }

    @RequestMapping(value="/statistics", method=RequestMethod.GET)
    public String statistics() { return "teacher/statistics"; }

    @RequestMapping(value="/student_list", method=RequestMethod.GET)
    public String student_list() { return "teacher/student_list"; }
}
