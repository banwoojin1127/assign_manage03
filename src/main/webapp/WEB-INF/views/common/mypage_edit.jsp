<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="co" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<co:choose>
    <co:when test="${login.user_class == '0'}">
        <%@ include file="/WEB-INF/views/include/head_admin.jsp" %>
    </co:when>
    <co:when test="${login.user_class == '1'}">
        <%@ include file="/WEB-INF/views/include/head_teacher.jsp" %>
    </co:when>
    <co:when test="${login.user_class == '2'}">
        <%@ include file="/WEB-INF/views/include/head_student.jsp" %>
    </co:when>
    <co:otherwise>
        <co:redirect url="/common/login"/>
    </co:otherwise>
</co:choose>
<script src="<c:url value='/resources/js/userInfo.js'/>"></script>
<script>
    const CONTEXT_PATH = "${pageContext.request.contextPath}"; 
    const userInfoUrl = CONTEXT_PATH + "/common/"; 
    sessionLogin = "<c:out value='${login}'/>";
    sessionClass = "-1";
    sessionTel = "<c:out value='${login.tel}'/>";
    sessionEmail = "<c:out value='${login.email}'/>";
</script>
<!-- content field start -->
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formModify" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formModifyTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div class="textWideTitle d-flex flex-wrap justify-content-between align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">회원정보</p>
                    </div>
                </div>
                <div id="formModifyRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded pt-3 pb-5">
                    <!-- userInfoView form start -->
                    <form id="infoModify" name="infoModify" action="mypage_edit" method="post" class="d-flex flex-wrap justify-content-center align-content-center w-100">
                        <input id="user_class" name="user_class" type="hidden" value="${login.user_class}">
                        <input id="user_icon" name="user_icon" type="hidden" value="0"> <!-- !!! 삭제 안건 !!! -->
                        <div class="form-floating w-75 my-1">
                            <input id="id" name="id" class="form-control" type="text" placeholder="아이디" value="${login.id}" disabled>
                            <label for="id" class="mx-2">ID / 아이디</label>
                            <div id="msg_id" class="form-text h-auto">
                                <span style='color:#dc3545'></span>
                            </div>
                        </div>
                        <div class="form-floating w-75 my-1">
                            <input id="pw" name="pw" class="form-control" type="password" placeholder="비밀번호">
                            <label for="pw" class="mx-2">PW / 비밀번호</label>
                            <div id="msg_pw" class="form-text h-auto">
                                <span style='color:#dc3545'></span>
                            </div>
                        </div>
                        <div class="form-floating w-75 my-1">
                            <input id="pwConfirm" name="pwConfirm" class="form-control" type="password" placeholder="비밀번호 확인">
                            <label for="pwConfirm" class="mx-2">PW Check / 비밀번호 확인</label>
                            <div id="msg_pwConfirm" class="form-text w-75 h-auto">
                                <span style='color:#dc3545'></span>
                            </div>
                        </div>
                        <div class="form-floating w-75 my-1">
                            <input id="user_name" name="user_name" class="form-control" type="text" placeholder="이름" value="${login.user_name}" disabled>
                            <label for="user_name" class="mx-2">이름</label>
                            <div id="msg_name" class="form-text h-auto">
                                <span style='color:#dc3545'></span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <div id="genderSelectGroup" class="btn-group w-100">
                                <input id="genderM" name="gender" class="val-gender btn-check" type="radio" value="M" autocomplete="off" ${login.gender == 'M' ? 'checked' : ''} disabled>
                                <label id="" class="btn-gender btn" for="genderM">남성</label>
                                <input id="genderF" name="gender" class="val-gender btn-check" type="radio" value="F" autocomplete="off" ${login.gender == 'F' ? 'checked' : ''} disabled>
                                <label id="" class="btn-gender btn" for="genderF">여성</label>
                            </div>
                            <div id="msg_gender" class="helpWideRequest form-text h-auto">
                                <span style='color:#dc3545'></span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <div class="input-group">
                                <select id="year" class="form-control">
                                    <option value="">연도</option>
                                </select>
                                <script>
                                    // 기억된 연도를 가져옵니다.
                                    birthYearStr = '${login.birth}';
                                    // substring(0, 4)를 사용하여 첫 4글자를 추출
                                    if (birthYearStr && birthYearStr.length >= 4)
                                    {
                                        birthYearStr = birthYearStr.substring(0, 4);
                                    }
                                    // 비교를 위해 형변환
                                    birthYearInt = parseInt(birthYearStr || '0', 10);

                                    // 현재 연도를 가져옵니다.
                                    currentYear = new Date().getFullYear();
                                    // 시작 연도를 설정합니다.
                                    startYear = 1921; // 시작 연도
                                    // select 요소를 가져옵니다.
                                    selectElement = document.getElementById('year');

                                    // 1990년부터 현재 연도까지의 옵션을 생성합니다.
                                    for (let year = currentYear; year >= startYear; year--) 
                                    {
                                        option = document.createElement('option');
                                        option.value = year;
                                        option.textContent = year + '년';
                                        if (year === birthYearInt)
                                        {
                                            option.selected = true;
                                        }
                                        selectElement.appendChild(option);
                                    }
                                </script>
                                <span class="input-group-text">-</span>
                                <select id="month" class="form-control">
                                    <option value="">월</option>
                                </select>
                                <script>
                                    // 기억된 x월을 가져옵니다.
                                    birthMonthStr = '${login.birth}';
                                    // substring(0, 4)를 사용하여 첫 4글자를 추출
                                    if (birthMonthStr && birthMonthStr.length >= 7)
                                    {
                                        birthMonthStr = birthMonthStr.substring(5, 7);
                                    }
                                    // 비교를 위해 형변환
                                    birthMonthInt = parseInt(birthMonthStr || '0', 10);

                                    // select 요소를 가져옵니다.
                                    monthSelect = document.getElementById('month');

                                    // 1월부터 12월까지의 옵션을 생성합니다.
                                    for (let month = 1; month <= 12; month++) 
                                    {
                                        option = document.createElement('option');
                                        option.value = month.toString().padStart(2, '0'); // 두 자리 숫자로 만듭니다.
                                        option.textContent = month + '월';
                                        if (month === birthMonthInt)
                                        {
                                            option.selected = true;
                                        }
                                        monthSelect.appendChild(option);
                                    }
                                </script>
                                <span class="input-group-text">-</span>
                                <select id="day" class="form-control rounded-end">
                                    <option value="">일</option>
                                </select>
                                <script>
                                    // 기억된 x월을 가져옵니다.
                                    birthDayStr = '${login.birth}';
                                    // substring(0, 4)를 사용하여 첫 4글자를 추출
                                    if (birthDayStr && birthDayStr.length >= 10)
                                    {
                                        birthDayStr = birthDayStr.substring(8, 10);
                                    }
                                    // 비교를 위해 형변환
                                    birthDayInt = parseInt(birthDayStr || '0', 10);

                                    // select 요소를 가져옵니다.
                                    daySelect = document.getElementById('day');

                                    // 1일부터 31일까지의 옵션을 생성합니다.
                                    for (let day = 1; day <= 31; day++) 
                                    {
                                        option = document.createElement('option');
                                        option.value = day.toString().padStart(2, '0'); // 두 자리 숫자로 만듭니다.
                                        option.textContent = day + '일';
                                        if (day === birthDayInt)
                                        {
                                            option.selected = true;
                                        }
                                        daySelect.appendChild(option);
                                    }
                                </script>
                            </div>
                            <input id="birth" name="birth" type="hidden">
                            <div id="msg_birth" class="form-text h-auto">
                                <span style='color:#dc3545'></span>
                            </div>
                        </div>
                        <div class="form-floating w-75 my-1">
                            <input id="tel" name="tel" class="form-control my-1" type="text" placeholder="전화번호" value="${login.tel}">
                            <label for="tel" class="mx-2">전화번호</label>
                            <div id="msg_tel" class="form-text h-auto">
                                <span style='color:#dc3545'></span>
                            </div>
                        </div>
                        <!-- email input group start -->
                        <div class="input-group w-75 my-1">
                            <co:choose>
                                <co:when test="${fn:contains(login.email, '@')}">
                                    <co:set var="emailParts" value="${fn:split(login.email, '@')}"/>
                                </co:when>
                                <co:otherwise>
                                    <co:set var="emailParts" value="${fn:split('', '@')}"/>
                                </co:otherwise>
                            </co:choose>
                            <input id="persnal" name="persnal"class="form-control" type="text" placeholder="이메일" value="${emailParts[0]}">
                            <span class="input-group-text">@</span>
                            <!-- mail get in field start -->
                            <select id="domain" name="domain" class="form-select rounded-end">
                                <option value="" ${empty emailParts[1] ? 'selected' : ''}>선택</option>

                                <option value="naver.com" ${emailParts[1] == 'naver.com' ? 'selected' : ''}>naver.com</option>

                                <option value="gmail.com" ${emailParts[1] == 'gmail.com' ? 'selected' : ''}>gmail.com</option>

                                <option value="doum.net" ${emailParts[1] == 'doum.net' ? 'selected' : ''}>doum.net</option>

                                <option value="hanmail.net" ${emailParts[1] == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
                            </select>
                            <!-- mail get in field end -->
                        </div>
                        <input type="hidden" id="email" name="email">
                        <div id="msg_email" class="form-text w-75 h-auto">
                            <span style='color:#dc3545'></span>
                        </div>
                        <div class="d-flex flex-column align-content-center w-75 mb-3">
                            <input type="hidden" id="sendcode" name="sendcode">
                            <label for="code" class="form-label m-2" style="font-weight: bold;">인증 코드 입력 : </label>
                            <div class="d-flex flex-wrap justify-content-between align-content-center">
                                <input id="code" name="code" class="form-control" style="width: 60%; height: 100%;" type="text">
                                <input id="btn_email" class="btnWide" style="width: 40%;" type="button" value="인증 메일 발송">
                            </div>
                            <div id="msg_code" class="form-text h-auto mt-2">
                                <span style='color:#dc3545;'></span>
                            </div>
                            <div id="msg_afterSand" class="form-text h-auto mt-2" style="font-size: 0.8em;">
                            </div>
                        </div>
                        <!-- email input group end -->
                        <button id="btn_infoModify" class="btnWide align-content-center w-75 my-1" style="height: 50px;" type="button">
                            저장하기
                        </button>
                    </form>
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>