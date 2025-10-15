package com.assign_manage.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/user_management") //기본 url 경로 접두

public class Controller_Admin 
{
	@RequestMapping(value = "/user_management")
	
	public void Sign(HttpServletRequest request, 
			HttpServletResponse response) throws IOException
	{
		System.out.println("SignControl:Sign()...run..");
	}
}
