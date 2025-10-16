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
public class Repository_Student
{
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "student";

	//과제물 정보를 등록한다.
	public boolean ReportInsert(VO_Report vo)
	{
		session.insert(namespace + ".report_insert",vo);
		return true;
	}	
	
	//과제물 정보를 읽는다.	
	public VO_Report ReportRead(String no)
	{
		VO_Report vo = session.selectOne(namespace + ".report_view",no);
		return vo;
	}	
	
	//과제물 정보를 변경한다.
	public boolean ReportUpdate(VO_Report vo)
	{
		session.update(namespace + ".report_update", vo);
		return true;
	}
	
	//첨부파일 정보를 등록한다.
	public boolean FileInsert(VO_File vo)
	{
		session.insert(namespace + ".file_insert", vo);
		return true;
	}	
	
	//첨부파일 정보를 읽는다.	
	public VO_File FileRead(String no)
	{
		VO_File vo = session.selectOne(namespace + ".file_view", no);
		return vo;
	}	
	
	//첨부파일 정보를 변경한다.
	public boolean FileUpdate(VO_File vo)
	{
		session.update(namespace + ".file_update", vo);
		return true;
	}
	
	//첨부파일 정보를 삭제한다.	
	public boolean FileDelete(String no)
	{
		session.delete(namespace + ".file_delete", no);
		return true;
	}
	
	//피드백 정보를 읽는다.
	public VO_Feedback FeedbackRead(String no)
	{
		VO_Feedback vo = session.selectOne(namespace + ".feedback_view", no);
		return vo;
	}
	
	//질문 정보를 등록한다.
	public boolean QuestionInsert(VO_Question vo)
	{
		session.insert(namespace + ".question_insert", vo);
		return true;
	}	
	
	//질문 정보를 읽는다.	
	public VO_Question QuestionRead(String no)
	{
		VO_Question vo = session.selectOne(namespace + ".question_view", no);
		return vo;
	}	
	
	//질문 정보를 변경한다.
	public boolean QuestionUpdate(VO_Question vo)
	{
		session.update(namespace + ".question_update", vo);
		return true;
	}
	
	//질문 정보를 삭제한다.	
	public boolean QuestionDelete(String no)
	{
		session.delete(namespace + ".question_delete", no);
		return true;
	}
	
	//질문 정보를 읽는다.	
	public VO_Answer AnswerRead(String no)
	{
		VO_Answer vo = session.selectOne(namespace + ".answer_view", no);
		return vo;
	}	
}
