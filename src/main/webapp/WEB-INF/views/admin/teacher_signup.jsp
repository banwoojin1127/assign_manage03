<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_admin.jsp" %>
<script src="<c:url value='/resources/js/userInfo.js'/>"></script>
<script>
    const CONTEXT_PATH = "${pageContext.request.contextPath}"; 
    const userInfoUrl = CONTEXT_PATH + "/common/"; 
    sessionLogin = "<c:out value='${login}'/>";
    sessionClass = "<c:out value='${login.user_class}'/>";
    sessionTel = "<c:out value='${login.tel}'/>";
    sessionEmail = "<c:out value='${login.email}'/>";
</script>
<link rel="stylesheet" href="<c:url value='/resources/css/wide_v01.css'/>"/>
<!-- content field start -->
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formJoin" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formJoinTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div class="textWideTitle d-flex flex-wrap justify-content-between align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">교사 등록</p>
                    </div>
                </div>
                <div id="formJoinRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded pt-3 pb-5">
                    <div id="" class="helpWideRequest form-text w-75 h-auto mb-3">
                        <span style='color:#dc3545; font-weight: bold;'> * : 필수 입력 사항입니다.</span>
                    </div>
                    <!-- join form start -->
                    <form id="join" name="join" action="<c:url value='/common/signup' />" method="post" class="d-flex flex-wrap justify-content-center align-content-center w-100">
                        <input id="user_class" name="user_class" type="hidden" value="1">
                        <input id="user_icon" name="user_icon" type="hidden" value="0">
                        <div class="w-75 my-1">
                            <input id="id" name="id" class="form-control" type="text" placeholder="아이디">
                            <div id="msg_id" class="form-text h-auto">
                                <span style='color:#dc3545'>*아이디를 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="pw" name="pw" class="form-control" type="password" placeholder="비밀번호">
                            <div id="msg_pw" class="form-text h-auto">
                                <span style='color:#dc3545'>*비밀번호를 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="pwConfirm" name="pwConfirm" class="form-control" type="password" placeholder="비밀번호 확인">
                            <div id="msg_pwConfirm" class="form-text w-75 h-auto">
                                <span style='color:#dc3545'>*동일한 비밀번호를 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="user_name" name="user_name" class="form-control" type="text" placeholder="이름">
                            <div id="msg_name" class="form-text h-auto">
                                <span style='color:#dc3545'>*이름을 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <div id="genderSelectGroup" class="btn-group w-100">
                                <input id="genderM" name="gender" class="val-gender btn-check" type="radio" value="M" autocomplete="off">
                                <label id="" class="btn-gender btn" for="genderM">남성</label>
                                <input id="genderF" name="gender" class="val-gender btn-check" type="radio" value="F" autocomplete="off">
                                <label id="" class="btn-gender btn" for="genderF">여성</label>
                            </div>
                            <div id="msg_gender" class="helpWideRequest form-text h-auto">
                                <span style='color:#dc3545'>*성별을 선택해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <div class="input-group">
                                <select id="year" class="form-control">
                                    <option value="" selected>연도</option>
                                </select>
                                <script>
                                    // 현재 연도를 가져옵니다.
                                    const currentYear = new Date().getFullYear();
                                    // 시작 연도를 설정합니다.
                                    const startYear = 1921; // 시작 연도
                                    // select 요소를 가져옵니다.
                                    const selectElement = document.getElementById('year');

                                    // 1990년부터 현재 연도까지의 옵션을 생성합니다.
                                    for (let year = currentYear; year >= startYear; year--) 
                                    {
                                    const option = document.createElement('option');
                                    option.value = year;
                                    option.textContent = year + '년';
                                    selectElement.appendChild(option);
                                    }
                                </script>
                                <span class="input-group-text">-</span>
                                <select id="month" class="form-control">
                                    <option value="" selected>월</option>
                                </select>
                                <script>
                                    // select 요소를 가져옵니다.
                                    const monthSelect = document.getElementById('month');

                                    // 1월부터 12월까지의 옵션을 생성합니다.
                                    for (let month = 1; month <= 12; month++) 
                                    {
                                        const option = document.createElement('option');
                                        option.value = month.toString().padStart(2, '0'); // 두 자리 숫자로 만듭니다.
                                        option.textContent = month + '월';
                                        monthSelect.appendChild(option);
                                    }
                                </script>
                                <span class="input-group-text">-</span>
                                <select id="day" class="form-control rounded-end">
                                    <option value="" selected>일</option>
                                </select>
                                <script>
                                    // select 요소를 가져옵니다.
                                    const daySelect = document.getElementById('day');

                                    // 1일부터 31일까지의 옵션을 생성합니다.
                                    for (let day = 1; day <= 31; day++) 
                                    {
                                        const option = document.createElement('option');
                                        option.value = day.toString().padStart(2, '0'); // 두 자리 숫자로 만듭니다.
                                        option.textContent = day + '일';
                                        daySelect.appendChild(option);
                                    }
                                </script>
                            </div>
                            <input id="birth" name="birth" type="hidden">
                            <div id="msg_birth" class="form-text h-auto">
                                <span style='color:#dc3545'>*생년월일을 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="tel" name="tel" class="form-control my-1" type="text" placeholder="전화번호">
                            <div id="msg_tel" class="form-text h-auto">
                                <span style='color:#dc3545'>*전화번호를 '-'없이 입력해주세요.</span>
                            </div>
                        </div>
                        <button id="btn_join" class="btnWide align-content-center w-75 my-1" style="height: 50px;" type="button">
                            교사 등록
                        </button>
                    </form>
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>