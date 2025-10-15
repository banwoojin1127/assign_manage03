/*******************************
 * 클래스 기능 : views/common/###.jsp 관리
 * 작성자 : 반우진
 * 작성일 : 2025-10-15
 *******************************/

package com.assign_manage.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.assign_manage.repository.*;
import com.assign_manage.vo.*;

@Controller
public class Controller_Common
{
	private static final String CF = "common/";	// Common Folder
	
	@Autowired
	Repository_Common repos_Com;
	
	/*
	@RequestMapping(value = "")
	public String Temp()
	{
		return CF + "";
	}
	*/
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String Login()
	{
		return CF + "login";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String Login(VO_User voIDnPW)
	{
		return CF + "login";
	}
	
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String Singup()
	{
		return CF + "signup";
	}
	
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String Singup(VO_User voAllUserInfo)
	{
		return CF + "signup";
	}
	
	@RequestMapping(value = "find_id", method = RequestMethod.GET)
	public String Find_ID()
	{
		return CF + "find_id";
	}
	
	@RequestMapping(value = "find_id", method = RequestMethod.POST)
	public String Find_ID(VO_User voIDQuestion)
	{
		return "find_id_ok";
	}
	
	@RequestMapping(value = "find_id_ok")
	public String Find_ID_Ok()
	{
		return CF + "find_id_ok";
	}
	
	@RequestMapping(value = "find_pw", method = RequestMethod.GET)
	public String Find_PW()
	{
		return CF + "find_pw";
	}
	
	@RequestMapping(value = "find_pw", method = RequestMethod.POST)
	public String Find_PW(VO_User voPWQuestion)
	{
		return "find_pw_ok";
	}
	
	@RequestMapping(value = "find_pw_ok")
	public String Find_PW_Ok()
	{
		return CF + "find_pw_ok";
	}
	
	@RequestMapping(value = "mypage")
	public String MyPage()
	{
		return CF + "mypage";
	}
	
	@RequestMapping(value = "mypage_auth", method = RequestMethod.GET)
	public String MyPage_Auth()
	{
		return CF + "mypage_auth";
	}
	
	@RequestMapping(value = "mypage_auth", method = RequestMethod.POST)
	public String MyPage_Auth(String PW)
	{
		return CF + "mypage_auth";
	}
	
	@RequestMapping(value = "mypage_edit", method = RequestMethod.GET)
	public String MyPage_Edit()
	{
		return CF + "mypage_edit";
	}
	
	@RequestMapping(value = "mypage_edit", method = RequestMethod.POST)
	public String MyPage_Edit(VO_User userInfo)
	{
		return CF + "mypage_edit";
	}
}
