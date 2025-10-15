<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_admin.jsp" %>
<!-- content field start -->
        <div id="body">
            <h3 id="title">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>사용자 정보</b>
            </h3>
            <br><br>
            <form>
                <div>
                    <img id="icon" src="../../resources/img/profile.png">
                </div>
                <br><br>
                <div class="row mb-4">
                    <label for="id" class="col-sm-3 col-form-label">아이디</label>&emsp;
                    <div class="col-sm-8">
                        <input type="text" class="form-control mypage_w" id="id" value="hong123">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="name" class="col-sm-3 col-form-label">이름</label>&emsp;
                    <div class="col-sm-8">
                        <input type="text" class="form-control mypage_w" id="name" value="홍길동">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="pw" class="col-sm-3 col-form-label">비밀번호</label>&emsp;
                    <div class="col-sm-8">
                        <input type="password" class="form-control mypage_w" id="pw" value="hong123">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="pwcheck" class="col-sm-3 col-form-label">비밀번호확인</label>&emsp;
                    <div class="col-sm-8">
                        <input type="password" class="form-control mypage_w" id="pwcheck" value="hong123">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="gender" class="col-sm-3 col-form-label">성별</label>&emsp;
                    <div class="col-sm-8">
                        <input type="text" class="form-control mypage_w" id="gender" value="남">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="birth" class="col-sm-3 col-form-label">생년월일</label>&emsp;
                    <div class="col-sm-8">
                        <input type="date" class="form-control mypage_w" id="birth" value="2020-01-01">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="tel" class="col-sm-3 col-form-label">전화번호</label>&emsp;
                    <div class="col-sm-8">
                        <input type="tel" class="form-control mypage_w" id="tel" value="010-0000-0000">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="email" class="col-sm-3 col-form-label">이메일</label>&emsp;
                    <div class="col-sm-8">
                        <input type="email" class="form-control mypage_w" id="email" value="hong123@naver.com">
                    </div>
                </div>
                <br><br>
                <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                    <div style="text-align: center; margin-left: 37%;">
                        <a id="cancel" href="../admin/user-view.jsp" type="button" class="btn btn-danger">취소</a>
                        &nbsp; &nbsp;
                        <a id="save" href="../admin/user-view.jsp"type="button" class="btn btn-primary">저장</a>
                    </div>
                </div>
                <br><br>
            </form>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>