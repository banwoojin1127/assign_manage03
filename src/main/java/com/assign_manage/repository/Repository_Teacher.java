package com.assign_manage.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.assign_manage.vo.*;

@Repository
public class Repository_Teacher {

    @Autowired
    private SqlSession session;

    private static final String namespace = "teacher";

    // 전체 강의 조회
    
    public List<VO_Lecture> selectAllLectures() {
        return session.selectList(namespace + ".selectAllLectures", null);
    }
    
    public List<VO_Lecture> selectAllLectures(String keyword) {
        return session.selectList(namespace + ".selectAllLectures", keyword);
    }
    
    public List<VO_Assignment> selectAssignmentsByLecture(int lecture_no) {
        return session.selectList(namespace + ".selectAssignmentsByLecture", lecture_no);
    }

    public int insertAssignment(VO_Assignment vo) {
        return session.insert(namespace + ".insertAssignment", vo);
    }

    // 추가: 특정 과제 조회
    public VO_Assignment selectAssignmentByNo(int assign_no) {
        return session.selectOne(namespace + ".selectAssignmentByNo", assign_no);
    }
    
    // 교사 전체 목록 조회
    public List<VO_User> selectAllTeachers()
    {
    	return session.selectList(namespace + ".All_Teacher_List");
    }
    
    // 특정 강의명 조회
	public List<VO_Lecture> findLecturesByName(String keyword) {
	    return session.selectList(namespace + ".LecutreName_Lecture_View", keyword);
	}
	
// ===============================================
// 반우진 작업 시작부분
// ===============================================	
	
	// 학생 전체 조회
	public List<VO_User> findAllStudent(VO_SearchFilter_AllStudent filter){
			List<VO_User> voUList = session.selectList(namespace + ".selectListUser",filter);
			for(VO_User voU : voUList)
			{
				voU.showInnerData();
			}
		return voUList;
	}
	
// ===============================================
// 반우진 작업 끝 부분
// ===============================================
	
// ===============================================
// 이승헌 작업 시작부분
// ===============================================	
	
	//과제 정보를 읽는다.
	public VO_Assignment AssignRead(String no)
	{
		VO_Assignment vo = session.selectOne(namespace + ".assign_view", no);
		return vo;
	}
	
	//과제물 정보를 읽는다.	
	public VO_Report ReportRead(String no)
	{
		VO_Report vo = session.selectOne(namespace + ".report_view", no);
		return vo;
	}
	
	//첨부파일 정보를 읽는다.	
	public VO_File FileRead(String no)
	{
		VO_File vo = session.selectOne(namespace + ".file_view", no);
		return vo;
	}
	
	//첨부파일 목록을 읽는다.	
	public List<VO_File> FileList(String no)
	{
		List<VO_File> list = session.selectList(namespace + ".file_list", no);
		return list;
	}
	
	//피드백 정보를 읽는다.
	public VO_Feedback FeedbackRead(String no)
	{
		VO_Feedback vo = session.selectOne(namespace + ".feedback_view", no);
		return vo;
	}
	
	//피드백 정보를 등록한다.
	public boolean FeedbackInsert(VO_Feedback vo)
	{
		session.insert(namespace + ".feedback_insert", vo);
		return true;
	}
	
	//피드백 정보를 변경한다.
	public boolean FeedbackUpdate(VO_Feedback vo)
	{
		session.update(namespace + ".feedback_update", vo);
		return true;
	}
	
	//과제에 대한 학생 리스트를 읽는다.
	public List<VO_Assignment_student> StudentList(String lecture_no, String assign_no)
	{
		Map<String, Object> params = new HashMap<>();
	    params.put("lecture_no", lecture_no);
	    params.put("assign_no", assign_no);
		
		List<VO_Assignment_student> list = session.selectList(namespace + ".student_list", params);
		return list;
	}
	
	//질문목록 정보를 읽는다.	
	public List<VO_Question> QuestionRead(String no)
	{
		List<VO_Question> list = session.selectList(namespace + ".question_view", no);
		return list;
	}
	
	//답변 정보를 읽는다.	
	public VO_Answer AnswerRead(String no)
	{
		VO_Answer vo = session.selectOne(namespace + ".answer_view", no);
		return vo;
	}
	
// ===============================================
// 이승헌 작업 끝 부분
// ===============================================
}
