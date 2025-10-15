package com.assign_manage.control;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/student")
public class Controller_Student
{
	// !!! 페이지명.do <- 사용 자제 할 것 !!!

	@RequestMapping(value="")
	public String main()
	{
		return "student/student-main";
	}
}
