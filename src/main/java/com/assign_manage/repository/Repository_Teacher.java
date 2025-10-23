package com.assign_manage.repository;

import java.util.ArrayList;
import java.util.List;
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
}
