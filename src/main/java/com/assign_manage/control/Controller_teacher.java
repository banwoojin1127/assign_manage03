package com.assign_manage.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.assign_manage.repository.Repository_Admin;
import com.assign_manage.repository.Repository_Teacher;
import com.assign_manage.vo.*;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/teacher")
public class Controller_teacher {

	private static final String uploadPath = "D:\\LSH\\팀프로젝트\\1차\\workspace\\assign_manage03\\upload";
	
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
	/*
	 * @RequestMapping(value = "/lecture_management", method = RequestMethod.GET)
	 * public String lecture_management() { return "teacher/lecture_management"; }
	 */

    /** 통계 **/
    @RequestMapping(value = "/statistics", method = RequestMethod.GET)
    public String statistics() {
        return "teacher/statistics";
    }

// ===============================================
// 이승헌 작업 시작부분
// ===============================================
     
    @RequestMapping(value="/assign/list", method = RequestMethod.GET)
	public String AssignListAll(HttpSession session, Model model) throws ParseException
	{
		VO_User login = (VO_User) session.getAttribute("login");
		String id = login.getId();
		
		Map<String, Object> params = new HashMap<>();
        params.put("id", id);

        //전체 과제 목록
        List<VO_Assignment> assignList = repository.AssignList(params);

        //end_date를 문자열로 변환
        SimpleDateFormat dbFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //DB 저장 형식
        SimpleDateFormat displayFormat = new SimpleDateFormat("MM-dd HH:mm");
        
        for (VO_Assignment assign : assignList)
        {
        	if(assign.getEnd_date() != null && !assign.getEnd_date().isEmpty())
        	{
                Date date = dbFormat.parse(assign.getEnd_date());
                assign.setEnd_date(displayFormat.format(date));
            }else
            {
                assign.setEnd_date("미정");
            }
        }
        
        //과제에서 강의 목록 추출
        Map<String, String> lectureMap = new LinkedHashMap<>();
        for (VO_Assignment assign : assignList)
        {
            lectureMap.put(String.valueOf(assign.getLecture_no()), assign.getLecture_name());
        }

        model.addAttribute("assignList", assignList);      
        model.addAttribute("lectureMap", lectureMap);
        model.addAttribute("lecture_no", null);
        
		return "teacher/assignment_list";
	}
	
	@RequestMapping(value="/assign/list/{lecture_no}", method = RequestMethod.GET)
	public String AssignList(@PathVariable("lecture_no")String no, HttpSession session, Model model) throws ParseException
	{
		VO_User login = (VO_User) session.getAttribute("login");
		String id = login.getId();
		
		Map<String, Object> params = new HashMap<>();
	    params.put("id", id);
	    
	    //전체 과제 목록 조회 (강의 버튼용)
	    List<VO_Assignment> allAssignList = repository.AssignList(params);
	    Map<String, String> lectureMap = new LinkedHashMap<>();
	    for(VO_Assignment assign : allAssignList)
	    {
	        lectureMap.put(String.valueOf(assign.getLecture_no()), assign.getLecture_name());
	    }
	    
	    //선택 강의 과제만 조회
	    params.put("lecture_no", no);
	    List<VO_Assignment> assignList = repository.AssignList(params);
	    
	    //end_date를 문자열로 변환
        SimpleDateFormat dbFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //DB 저장 형식
        SimpleDateFormat displayFormat = new SimpleDateFormat("MM-dd HH:mm");
        
        for(VO_Assignment assign : assignList)
        {
        	if(assign.getEnd_date() != null && !assign.getEnd_date().isEmpty())
        	{
                Date date = dbFormat.parse(assign.getEnd_date());
                assign.setEnd_date(displayFormat.format(date));
            }else
            {
                assign.setEnd_date("미정");
            }
        }

	    model.addAttribute("assignList", assignList);
	    model.addAttribute("lectureMap", lectureMap);
	    model.addAttribute("lecture_no", no);

		return "teacher/assignment_list";
	}
	
	/** 과제 추가 **/
    @RequestMapping(value = "/assign/add", method = RequestMethod.POST)
    public String assignment_add(
        @RequestParam("lecture_no") int lecture_no,
        @RequestParam("assign_name") String assign_name,
        @RequestParam(value = "assign_note", required = false) String assign_note,
        @RequestParam(value = "assign_method", required = false, defaultValue = "파일 제출") String assign_method,
        @RequestParam("end_date") String end_date
    ) {
        VO_Assignment vo = new VO_Assignment();
        vo.setLecture_no(lecture_no);
        vo.setAssign_name(assign_name);
        vo.setAssign_note(assign_note != null ? assign_note : "");
        vo.setAssign_method(assign_method);
        vo.setCreate_date(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        vo.setEnd_date(end_date);

        repository.insertAssignment(vo);

        return "redirect:/teacher/assign/list/" + lecture_no;
    }

    /** 과제 상세 보기 **/
    @RequestMapping(value = "/assign/{assign_no}", method = RequestMethod.GET)
    public String AssignView(@PathVariable("assign_no")String assign_no, HttpSession session, Model model)
	{
		VO_User login = (VO_User) session.getAttribute("login");
		String id = login.getId();
		
		VO_Assignment assign = repository.AssignRead(assign_no);
		String lecture_no = String.valueOf(assign.getLecture_no());
		List<VO_Assignment_student> student_list = repository.StudentList(lecture_no, assign_no);
		List<VO_Question> quest = repository.QuestionRead(assign_no);
		Map<Integer, VO_Answer> answer = new HashMap<>();
	    for(VO_Question q : quest) {
	        VO_Answer a = repository.AnswerRead(String.valueOf(q.getQuest_no()));
	        if(a != null) {
	            answer.put(q.getQuest_no(), a);
	        }
	    }
		
		//end_date 포맷 변경
	    if(assign.getEnd_date() != null && !assign.getEnd_date().isEmpty())
	    {
	        try
	        {
	            DateTimeFormatter inputFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	            DateTimeFormatter outputFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

	            LocalDateTime dt = LocalDateTime.parse(assign.getEnd_date(), inputFormat);
	            assign.setEnd_date(dt.format(outputFormat));
	        }catch(Exception e){}
	    }
		
		model.addAttribute("assign", assign);
		model.addAttribute("quest", quest);
		model.addAttribute("answer", answer);
		model.addAttribute("student_list", student_list);
		model.addAttribute("id", id);
		
		return "teacher/assignment_view";
	}
	
    //과제 수정
    @RequestMapping(value = "/assign/{assign_no}/modify", method = RequestMethod.POST)
    public String assignModify(@PathVariable("assign_no") int assign_no, @RequestParam("assign_name") String assign_name,
            @RequestParam("assign_method") String assign_method, @RequestParam("assign_note") String assign_note)
    {

        VO_Assignment vo = new VO_Assignment();
        vo.setAssign_no(assign_no);
        vo.setAssign_name(assign_name);
        vo.setAssign_method(assign_method);
        vo.setAssign_note(assign_note);

        boolean result = repository.AssignModify(vo);

        // 실패 시도 페이지 새로고침 처리
        if (!result) {
            return "redirect:/teacher/assign/" + assign_no;
        }

        return "redirect:/teacher/assign/" + assign_no;
    }
    
 	//과제물 상세보기
    @RequestMapping(value="/assign/{assign_no}/report/{report_no}", method = RequestMethod.GET)
 	public String report_view(@PathVariable("assign_no") String assign_no,
 				@PathVariable("report_no") String report_no, Model model)
 	{
 		VO_Assignment assign = repository.AssignRead(assign_no);
 		VO_Report report = repository.ReportRead(report_no);
 		VO_Feedback feedback = repository.FeedbackRead(report_no);
 		List<VO_File> fileList = repository.FileList(report_no);
 		
 		model.addAttribute("assign", assign);
 		model.addAttribute("report", report);
 		model.addAttribute("feedback", feedback);
 		model.addAttribute("fileList", fileList);
 	    
 		return "teacher/report_view";
 	}
 	
 	//과제물 다운로드 - 잘못된 경로
    @RequestMapping("/assign/{assign_no}/report/{report_no}/download")
 	public String download(@PathVariable("assign_no") String assign_no, @PathVariable("report_no") String report_no)
 	{
 		return "redirect:/student/assign/" + assign_no + "/report/" + report_no;
 	}
 	
    //과제물 다운로드
 	@RequestMapping("/assign/{assign_no}/report/{report_no}/download/{file_no}")
 	public void file_down(@PathVariable("file_no") String no, HttpServletResponse response) throws IOException
 	{
 	    VO_File voFile = repository.FileRead(no); // 파일 정보 가져오기(DB 조회)
 	    String filePath = uploadPath + File.separator + voFile.getP_name();
 	    File file = new File(filePath);

 	    if (!file.exists())
 	    {
 	        response.sendError(HttpServletResponse.SC_NOT_FOUND);
 	        return;
 	    }

 	    response.setContentType("application/octet-stream");
 	    String encodedFileName = URLEncoder.encode(voFile.getF_name(), "UTF-8").replaceAll("\\+", "%20");
 	    response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");
 	    response.setContentLength((int)file.length());

 	    try (BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
 	         BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream()))
 	    {
 	        byte[] buffer = new byte[8192];
 	        int len;
 	        while ((len = in.read(buffer)) != -1)
 	        {
 	            out.write(buffer, 0, len);
 	        }
 	    }
 	}
     
 	//피드백 추가
 	@RequestMapping(value="/assign/{assign_no}/report/{report_no}/feedback/submit", method = RequestMethod.GET)
 	public String report_feedback_submit(@PathVariable("assign_no") String assign_no,
 			@PathVariable("report_no") String report_no, Model model)
 	{
 		VO_Assignment assign = repository.AssignRead(assign_no);
 		VO_Report report = repository.ReportRead(report_no);;
 		
 		model.addAttribute("assign", assign);
 		model.addAttribute("report", report);
 		
 		return "teacher/report_feedback_submit";
 	}
 	
 	@RequestMapping(value="/assign/{assign_no}/report/{report_no}/feedback/submit", method = RequestMethod.POST)
 	public String report_feedback_submitOK(@PathVariable("assign_no") int assign_no,
 			@PathVariable("report_no") int report_no, @RequestParam("feedback") String feedback,
 			@RequestParam(value="score", required=false, defaultValue="0") int score,
 			HttpSession session, RedirectAttributes redirectAttr)
 	{
 		VO_User login = (VO_User) session.getAttribute("login");
 		if(login == null)
		{
			return "redirect:/common/login";
		}
 		
		String id = login.getId();
 		
 		VO_Feedback f = new VO_Feedback();
 	    f.setReport_no(report_no);
 	    f.setId(id);
 	    f.setFeedback(feedback);
 	    f.setScore(score);

 	    repository.FeedbackInsert(f);
 	
 	    redirectAttr.addFlashAttribute("msg", "피드백이 등록되었습니다.");
 		
 		return "redirect:/teacher/assign/" + assign_no + "/report/" + report_no;
 	}
 	
	//피드백 수정
 	@RequestMapping(value="/assign/{assign_no}/report/{report_no}/feedback/modify", method = RequestMethod.GET)
 	public String report_feedback_modify(@PathVariable("assign_no") String assign_no,
 			@PathVariable("report_no") String report_no, Model model)
 	{
 		VO_Assignment assign = repository.AssignRead(assign_no);
 		VO_Report report = repository.ReportRead(report_no);;
 		VO_Feedback feedback = repository.FeedbackRead(report_no);
 		
 		model.addAttribute("assign", assign);
 		model.addAttribute("report", report);
 		model.addAttribute("feedback", feedback);
 		
 		return "teacher/report_feedback_modify";
 	}
 	 	
 	@RequestMapping(value="/assign/{assign_no}/report/{report_no}/feedback/modify", method = RequestMethod.POST)
 	public String report_feedback_submit_modifyOK(@PathVariable("assign_no") int assign_no,
 			@PathVariable("report_no") int report_no, @RequestParam("feedback") String feedback,
 			@RequestParam(value="score", required=false, defaultValue="0") int score,
 			HttpSession session, RedirectAttributes redirectAttr)
 	{
 		VO_Feedback f = new VO_Feedback();
 	    f.setReport_no(report_no);
 	    f.setFeedback(feedback);
 	    f.setScore(score);

 	    repository.FeedbackUpdate(f);
 	
 	    redirectAttr.addFlashAttribute("msg", "수정이 완료되었습니다.");
 		
 		return "redirect:/teacher/assign/" + assign_no + "/report/" + report_no;
 	}
 	
// ===============================================
// 이승헌 작업 끝부분
// ===============================================

    
	
// ===============================================
// 반우진 작업 시작부분
// ===============================================
	
	/** 학생 목록 **/
	@RequestMapping(value = "/student_list", method = RequestMethod.GET)
	public String student_list(Model model
			,	VO_SearchFilter_AllStudent filter
			) {
// 			filter.showInnerData();
		List<VO_User> userList = repository.findAllStudent(filter); // Repository에서 전체 조회
		model.addAttribute("userList", userList); // JSP에서 ${userList}로 접근 가능
		
		return "teacher/student_list";
	}
	
	// 학생의 강의 조회
	@RequestMapping(value = "/studnet_theylecure", produces="application/text;charset=utf8" )
	@ResponseBody
	public String studnet_theylecure(
			String id
,			HttpServletRequest request
			)
	{
		String nameArrayOfLecture = repository.TheyLecture(id);
		
		return nameArrayOfLecture;
	}
// ===============================================
// 반우진 작업 끝 부분
// ===============================================
	
// ===============================================
// 이하늘 작업 시작 부분
// ===============================================
	
	// 강의 수정 폼 (GET) - 경로에 번호를 받음
	@RequestMapping(value = "/lecture_register/{lecture_no}", method = RequestMethod.GET) 
	public String lecture_modify(@PathVariable("lecture_no") int lectureNo, 
	                             HttpSession session, 
	                             Model model) 
	{
	    // 1. 세션 체크
	    VO_User login = (VO_User) session.getAttribute("login");
	    if (login == null) {
	        return "redirect:/common/login"; 
	    }

	    // 2. 해당 강의 번호(lectureNo)로 DB에서 강의 정보(VO_Lecture)를 조회합니다.
	    // ※ Repository_Teacher에 이 강의 하나를 조회하는 메서드가 필요합니다. (selectLectureByNo 등)
	    //    지금은 임시로 주석 처리합니다.
	    
	    // VO_Lecture lectureVO = repositoryTeacher.selectLectureByNo(lectureNo);
	    // model.addAttribute("lectureVO", lectureVO);
	    
	    // 3. 기존 등록 폼 JSP를 수정 폼으로 재활용합니다.
	    return "teacher/lecture_register";
	}
	
	@RequestMapping(value = "/lecture_management", method = RequestMethod.GET)
	public String lecture_management(
	    @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, // 현재 페이지 번호
	    @RequestParam(value = "keyword", defaultValue = "") String keyword, // 검색 키워드
	    HttpSession session, // 세션 객체 주입
	    Model model) {

	    // 🚨 1. 로그인한 교사 객체 확인 (세션 키를 "login"으로 통일)
	    VO_User login = (VO_User) session.getAttribute("login");
	    
	    if (login == null) {
	        // 🚨 리다이렉트 경로를 /common/login으로 수정하여 404 문제 해결
	        return "redirect:/common/login"; 
	    }

	    // 2. VO_Search 객체에 데이터 설정
	    String teacherId = login.getId(); // VO_User 객체에서 ID 추출
	    
	    // 3. 페이지 설정 상수
	    final int pageSize = 10;   
	    final int pageBlock = 5;   
	    
	    // 4. VO_Search 객체에 데이터 설정
	    VO_Search voSearch = new VO_Search();
	    voSearch.setKeyword(keyword);
	    voSearch.setTeacherId(teacherId); // 필터링을 위한 교사 ID 설정

	    // 5. 전체 레코드 수 및 총 페이지 수 계산
	    int totalCount = repository.countTotalMyLectures(voSearch); // Repository_Teacher 호출
	    int totalPage = (int) Math.ceil((double) totalCount / pageSize);

	    // 6. DB 조회용 시작/끝 행 (startRow = OFFSET, endRow = LIMIT) 계산
	    int startRow = (pageNum - 1) * pageSize; 
	    voSearch.setStartRow(startRow);
	    voSearch.setEndRow(pageSize); 

	    // 7. 페이지 블록 계산
	    int startPage = (pageNum / pageBlock) * pageBlock + 1;
	    if (pageNum % pageBlock == 0) startPage -= pageBlock;
	    int endPage = startPage + pageBlock - 1;
	    if (endPage > totalPage) endPage = totalPage;
	    
	    // 8. 페이지별 강의 목록 조회
	    List<VO_Lecture> lectureList = repository.selectMyLecturesByPage(voSearch); // Repository_Teacher 호출

	    // 9. Model에 데이터 담기 (JSP로 전달)
	    model.addAttribute("lectureList", lectureList);
	    model.addAttribute("totalCount", totalCount);
	    model.addAttribute("totalPage", totalPage);
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("startPage", startPage);
	    model.addAttribute("endPage", endPage);
	    model.addAttribute("pageBlock", pageBlock);
	    model.addAttribute("keyword", keyword);
	    model.addAttribute("startRow", startRow); 

	    return "teacher/lecture_management";
		}
	    // 강의 등록 (GET)
		// 강의 등록 폼을 띄우기 전에 교사 목록을 조회하여 JSP로 전달
	@RequestMapping(value = "/lecture_register", method = RequestMethod.GET) 
	public String lecture_register(HttpSession session, Model model) 
	{
	    // 1. 세션 체크 로직 (기존 유지)
	    VO_User login = (VO_User) session.getAttribute("login");
	    if (login == null) {
	        return "redirect:/common/login"; 
	    }
	    // ✅ FIX: 로그인한 사용자 객체를 'loginUser'라는 이름으로 Model에 담습니다.
	    model.addAttribute("loginUser", login); 
	    
	    return "teacher/lecture_register";
	}
		
		// 강의 등록 (POST)
	// 🚨 기존 메서드 signature를 변경하고 HttpSession 추가
	@RequestMapping(value = "/lecture_register_ok", method = RequestMethod.POST) 
	public String lectureRegisterOk(VO_Lecture lectureVO, HttpSession session) // 🚨 HttpSession 추가
	{
	    VO_User login = (VO_User) session.getAttribute("login");

	    if (login == null) {
	        return "redirect:/common/login"; 
	    }
	    
	    // 🚨 필수! VO_Lecture에 교사 ID와 이름 주입
	    // DB의 lecture 테이블의 교사 ID 컬럼이 'id'라고 가정
	    lectureVO.setId(login.getId());       
	    
	    System.out.println("등록 시도 VO: " + lectureVO);

	    try {
	        repositoryAdmin.insertLecture(lectureVO); 
	        
	        // 리다이렉트 경로 절대 경로로 수정
	        return "redirect:/teacher/lecture_management?registerSuccess=true";
	        
	    } catch (Exception e) {
	        System.err.println("강의 등록 오류: " + e.getMessage());
	        return "redirect:/teacher/lecture_management?registerSuccess=false"; 
	    }
	    
	    
	}
	}

// ===============================================
// 이하늘 작업 시작 부분
// ===============================================
