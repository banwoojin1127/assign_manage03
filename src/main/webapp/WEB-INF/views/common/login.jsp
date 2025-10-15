<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_wide.jsp" %>
<!-- content field start -->
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formLogin" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">로그인</p>
                    </div>
                </div>
                <div id="formLoginRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded py-5">
                    <form id="" class="d-flex flex-wrap justify-content-center align-content-center w-100" action="" method="post">
                        <input id="" class="form-control w-75 my-1" name="" type="text" placeholder="아이디"><br>
                        <input id="" class="form-control w-75 my-1" name="" type="password" placeholder="비밀번호"><br>
                    </form>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        아이디를 입력하세요.
                        <br>
                        비밀번호를 입력하세요.
                        <br>
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                    <a href="../common/my-page.jsp" id="btnWideRequest" class="btn align-content-center w-75 my-1" style="height: 50px;" type="button">로그인</a>
                    <div id="" class="darkText w-75 h-auto my-1 p-2">
                        <a href="../common/signup.jsp" style="color: white; text-decoration : none;">회원 가입</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="../common/find-id.jsp" style="color: white; text-decoration : none;">아이디 찾기</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="../common/find-password.jsp" style="color: white; text-decoration : none;">비밀번호 찾기</a>
                    </div>
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>