package com.assign_manage.control;

import java.io.*;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.assign_manage.repository.Repository_Student;
import com.assign_manage.vo.VO_Assignment;
import com.assign_manage.vo.VO_File;
import com.assign_manage.vo.VO_Lecture;
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
		int total = student.LectureTotal(vo);
		
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
		List<VO_Lecture_list> list = student.LectureList(vo);	
		
		model.addAttribute("total",total);
		model.addAttribute("maxpage",maxpage);
		
		model.addAttribute("startbk",startbk);
		model.addAttribute("endbk",endbk);
		
		model.addAttribute("search",vo);
		model.addAttribute("list",list);
		
		return "student/lecture_list";
	}
	
	@RequestMapping(value="/assign/list", method = RequestMethod.GET)
	public String AssignListAll(HttpSession session, Model model) throws ParseException
	{
		//VO_User login = (VO_User) session.getAttribute("login");
		//String id = login.getId();
		String id = "s2ezen";
		
		Map<String, Object> params = new HashMap<>();
        params.put("id", id);

        //전체 과제 목록
        List<VO_Assignment> assignList = student.AssignList(params);

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
        for (VO_Assignment assign : assignList) {
            lectureMap.put(String.valueOf(assign.getLecture_no()), assign.getLecture_name());
        }

        model.addAttribute("assignList", assignList);      
        model.addAttribute("lectureMap", lectureMap);
        model.addAttribute("lecture_no", null);
        
		return "student/assignment_list";
	}
	
	@RequestMapping(value="/assign/list/{lecture_no}", method = RequestMethod.GET)
	public String AssignList(@PathVariable("lecture_no") String no, HttpSession session, Model model) throws ParseException
	{
		//VO_User login = (VO_User) session.getAttribute("login");
		//String id = login.getId();
		String id = "s2ezen";
		
		Map<String, Object> params = new HashMap<>();
	    params.put("id", id);
	    
	    //전체 과제 목록 조회 (강의 버튼용)
	    List<VO_Assignment> allAssignList = student.AssignList(params);
	    Map<String, String> lectureMap = new LinkedHashMap<>();
	    for(VO_Assignment assign : allAssignList)
	    {
	        lectureMap.put(String.valueOf(assign.getLecture_no()), assign.getLecture_name());
	    }
	    
	    //선택 강의 과제만 조회
	    params.put("lecture_no", no);
	    List<VO_Assignment> assignList = student.AssignList(params);
	    
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

		return "student/assignment_list";
	}
	
	@RequestMapping(value="/assign", method = RequestMethod.GET)
	public String Assign()
	{
		return "redirect:/student";
	}
	
	@RequestMapping(value="/assign/{assign_no}", method = RequestMethod.GET)
	public String AssignView(@PathVariable("assign_no") String no)
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
	public String ReportSubmitOK(VO_Report vo, @RequestParam("attach") List<MultipartFile> files,
			HttpServletRequest request) throws IllegalStateException, IOException
	{
		//로그인 정보를 조회한다.
		VO_User login = (VO_User)request.getSession().getAttribute("login");
		if(login == null)
		{
			return "redirect:/common/login";
		}
		
		//과제물 제출자 아이디를 설정한다.
		vo.setId(login.getId());
		
		List<VO_File> voFiles = new ArrayList<VO_File>();
		
		for(MultipartFile file : files)
		{
			if (file.isEmpty()) continue;

			String originalFileName = file.getOriginalFilename();
			
			//파일 이름이 중복되지 않도록 파일 이름 변경 : 서버에 저장할 이름
			//UUID 클래스 사용
			UUID uuid = UUID.randomUUID();
		    String ext = "";
		    int dotIndex = originalFileName.lastIndexOf(".");
		    if (dotIndex > -1)
		    {
		        ext = originalFileName.substring(dotIndex);  // .포함 확장자 (예: ".jpg")
		    }
		    String savedFileName = uuid.toString() + ext;
			
			//첨부파일 객체 생성
			File newFile = new File(uploadPath + File.separator + savedFileName);
			
			//실제 저장 디렉토리로 전송		
			file.transferTo(newFile);
			
			//VO_File 세팅
			VO_File voFile = new VO_File();
			voFile.setF_name(originalFileName);
			voFile.setP_name(savedFileName);
			voFile.setFile_size(file.getSize());
			voFile.setExtension(ext);
		     
		    voFiles.add(voFile);
		}
		vo.setFiles(voFiles);
		
		student.ReportInsert(vo);
		
		return "redirect:/student/report/" + vo.getReport_no();
	}
	
	@RequestMapping(value="/report/{report_no}", method = RequestMethod.GET)
	public String ReportView(@PathVariable("report_no") int no, Model model)
	{
		/*
		VO_Report report = student.ReportRead(no);
		
		model.addAttribute("report", report);
		*/
	    
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
	
	@RequestMapping("/report/{report_no}/download")
	public String Download(@PathVariable("report_no") int no)
	{
		return "redirect:/student/report/1";
	}
	
	@RequestMapping("/report/{report_no}/download/{file_no}")
	public void FileDown(@PathVariable("file_no") String no, HttpServletResponse response) throws IOException
	{
	    VO_File voFile = student.FileRead(no); // 파일 정보 가져오기(DB 조회)
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
	
	@RequestMapping(value="/statistics", method = RequestMethod.GET)
	public String Statistics()
	{
		return "student/statistics";
	}
}
