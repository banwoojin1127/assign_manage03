<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_common.jsp" %>
<!-- content field start -->
        <div style="padding: 80px 130px; text-align: center; width: 1649px;">
            <h3 style="text-align: left; width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>마이페이지</b>
            </h3>
            <br><br>
            <form style="margin: 0 400px; font-size: 20px;">
                <div>
                    <img src="../../resources/img/profile.png" style="width: 45%; height: 45%;">
                </div>
                <br><br>
                <div class="row mb-4">
                    <label for="id" class="col-sm-3 mypage-col col-form-label">아이디</label>&emsp;
                    <div class="col-sm-8">
                        <input type="text" class="form-control mypage" id="id" disabled value="hong123">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="name" class="col-sm-3 mypage-col col-form-label">이름</label>&emsp;
                    <div class="col-sm-8">
                        <input type="text" class="form-control mypage" id="name" disabled value="홍길동">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="gender" class="col-sm-3 mypage-col col-form-label">성별</label>&emsp;
                    <div class="col-sm-8">
                        <input type="text" class="form-control mypage" id="gender" disabled value="남">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="birth" class="col-sm-3 mypage-col col-form-label">생년월일</label>&emsp;
                    <div class="col-sm-8">
                        <input type="date" class="form-control mypage" id="birth" disabled value="2020-01-01">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="tel" class="col-sm-3 mypage-col col-form-label">전화번호</label>&emsp;
                    <div class="col-sm-8">
                        <input type="tel" class="form-control mypage" id="tel" disabled value="010-0000-0000">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="email" class="col-sm-3 mypage-col col-form-label">이메일</label>&emsp;
                    <div class="col-sm-8">
                        <input type="email" class="form-control mypage" id="email" disabled value="hong123@naver.com">
                    </div>
                </div>
                <br><br>
                <div>
                    <a href="../common/my-page-auth.jsp" class="btn btn-primary align-content-center" style="font-size: 18px; padding-block: 5px;">수정</a>
                </div><br>
                    <div style="text-align: right;">
                    <a href="../common/login.jsp" type="button" class="btn btn-link"
                    style="color: gray; text-decoration-line: none; margin-right: -250px; font-size: 18px;">회원탈퇴</a>
                </div>
                <br><br>
            </form>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>