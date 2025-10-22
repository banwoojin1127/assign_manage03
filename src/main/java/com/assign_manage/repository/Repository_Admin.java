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
    
    // *필요하다면 강의 생성/삭제 등 다른 CRUD 메서드를 여기에 추가합니다.*
}
	
	//✔ 유효성 검사(사용자 입력 검증 / 서버 데이터 처리 전 검증 / 데이터베이스 저장 전 검사 / 파일 업로드 시 / 프로그래밍 내부 로직에서)
	
	//✔ 관리자 > 사용자 관리
	// 사용자 관리 - 검색(공백X, 입력 길이 제한, 특수문자/금지어 필터링) (등급/아이디/이름/성별)

	// 사용자 전체 조회 메소드
	
	
	
	
	
	//✔ 관리자 > 교사 등록 처리
	// 교사 등록
	// 아이디 : null / 중복 / 아이디는 5~20자의 영문 소문자, 숫자와 특수기호(_),(-) 제한 조건 <<<-특수문자로 통일
	// 비밀번호 : null / 비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자 제한 조건
	// 비밀번호 확인 : 비밀번호와 일치하는지 
	// 이메일 : null / 중복 / 특수문자 금지 / 이메일 형식 제한조건 <<-직접 입력하는 칸 추가
	// 이름 : null
	// 생년월일 : null / 8자리 숫자만 / 잘못된 생년월일 형식 9999.99.99 등
	// 성별 : null
	// 전화번호 : null / 중복 / 11자리 숫자만 010 - 0000 - 0000
	
	// 교사 등록 클릭시 등급 처리 : 1(교사)
	// 교사 등록 시 DB에 Insert into 처리
	
	// 사용자 조회에서 이름을 클릭시 사용자 상세보기로 이동
	// 사용자 상세보기 수정
	// 비밀번호 : null / 비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자 제한 조건
	// 이메일 : null / 중복 / 특수문자 금지 / 이메일 형식 제한조건 <<-직접 입력하는 칸 추가 (dropbox)
		
	
	
	
	
	
	// 회원 탈퇴
	// 탈퇴일 not null > 탈퇴한 회원
	
	
	//✔ 관리자 > 강의 관리
	// 강의 관리 - 검색(공백X, 입력 길이 제한, 특수문자/금지어 필터링) (전체/강의명/교사)
		
	
	
	
	
	
	
	
	
	// 강의 편집, 삭제(리스트에 추가된 강의를 편집 삭제) 
	// 편집은 이 페이지 내에서, 삭제는 체크박스(전체 선택 혹은 부분 선택)으로 삭제
	// 체크 박스를 선택X 삭제 > 삭제할 행을 선택해주세요(경고창)
	// 체크 박스를 선택O 삭제 > 삭제하시겠습니까?(경고창) 삭제 처리
	
	// 강의 생성 누르면 상단에 행이 title행과 context행이 생성되고 추가를 누르면 상단 행 아래도 하나씩 추가 번호도 추가되는 형식
	// 강의 제거도 삭제와 마찬가지 로직, 저장 시 아래로 추가
	
	// 강의 관리 > 생성된 강의명을 클릭시 해당 강의명의 과제 리스트로 이동
	
	//✔ 관리자 > 과제 관리
	// 과제조회 
	
	
	//✔ 관리자 > 통계 및 리포트
	// 강의별 과제 제출 정보, 강의별 방문률
	
	
	//✔ 마이페이지 > 프로필 아이콘 float
	// 비밀번호 : null / 비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자 제한 조건
	// 이메일 : null / 중복 / 특수문자 금지 / 이메일 형식 제한조건 <<-직접 입력하는 칸 추가 (dropbox)
	
	//======================================================================================================================
	
	//✔ 데이터 처리
	/* MyBatis 데이터 CRUD 처리 */
	
	
	//✔ 조회 sql 문법 
	
	//✔ 로그 처리 
	/*
	 방문 페이지 visit_page
	 방문 시간 visit_time
	 떠난 시간 leave_time
	 요청 값  request_value
	 */
	
	//✔ 관리자 > 사용자 관리 
	// 페이지 처리 (리스트 갯수에 따른 페이지 수 처리) <<- 10개씩 20개씩 50개씩으로 수정하기
	//
	




	