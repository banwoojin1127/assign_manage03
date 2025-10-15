<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_wide.jsp" %>
<!-- content field start -->
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formFindPW" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formFindPWTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div id="" class="textWideTitle d-flex flex-wrap justify-content-between align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">비밀번호 찾기</p>
                        <a href="../common/login.jsp" class=" darkBtn btn">이전</a>
                    </div>
                </div>
                <div id="formFindPWRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded py-5">
                    <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                        <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                            <form id="" class="d-flex flex-wrap justify-content-center align-content-center w-100" action="" method="post">
                                <input id="" class="form-control m-2" name="" type="text" placeholder="아이디를 입력하세요">
                                <input id="" class="form-control m-2" name="" type="password" placeholder="전화 번호를 입력하세요">
                            </form>
                        </div>
                        <button id="btnWideRequest" class="btn align-content-center w-25 my-1" type="button" data-bs-toggle="modal" data-bs-target="#codeCheckModal">
                            확인
                        </button>
                        <!-- code check Modal start-->
                        <div class="modal fade" id="codeCheckModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="codeCheckModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="min-width: 777px; max-width: 777px;">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <!-- content main title start -->
                                        <div id="" class="d-flex flex-wrap justify-content-start align-content-start" style="width: 100%;">
                                            <div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                                            &nbsp;&nbsp;
                                            <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1">
                                                <p class="flex-grow-1 m-0" style="font-size: 1.5em;">이메일 인증</p>
                                            </div>
                                        </div>
                                        <!-- content main title end -->
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <!-- info massge start -->
                                            <div>
                                                <span>등록된 이메일로 인증 코드가 발송 되었습니다.<br>인증 코드를 입력해 주세요.</span>
                                            </div>
                                            <!-- info massge end -->
                                            <!-- code check form start -->
                                            <div>
                                                <input id="" name="" class="form-control" type="text" placeholder="인증 코드">
                                            </div>
                                            <!-- code check form end -->
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                        <a href="../common/find-password-ok.jsp" class="btn btn-primary">확인</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- code check Modal end-->
                    </div>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        아이디를 입력하세요.
                        <br>
                        전화 번호를 입력하세요.
                        <br>
                        아이디 또는 전화 번호가 일치하지 않습니다.
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