<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_common.jsp" %>
<!-- content field start -->
        <div style="padding: 80px 130px; text-align: center; width: 1649px;">
            <h3 style="text-align: left; width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>개인 정보 수정</b>
            </h3>
            <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
                <div id="formFindPW" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="width: 700px;">
                    <div id="formFindPWTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                        <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1" style="width: 95%;">
                            <p class="m-0" style="font-size: 1.5em;">&nbsp;&nbsp;회원 정보 확인</p>
                        </div>
                    </div>
                    <div id="formFindPWRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 py-5" style="border-radius: 50px;">

                        <div class="d-flex flex-wrap align-content-start w-75 mt-4">
                            <div id="" class="decoWideTitle" style="width: 8px  ;"></div>
                            &nbsp;
                            <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1" style="width: 95%;">
                                <p class="m-0" style="font-size: 1.1em;">비밀번호</p>
                            </div>
                        </div>

                        <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                            <div class="d-flex flex-wrap justify-content-center w-100">
                                <form id="" class="d-flex flex-wrap justify-content-center align-content-center w-100" action="" method="post">
                                    <input id="" class="form-control m-2 my-3" name="" type="password" style="height: 50px;" placeholder="비밀번호 입력">
                                </form>
                            </div>
                            <div id="" class="helpWideRequest form-text w-75 h-auto" style="margin-left: -110px;">
                            비밀번호를 입력해주세요.
                            </div>
                        </div>
                        <div class="d-flex flex-wrap justify-content-center align-content-start w-75">
                            <a href="../common/my-page-edit.jsp" id="btnWideRequest" class="btn align-content-center h-75 my-3" type="button"
                                style="width: 505px; background-color: white; color: black;
                                border: solid 1px; font-size: 1.1em;">확인</a>
                        </div>
                            <!-- service center info field start -->
                        <div class="d-flex flex-wrap align-content-start w-75 mt-4">
                            <div class="mt-2" style="font-size: 0.9em;">
                                회원정보 수정을 위한 비밀번호 확인 절차입니다.
                            </div>
                        </div>
                        <!-- service center info field end -->
                    </div>
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>