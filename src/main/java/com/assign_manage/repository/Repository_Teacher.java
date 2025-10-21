package com.assign_manage.repository;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.assign_manage.vo.VO_Assignment;
import com.assign_manage.vo.VO_Lecture;

@Repository
public class Repository_Teacher {

    @Autowired
    private SqlSession session;

    private static final String namespace = "teacher";

    public List<VO_Lecture> selectAllLectures() {
        return session.selectList(namespace + ".selectAllLectures");
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
}
