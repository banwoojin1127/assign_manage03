package com.assign_manage.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assign_manage.vo.VO_Lecture;
import com.assign_manage.vo.VO_Search;
import com.assign_manage.vo.VO_User;

@Repository
public class Repository_Admin
{
	@Autowired
	private SqlSession session;
	
	private static final String namespace = "Admin";
	
	// ✔ 관리자 > 사용자 관리
	public List<VO_User> findAllUsers(){
		return session.selectList(namespace + ".All_User_List");
	}
	
	// ✔ 관리자 > 강의 관리
	// 전체 교사 조회
	public List<VO_User> findAllTeachers() {
        // 호출 형식: "namespace.쿼리ID"
        return session.selectList(namespace + ".Admin_Teacher_List");
    }

    // 2. 이름으로 특정 교사 조회 (XML ID: Name_Teacher_View)
    public List<VO_User> findTeachersByName(String name) {
        // XML에서 #{keyword}로 받기 위해 Map 사용
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("keyword", name);
        
        return session.selectList(namespace + ".Name_Teacher_View", paramMap);
    }

    // 3. 전체 학생 조회 (XML ID: All_Student_List)
    public List<VO_User> findAllStudents() {
        return session.selectList(namespace + ".All_Student_List");
    }

    // 4. 이름으로 특정 학생 조회 (XML ID: Name_Student_View)
    public List<VO_User> findStudentsByName(String name) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("keyword", name);
        
        return session.selectList(namespace + ".Name_Student_View", paramMap);
    }
    
    public List<VO_User> selectUserNotExistsLecturListAndTeacher(int lectureNo){
    	return session.selectList(namespace + ".selectUserNotExistsLecturListAndTeacher", lectureNo);
    }
    
    
    // *필요하다면 강의 생성/삭제 등 다른 CRUD 메서드를 여기에 추가합니다.*
    
    // 강의 등록
    public void insertLecture(VO_Lecture lectureVO) {
        // MyBatis에게 "Admin" 네임스페이스의 "Lecture_Create" 쿼리를 실행하라고 명령
        session.insert(namespace + ".Lecture_Create", lectureVO);
    }
    
    public void updateLecture(VO_Lecture lectureVO) {
        // MyBatis에게 "Admin" 네임스페이스의 "Lecture_Create" 쿼리를 실행하라고 명령
        session.insert(namespace + ".Lecture_Update", lectureVO);
    }
    
    // 강의 삭제
	// ✔ 관리자 > 강의 관리 > 강의 삭제 (논리적 삭제)
	    public void deleteLecture(int lecture_no) {
	        // session.update(네임스페이스.쿼리ID, 파라미터)
	        // MyBatis에게 "Admin" 네임스페이스의 "deleteLecture" 쿼리를 실행하라고 명령
	        session.update(namespace + ".deleteLecture", lecture_no);
	    }
	    
	 // 강의 수정 특정 강의 정보 조회 (수정/상세보기용)
	    public VO_Lecture findLectureByNo(int lectureNo) {
	        // MyBatis에게 "Admin" 네임스페이스의 "Lecture_View" 쿼리를 실행하라고 명령
	        return session.selectOne(namespace + ".Lecture_View", lectureNo);
	    }
	    
	 // ✔ 1. 강의에 학생 추가 (XML ID: Insert_Student_To_Lecture)
    public void insertStudentToLecture(int lectureNo, String studentId) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("lectureNo", lectureNo);
        paramMap.put("id", studentId);
        session.insert(namespace + ".Insert_Student_To_Lecture", paramMap);
    }

    // ✔ 2. 특정 강의를 수강하는 학생 목록 조회 (XML ID: Lecture_Student_List)
    public List<VO_User> findStudentsInLecture(int lectureNo) {
        return session.selectList(namespace + ".Lecture_Student_List", lectureNo);
    }

    // ✔ 3. 특정 강의의 현재 수강생 수 조회 (VO_Lecture의 cnt 필드에 사용)
    // *참고: 이 메서드는 사실 All_Lecture_List 쿼리에 카운트가 포함되어 있다면 필요 없을 수 있습니다.*
    public int countCurrentStudents(int lectureNo) {
        return session.selectOne(namespace + ".Count_Current_Students", lectureNo);
    }
    
	 // VO_Search가 startRow, endRow, keyword를 가지고 페이지별 목록을 조회합니다.
	 // ✔ 1. 페이지별 강의 목록 조회
	 public List<VO_Lecture> selectLecturesByPage(VO_Search voSearch) {
	     return session.selectList(namespace + ".All_Lecture_List_Page", voSearch); 
	 }
	
	 // ✔ 2. 전체 강의 레코드 수 조회 (총 페이지 계산용)
	 public int countTotalLectures(VO_Search voSearch) {
	     return session.selectOne(namespace + ".Count_All_Lectures", voSearch);
	 }
		 
}
	
