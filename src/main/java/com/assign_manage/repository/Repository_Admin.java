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
        return session.selectList(namespace + ".All_Teacher_List");
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
}
	
