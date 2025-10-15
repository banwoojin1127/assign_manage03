<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <div class="d-flex flex-wrap justify-content-center align-content-start" style="padding: 50px;  padding-left: 75px; min-width: 689px;">
            <!-- content main title start -->
            <div id="" class="d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                &nbsp;&nbsp;
                <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1">
                    <p class="flex-grow-1 m-0" style="font-size: 1.5em;">과제 제출</p>
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
                <label id="" for="submissionWriteTextarea" class="darkText d-flex flex-wrap align-content-center rounded px-1 w-100">
                    <p class="m-0 p-2" style="text-align: left;">제출 내용</p>
                </label>
                <textarea id="submissionWriteTextarea" name="" class="boxCased d-flex form-control" rows="10"></textarea>
            </div>
            <!-- submission write form end -->
            <!-- submission file form start -->
            <div class="darkText d-flex flex-wrap justify-content-between align-content-start rounded mt-3 w-100">
                <div class="d-flex flex-wrap align-content-center px-1">
                    <p class="m-0 p-2" style="text-align: left;">첨부 파일</p>
                </div>
                <div class="align-content-center">
                    <label for="submissionWriteFiles" class="mx-1 px-1">
                        <img src="../../resources/img/file-earmark-plus-fill.png" class="microIcon">
                    </label>
                </div>
            </div>
            <div class="boxCased d-flex flex-wrap justify-content-end align-content-center mb-3 w-100">
                <input id="submissionWriteFiles" class="form-control" style="display: none;" type="file">
                <div id="fileNameDisply">
                    선택된 파일 없음
                </div>
            </div>
            <!-- submission file form end -->
            <a href="../student/report-view.jsp" class="darkBtn btn">확인</a>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>