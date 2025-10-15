<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_wide.jsp" %>
<!-- content field start -->
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formFindID" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formFindIDTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div id="" class="textWideTitle d-flex flex-wrap justify-content-between align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">아이디 찾기</p>
                        <a href="../common/login.jsp" class=" darkBtn btn">이전</a>
                    </div>
                </div>
                <div id="formFindIDRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded py-5">
                    <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                        <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                            <form id="" class="d-flex flex-wrap justify-content-center align-content-center w-100" action="" method="post">
                                <input id="" class="form-control m-2" name="" type="text" placeholder="이름을 입력하세요">
                                <input id="" class="form-control m-2" name="" type="password" placeholder="전화 번호를 입력하세요">
                            </form>
                        </div>
                        <a href="../common/find-id-ok.jsp" id="btnWideRequest" class="btn align-content-center w-25 my-1" type="button">확인</a>
                    </div>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        이름을 입력하세요.
                        <br>
                        전화 번호를 입력하세요.
                        <br>
                        이름 또는 전화 번호가 일치하지 않습니다.
                    </div>
                    <!-- service center info field start -->
                    <div class="d-flex flex-wrap align-content-start w-75 mt-4">
                        <div id="" class="decoWideTitle" style="width: 6px;"></div>
                        &nbsp;
                        <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1" style="width: 95%;">
                            <p class="m-0" style="font-size: 0.75em;">고객센터</p>
                        </div>
                        <div class="mt-2" style="font-size: 0.75em;">
                            고 객 센 터 Tel : 070 - 1234 - 5678
                        </div>
                    </div>
                    <!-- service center info field end -->
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>