<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL 태그 라이브러리 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/head_teacher.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/wide_v01.css'/>"/>

<div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
    <div id="formJoin" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
        <div id="formJoinTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
            <div class="decoWideTitle" style="width: 12px;"></div>
            &nbsp;&nbsp;
            <div class="textWideTitle d-flex flex-wrap justify-content-between align-content-center px-1" style="width: 95%;">
                <p class="m-0" style="font-size: 1.5em;">강의 등록</p>
            </div>
        </div>
        <div id="formJoinRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded pt-3 pb-5">
            <div id="" class="helpWideRequest form-text w-75 h-auto mb-3">
                <span style='color:#dc3545; font-weight: bold;'> * : 필수 입력 사항입니다.</span>
            </div>
            
            <%-- ⭐⭐ 폼 시작: Context Path 및 모든 입력 요소를 감싸도록 수정 ⭐⭐ --%>
            <form id="lectureRegisterForm" name="join" 
                action="${pageContext.request.contextPath}/teacher/lecture_register_ok" 
                method="post"  
                class="d-flex flex-wrap justify-content-center align-content-center w-100">
                
                <%-- 1. 강의명 --%>
                <div class="w-75 my-1">
                    <input id="lecture_name" name="lecture_name" class="form-control" type="text" placeholder="*강의명" required>
                    <div id="msg_id" class="form-text h-auto">
                        <span style='color:#dc3545'>강의명을 입력해주세요.</span>
                    </div>
                </div>
                
                <%-- 2. 교사 선택 (name="id"는 VO_Lecture.id와 매칭됩니다.) --%>
                <div class="w-75 my-1">
				    <input class="form-control" type="text" value="${loginUser.user_name}" readonly>
				    
				    <input type="hidden" name="user_name" value="${loginUser.user_name}">
				</div>
                
                <%-- 3. 정원 --%>
                <div class="w-75 my-1">
                    <input id="cap" name="cap" class="form-control" type="number" placeholder="*정원" min="1" required>
                    <div id="msg_pwConfirm" class="form-text w-75 h-auto">
                        <span style='color:#dc3545'>*정원을 입력해주세요.</span>
                    </div>
                </div>
                
                <%-- 4. 시작일 --%>
                <div class="w-75 my-1">
                    <div class="input-group">
                        <select id="year_start" name="year_start" class="form-control" required>
                            <option value="" selected disabled>*연도</option>
                        </select>
                        <span class="input-group-text">-</span>
                        <select id="month_start" name="month_start" class="form-control" required>
                            <option value="" selected disabled>*월</option>
                        </select>
                        <span class="input-group-text">-</span>
                        <select id="day_start" name="day_start" class="form-control rounded-end" required>
                            <option value="" selected disabled>*일</option>
                        </select>
                    </div>
                    <%-- 서버 전송용 Hidden 필드 (JS에서 YYYY-MM-DD 형식으로 값을 채웁니다.) --%>
                    <input id="start_date" name="start_date" type="hidden"> 
                    <div id="msg_start_date" class="form-text h-auto">
                        <span style='color:#dc3545'>*시작일을 입력해주세요.</span>
                    </div>
                </div>
                
                <%-- 5. 종료일 --%>
                <div class="w-75 my-1">
                    <div class="input-group">
                        <select id="year_end" name="year_end" class="form-control" required>
                            <option value="" selected disabled>*연도</option>
                        </select>
                        <span class="input-group-text">-</span>
                        <select id="month_end" name="month_end" class="form-control" required>
                            <option value="" selected disabled>*월</option>
                        </select>
                        <span class="input-group-text">-</span>
                        <select id="day_end" name="day_end" class="form-control rounded-end" required>
                            <option value="" selected disabled>*일</option>
                        </select>
                    </div>
                    <%-- 서버 전송용 Hidden 필드 --%>
                    <input id="end_date" name="end_date" type="hidden">
                    <div id="msg_end_date" class="form-text h-auto">
                        <span style='color:#dc3545'>*종료일을 입력해주세요.</span>
                    </div>
                </div>
                
                <%-- 6. 버튼 --%>
                <button id="btn_register_new" class="btnWide align-content-center w-75 my-1" style="height: 50px;" type="submit">
                    강의 등록
                </button>
            </form>
            <%-- ⭐⭐ 폼 종료 ⭐⭐ --%>
        </div>
    </div>
</div>

<script>
    // 날짜 드롭다운 옵션 생성
    // ----------------------------------------------------
    
    const startYearSelect = document.getElementById('year_start');
    const endYearSelect = document.getElementById('year_end');
    const startMonthSelect = document.getElementById('month_start');
    const endMonthSelect = document.getElementById('month_end');
    const startDaySelect = document.getElementById('day_start');
    const endDaySelect = document.getElementById('day_end');

    const currentYear = new Date().getFullYear();
    const startYear = 2000;

    // Year options
    for (let year = currentYear; year >= startYear; year--) {
        const option = new Option(year + '년', year);
        startYearSelect.appendChild(option.cloneNode(true));
        endYearSelect.appendChild(option.cloneNode(true));
    }

    // Month options
    for (let month = 1; month <= 12; month++) {
        const paddedMonth = month.toString().padStart(2, '0');
        const option = new Option(month + '월', paddedMonth);
        startMonthSelect.appendChild(option.cloneNode(true));
        endMonthSelect.appendChild(option.cloneNode(true));
    }
    
    // Day options
    for (let day = 1; day <= 31; day++) {
        const paddedDay = day.toString().padStart(2, '0');
        const option = new Option(day + '일', paddedDay);
        startDaySelect.appendChild(option.cloneNode(true));
        endDaySelect.appendChild(option.cloneNode(true));
    }
    
    // ----------------------------------------------------
    
    // ⭐⭐ 날짜 합치기 및 폼 제출 전처리 로직 (alert 및 preventDefault 제거) ⭐⭐
    document.getElementById('lectureRegisterForm').addEventListener('submit', function(e) {
        
        // 1. 시작일 합치기
        const startYear = document.getElementById('year_start').value;
        const startMonth = document.getElementById('month_start').value;
        const startDay = document.getElementById('day_start').value;
        
        // 필수 값 검사는 HTML의 required 속성에 맡기고, JS에서는 오류 발생 시 alert()만 제거합니다.
        if (!startYear || !startMonth || !startDay) {
            // e.preventDefault(); // 경고창을 막기 위해 제거 
            return;
        }
        document.getElementById('start_date').value = startYear + "-" + startMonth + "-" + startDay;
       
        
        
        // 2. 종료일 합치기
        const endYear = document.getElementById('year_end').value;
        const endMonth = document.getElementById('month_end').value;
        const endDay = document.getElementById('day_end').value;
        
        if (!endYear || !endMonth || !endDay) {
            // e.preventDefault(); // 경고창을 막기 위해 제거
            return; 
        }

        //`${endYear}-${endMonth}-${endDay}`
        //jsp의 expression language -> 표현언어
        //js에서는 ``사이에 ${2}가 있으면 template 리터럴
        
        document.getElementById('end_date').value = endYear + "-" + endMonth + "-" + endDay;
        
        // 합치기 성공 후 폼은 자동으로 서버로 전송됩니다.
    });
</script>

<%@ include file="../include/tail.jsp" %>