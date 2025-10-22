/*******************************
 * 클래스 기능 : views/common/###.jsp 관리
 * 작성자 : 반우진
 * 작성일 : 2025-10-15
 *******************************/

package com.assign_manage.control;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.assign_manage.repository.*;
import com.assign_manage.vo.*;

@Controller
public class Controller_Common
{
	private static final String CF = "/common/";	// Common Folder
	
	// DB 연관 처리를 위한 클래스
	@Autowired
	Repository_Common repos_Com;
	
	// 메일 발송을 위한 클래스
	@Autowired
	JavaMailSenderImpl mailSender;
	
	/*
	@RequestMapping(value = CF + "")
	public String Temp()
	{
		return CF + "";
	}
	*/
	
	// 로그아웃 요청
	@RequestMapping(value = CF + "logout")
	public String Logout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.setAttribute("login", null);
		return "redirect:" + CF + "login";
	}
	
	// 로그인 페이지 및 로그인 요청
	@RequestMapping(value = CF + "login", method = RequestMethod.GET)
	public String Login()
	{
		return CF + "login";
	}
	@RequestMapping(value = CF + "login", method = RequestMethod.POST)
	@ResponseBody
	public String Login(
			@RequestParam("id") String id
		,	@RequestParam("pw") String pw
		,	HttpServletRequest request
			)
	{
		HttpSession session = request.getSession();
		
		VO_User voU = repos_Com.Login(id, pw);
		if(voU == null)
		{
			//로그인 안됨.	
			session.setAttribute("login", null);
			return "false";
		}else
		{
			session.setAttribute("login", voU);
			String contextPath = request.getContextPath();
			if(voU.getUser_class().equals("0"))
			{
				return contextPath + "/admin/";
			}
			if(voU.getUser_class().equals("1"))
			{
				return contextPath + "/teacher/";
			}
			if(voU.getUser_class().equals("2"))
			{
				return contextPath + "/student/";
			}
			return "ERROR";
		}
	}
	
	// 학생 등급 회원가입 페이지 및 회원가입 요청
	@RequestMapping(value = CF + "signup", method = RequestMethod.GET)
	public String Singup()
	{
		return CF + "signup";
	}
	@RequestMapping(value = CF + "signup", method = RequestMethod.POST)
	public String Singup(VO_User voU
		,	HttpServletRequest request
			)
	{
		String fullUrl = request.getHeader("Referer");
		String searchString = "control/";	// 컨텍스트 루트. 동적으로 가져올 수 있으면 그렇게 하는게 좋습니다.
		String vipLayer = "";

		// Referer가 null일 수 있으므로 null 체크를 먼저 하는 것이 안전합니다.
		if (fullUrl == null) {
		    System.out.println("Referer 정보가 없습니다 (null).");
		    return null; // 메서드 종료
		}

		int startIndex = fullUrl.indexOf(searchString);
		if (startIndex != -1) {
		    // "control/" 바로 다음부터 시작하는 인덱스입니다.
		    int substringStartIndex = startIndex + searchString.length();
		    
		    // substringStartIndex 위치부터 문자열의 끝까지의 '나머지 문자열'에서 
		    //    첫 번째 "/"의 위치를 찾습니다.
		    //    이 indexOf는 substringStartIndex 이후에서만 검색합니다.
		    int nextSlashIndex = fullUrl.indexOf("/", substringStartIndex);

		    if (nextSlashIndex != -1) {
		        // 시작 인덱스 (substringStartIndex)부터
		        //    첫 번째 "/"의 위치 (nextSlashIndex)까지 문자열을 잘라냅니다.
		    	vipLayer = fullUrl.substring(substringStartIndex, nextSlashIndex);

		        // 예시: fullUrl이 "http://localhost:8080/control/admin/teacher_signup" 일 때
		        // startIndex = 28
		        // substringStartIndex = 36 (a)
		        // nextSlashIndex = 41 (n/t) -> '/'의 위치
		        // result: "admin"
		        System.out.println("추출된 문자열: " + vipLayer);
		    }else
		    {
		        // "control/" 뒤에 "/"가 더 이상 없는 경우 (예: /control/admin)
		    	vipLayer = fullUrl.substring(substringStartIndex);
		        System.out.println("다음 슬래시가 없어 끝까지 추출: " + vipLayer);
		    }
		}else
		{
		    System.out.println("찾는 문자열(" + searchString + ")이 존재하지 않습니다.");
		}

		if(repos_Com.Join(voU) == false)
		{
			if( vipLayer.equals("admin") )
			{
				return "redirect:" + "/" + vipLayer + "/teacher_signup";
			}
			return "redirect:" + CF + "signup";
		};
		if( vipLayer.equals("admin") )
		{
			return "redirect:" + "/" + vipLayer + "/user_management";
		}
		return "redirect:" + CF + "login";
	}
	
	// ID, Tel, Email 중복 검사 요청
	@RequestMapping(value = CF + "dupliid")
	@ResponseBody
	public String DupliID(@RequestParam("id")String id)
	{
		if(id == null || id.equals(""))
		{
			//빈 id가 넘어온 경우.
			return "ERROR";
		}
		if( repos_Com.CheckID(id) == true )
		{
			return "DUPLICATED";
		}else
		{
			return "NOT_DUPLICATED";
		}
	}
	@RequestMapping(value = CF + "duplitel")
	@ResponseBody
	public String DupliTel(@RequestParam("tel")String tel)
	{
		if(tel == null || tel.equals(""))
		{
			//빈 tel가 넘어온 경우.
			return "";
		}
		if( repos_Com.CheckTel(tel) == true )
		{
			return "DUPLICATED";
		}else
		{
			return "NOT_DUPLICATED";
		}
	}
	@RequestMapping(value = CF + "dupliemail")
	@ResponseBody
	public String DupliEmail(@RequestParam("email")String email)
	{
		if(email == null || email.equals(""))
		{
			//빈 email가 넘어온 경우.
		}
		if( repos_Com.CheckEmail(email) == true )
		{
			return "DUPLICATED";
		}else
		{
			return "NOT_DUPLICATED";
		}
	}
	
	// email 인증 검사 요청
	@RequestMapping(value = CF + "sendEmail")
	@ResponseBody
	public String SendEmail(@RequestParam("email")String email) throws Exception
	{
		//인증코드 생성
		String authCode = "";
		String code = "1234567890";
		int    maxlength = 4;
		for(int i = 0; i < maxlength; i++)
		{
			int rand = (int)(Math.random() * 1000) % code.length();
			authCode += code.charAt(rand);
		}
		
		// 메일 내용
		String subject = "인증번호 발송";
		String content = "회원가입 인증번호는 [ " + authCode + " ]입니다.";

		// 보내는 사람
		String from = mailSender.getUsername()+"@naver.com";

		// 받는 사람
		String to = email;

		try 
		{
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(message, "UTF-8");

			// 메일 내용을 채워줌
			mailHelper.setFrom(from);	// 보내는 사람 셋팅
			mailHelper.setTo(to);		// 받는 사람 셋팅
			mailHelper.setSubject(subject);	// 제목 셋팅
			mailHelper.setText(content);	// 내용 셋팅

			// 메일 전송
			mailSender.send(message);
			return authCode;
		} catch(Exception e) {
			e.printStackTrace();
			return "ERROR";
		}
	}
	
	// 아이디 찾기 페이지 및 아이디 찾기 요청
	@RequestMapping(value = CF + "find_id", method = RequestMethod.GET)
	public String Find_ID()
	{
		return CF + "find_id";
	}
	@RequestMapping(value = CF + "find_id", method = RequestMethod.POST)
	@ResponseBody
	public String Find_ID(
			@RequestParam("user_name") String user_name
		,	@RequestParam("tel") String tel
		,	HttpServletRequest request
			)
	{
		HttpSession session = request.getSession();
		
		String id = repos_Com.idFind(user_name, tel);
		
		if(id == null || id.equals(""))
		{
			// ID 찾기 실패
			session.setAttribute("id", null);
			return "false";
		}else
		{
			// ID 찾기 성공
			String contextPath = request.getContextPath();
			session.setAttribute("id", id);
			session.setAttribute("user_name", user_name);
			return contextPath + CF + "find_id_ok";
		}
	}
	
	// 아이디 찾기 성공 페이지
	@RequestMapping(value = CF + "find_id_ok")
	public String Find_ID_Ok()
	{
		return CF + "find_id_ok";
	}
	
	// 비밀번호 찾기 페이지 및 비밀번호 찾기 요청 (보안문제로 비밀번호 초기화 실행)
	@RequestMapping(value = CF + "find_pw", method = RequestMethod.GET)
	public String Find_PW()
	{
		return CF + "find_pw";
	}
	@RequestMapping(value = CF + "find_pw", method = RequestMethod.POST)
	@ResponseBody
	public String Find_PW(
			@RequestParam("id") String id
		,	@RequestParam("tel") String tel
		,	HttpServletRequest request
			)
	{
		HttpSession session = request.getSession();

		VO_User uVO = new VO_User();
		uVO.setId(id);
		uVO.setTel(tel);
		
		String email = repos_Com.pwFind(uVO);
		
		if(email == null || email.equals(""))
		{
			// PW 찾기 실패
			return null;
		}else
		{
			// PW 찾기 성공
			return email;
		}
	}
	@RequestMapping(value = CF + "reset_pw", method = RequestMethod.POST)
	public String Reset_PW(
			@RequestParam("id") String id
		,	@RequestParam("tel") String tel
		,	@RequestParam("email") String email
		,	HttpServletRequest request
			)
	{
		HttpSession session = request.getSession();
		String contextPath = request.getContextPath();
		
		VO_User uVO = new VO_User();
		uVO.setId(id);
		uVO.setTel(tel);
		
		String exPW = repos_Com.pwReset(uVO);
		
		// 메일 내용
		String subject = "임시 비밀번호 발송";
		String content = id + "님의 임시 비밀번호는 [ " + exPW + " ]입니다.";

		// 보내는 사람
		String from = mailSender.getUsername()+"@naver.com";

		// 받는 사람
		String to = email;

		try 
		{
			// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(message, "UTF-8");

			// 메일 내용을 채워줌
			mailHelper.setFrom(from);	// 보내는 사람 셋팅
			mailHelper.setTo(to);		// 받는 사람 셋팅
			mailHelper.setSubject(subject);	// 제목 셋팅
			mailHelper.setText(content);	// 내용 셋팅

			// 메일 전송
			mailSender.send(message);
			// PW 임시 초기화 성공
			return "redirect:" + CF + "find_pw_ok";
		} catch(Exception e) {
			e.printStackTrace();
			return "redirect:" + CF + "login";
		}
	}
	// 비밀번호 찾기 성공 페이지 (보안문제로 비밀번호 초기화 실행됨)
	@RequestMapping(value = CF + "find_pw_ok")
	public String Find_PW_Ok()
	{
		return CF + "find_pw_ok";
	}
	
	// 개인정보 페이지
	@RequestMapping(value = CF + "mypage")
	public String MyPage()
	{
		return CF + "mypage";
	}
	
	// 개인정보 수정을 위한 인증 페이지 및 인증 요청
	@RequestMapping(value = CF + "mypage_auth", method = RequestMethod.GET)
	public String MyPage_Auth()
	{
		return CF + "mypage_auth";
	}
	@RequestMapping(value = CF + "mypage_auth", method = RequestMethod.POST)
	@ResponseBody
	public String MyPage_Auth(String pw
			,	HttpServletRequest request
			)
	{
		HttpSession session = request.getSession();
		VO_User voLogin = (VO_User)session.getAttribute("login");
		
		if( repos_Com.AuthPW(voLogin.getId(),pw) == true )
		{
			return "true";
		}
		return "false";
	}
	
	// 개인정보 수정 페이지 및 수정 요청
	@RequestMapping(value = CF + "mypage_edit", method = RequestMethod.GET)
	public String MyPage_Edit()
	{
		return CF + "mypage_edit";
	}
	@RequestMapping(value = CF + "mypage_edit", method = RequestMethod.POST)
	public String MyPage_Edit(VO_User voU
			,	HttpServletRequest request
			)
	{
		HttpSession session = request.getSession();
		VO_User voLogin = (VO_User)session.getAttribute("login");

		voU.setId(voLogin.getId());
		repos_Com.InfoModify(voU);
		voU = repos_Com.Refresh(voU.getId());

		if(voU == null)
		{
			//로그인 안됨.	
			session.setAttribute("login", null);
			return "redirect:" + CF + "login";
		}else
		{
			session.setAttribute("login", voU);
			return CF + "mypage";
		}
	}
}
