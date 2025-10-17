package com.assign_manage.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.assign_manage.vo.VO_Answer;
import com.assign_manage.vo.VO_Feedback;
import com.assign_manage.vo.VO_File;
import com.assign_manage.vo.VO_Lecture;
import com.assign_manage.vo.VO_Question;
import com.assign_manage.vo.VO_Report;

@Repository
public class Repository_Teacher
{
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "teacher";
	
}
