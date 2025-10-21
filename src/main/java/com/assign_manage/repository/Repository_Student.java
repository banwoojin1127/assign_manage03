package com.assign_manage.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.assign_manage.vo.*;

@Repository
public class Repository_Student
{
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "student";
	
	//과제 정보를 읽는다.
	public VO_Assignment AssignRead(String no)
	{
		VO_Assignment vo = session.selectOne(namespace + ".assign_view", no);
		return vo;
	}	
	
	//과제 리스트를 읽는다.
	public List<VO_Assignment> AssignList(Map<String, Object> params)
	{
		List<VO_Assignment> list = session.selectList(namespace + ".assign_list", params);
		return list;
	}
	
	//과제물 정보를 등록한다.
	public boolean ReportInsert(VO_Report vo)
	{
		session.insert(namespace + ".report_insert",vo);
		return true;
	}	
	
	//과제물 정보를 읽는다.	
	public VO_Report ReportRead(String no)
	{
		VO_Report vo = session.selectOne(namespace + ".report_view", no);
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
	
	//전체 강의의 갯수를 얻는다.
	//return : 전체 게시물 갯수
	public int LectureTotal(VO_Search_student vo)
	{
		int total = session.selectOne(namespace + ".lecture_total", vo);
		return total;
	}
	
	//수강목록을 읽는다.
	public List<VO_Lecture_list> LectureList(VO_Search_student vo)
	{
		List<VO_Lecture_list> list = session.selectList(namespace + ".lecture_list", vo);
		return list;
	}
}
