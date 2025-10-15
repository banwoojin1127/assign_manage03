<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_teacher.jsp" %>

<!-- content field start -->
        <div class="d-flex flex-wrap justify-content-center align-content-start" style="padding: 50px;  padding-left: 75px; min-width: 689px;">
            <!-- content main title start -->
            <div id="" class="d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                &nbsp;&nbsp;
                <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1">
                    <p class="flex-grow-1 m-0" style="font-size: 1.5em;">과제 상세보기</p>
                </div>
                <div class="ms-auto">
                    <a href="../teacher/assignment-view.jsp" class="darkBtn btn rounded px-3" style="height: 40px;"><b>이전</b></a>
                </div>
            </div>
            <!-- content main title end -->
            <!-- assignment info box start -->
            <div class="boxCased d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div class="d-flex justify-content-between w-100">
                    <div><b>강좌 : </b>HTML</div>
                    <div><b>이름 : </b>홍길동</div>
                </div>
                <div class="d-flex justify-content-between w-100">
                    <div><b>과제 : </b>디자인을 확인하고 HTML 만들어서 제출</div>
                    <div><b>담당 : </b>성춘향</div>
                </div>
            </div>
            <!-- assignment info box end -->
            <!-- submission write form start -->
            <div class="d-flex flex-wrap justify-content-center align-content-start my-3 w-100">
                <div id="" class="darkText d-flex flex-wrap justify-content-start align-content-center rounded px-1 w-100">
                    <p class="d-flex m-0 p-2" style="text-align: left;">제출 내용</p>
                </div>
                <div id="submissionNote" name="" class="boxCased d-flex w-100">
                    홍길동이 조선시대에 한반도에서 의적으로서 백성을 도왔다.
                </div>
            </div>
            <!-- submission write form end -->
            <!-- submission file form start -->
            <div class="darkText d-flex flex-wrap justify-content-start align-content-start rounded mt-3 w-100">
                <div class="d-flex flex-wrap align-content-center px-1">
                    <p class="m-0 p-2" style="text-align: left;">첨부 파일</p>
                </div>
            </div>
            <div class="boxCased d-flex flex-wrap justify-content-end align-content-center mb-3 w-100">
                <div id="fileNameDisply">
                    선택된 파일 없음
                </div>
            </div>
            <!-- submission file form end -->
            <!-- feedback / score info box start-->
            <div class="d-flex flex-wrap justify-content-center align-content-start my-3 w-100">
                <div class="darkText d-flex flex-wrap justify-content-between align-content-start rounded w-100">
                    <div class="d-flex flex-wrap align-content-center px-1">
                        <p class="m-0 p-2" style="text-align: left;">평가 및 피드백</p>
                    </div>
                    <div class="d-flex px-1">
                        <div class="d-flex flex-wrap align-content-center px-3">
                            00 / 00
                        </div>
                        <a href="../teacher/report-feedback.jsp" class="whiteBtn btn d-flex flex-wrap align-content-center rounded my-1">
                            수정
                        </a>
                    </div>
                </div>
                <div class="boxCased d-flex align-content-center w-100">
                    디테일에 집중하지 말고 기능구현을 최우선으로 생각하세요. 시스템의, 데이터의 흐름이 올바르지 못하면 전부 망가집니다. 조금 더 노력합시다.
                </div>
            </div>
            <!-- feedback / score info box end-->
        </div>
<!-- content field end -->

<%@ include file="../include/tail.jsp" %>