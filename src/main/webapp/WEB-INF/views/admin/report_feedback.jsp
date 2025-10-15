<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_admin.jsp" %>
<!-- content field start -->
        <div class="d-flex flex-wrap justify-content-center align-content-start" style="padding: 50px;  padding-left: 75px; min-width: 689px;">
            <!-- content main title start -->
            <div id="" class="d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                &nbsp;&nbsp;
                <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1">
                    <p class="flex-grow-1 m-0" style="font-size: 1.5em;">과제 피드백</p>
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
            <!-- feedback write form start -->
            <div class="d-flex flex-wrap justify-content-center align-content-start my-3 w-100">
                <label id="" for="submissionWriteTextarea" class="darkText d-flex flex-wrap align-content-center rounded px-1 w-100">
                    <p class="m-0 p-2" style="text-align: left;">피드백</p>
                </label>
                <textarea id="submissionWriteTextarea" name="" class="boxCased d-flex form-control" rows="10"></textarea>
            </div>
            <!-- feedback write form end -->
            <!-- score file form start -->
            <label for="score" class="d-flex w-100">
                <div class="darkText d-flex flex-wrap justify-content-start align-content-start rounded mt-3 w-100">
                    <div class="d-flex flex-wrap align-content-center px-1">
                        <p class="m-0 p-2" style="text-align: left;">평가 점수</p>
                    </div>
                </div>
            </label>
            <div class="boxCased d-flex flex-wrap justify-content-center align-content-center mb-3 p-0 w-100">
                <div class="d-flex form-floating w-100">
                    <input id="score" name="" class="form-control flex-grow-1" style="border-style: none;" type="text" placeholder="00/100">
                    <label for="score">xx / 100점</label>
                </div>
            </div>
            <!-- score file form end -->
            <a href="../admin/report-view.jsp" class="darkBtn btn">확인</a>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>