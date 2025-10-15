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
            <form id="" class="" style="margin: 0 400px; font-size: 20px;" action="" method="post">
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
                    <label for="pw" class="col-sm-3 mypage-col col-form-label">비밀번호</label>&emsp;
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="pw" value="hong123">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="pwcheck" class="col-sm-3 mypage-col col-form-label">비밀번호확인</label>&emsp;
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="pwcheck" value="hong123">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="gender" class="col-sm-3 mypage-col col-form-label">성별</label>&emsp;
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="gender" value="남">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="birth" class="col-sm-3 mypage-col col-form-label">생년월일</label>&emsp;
                    <div class="col-sm-8">
                        <input type="date" class="form-control" id="birth" value="2020-01-01">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="tel" class="col-sm-3 mypage-col col-form-label">전화번호</label>&emsp;
                    <div class="col-sm-8">
                        <input type="tel" class="form-control" id="tel" value="010-0000-0000">
                    </div>
                </div>
                <div class="row mb-4">
                    <label for="email" class="col-sm-3 mypage-col col-form-label">이메일</label>&emsp;
                    <div class="col-sm-8">
                        <input type="email" class="form-control" id="email" value="hong123@naver.com">
                    </div>
                </div>
                <br><br><br>
                <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                    <div style="text-align: center; margin-left: 37%;">
                        <a href="../common/my-page.jsp" type="button" class="btn btn-danger" style="font-size: 18px; padding-block: 5px;">취소</a> &nbsp; &nbsp;
                        <a href="../common/my-page.jsp" type="button" class="btn btn-primary" style="font-size: 18px; padding-block: 5px;">저장</a>
                    </div>
                </div>
                <br><br>
            </form>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>