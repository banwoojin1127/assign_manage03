/*******************************
 * 클래스 기능 : views/common/###.jsp 관리
 * 작성자 : 반우진
 * 작성일 : 2025-10-15
 *******************************/

package com.assign_manage.control;

import javax.mail.internet.MimeMessage;
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
	public String Logout()
	{
		return CF + "login";
	}
	
	// 로그인 페이지 및 로그인 요청
	@RequestMapping(value = CF + "login", method = RequestMethod.GET)
	public String Login()
	{
		return CF + "login";
	}
	@RequestMapping(value = CF + "login", method = RequestMethod.POST)
	public String Login(
			String id,String pw,
			HttpServletRequest request
			)
	{
		HttpSession session = request.getSession();
		
		VO_User vo = repos_Com.Login(id, pw);
		if(vo == null)
		{
			//로그인 안됨.	
			session.setAttribute("login", null);
			return "false";
		}else
		{
			session.setAttribute("login", vo);
			if(vo.getClass().equals("0"))
			{
				return "admin";
			}
			if(vo.getClass().equals("1"))
			{
				return "teacher";
			}
			if(vo.getClass().equals("2"))
			{
				return "student";
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
	public String Singup(VO_User voU)
	{
		if(repos_Com.Join(voU) == false)
		{
			return CF + "signup";
		};
		
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
		String content = "회원가입 인증번호는 [" + authCode + "]입니다.";

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
	public String Find_ID(VO_User voIDQuestion)
	{
		return CF + "find_id_ok";
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
	public String Find_PW(VO_User voPWQuestion)
	{
		return CF + "find_pw_ok";
	}
	
	// 비밀번호 찾기 성공 페이지 (보안문제로 비밀번호 초기화 실행)
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
	public String MyPage_Auth(String PW)
	{
		return CF + "mypage_auth";
	}
	
	// 개인정보 수정 페이지 및 수정 요청
	@RequestMapping(value = CF + "mypage_edit", method = RequestMethod.GET)
	public String MyPage_Edit()
	{
		return CF + "mypage_edit";
	}
	@RequestMapping(value = CF + "mypage_edit", method = RequestMethod.POST)
	public String MyPage_Edit(VO_User userInfo)
	{
		return CF + "mypage_edit";
	}
}
