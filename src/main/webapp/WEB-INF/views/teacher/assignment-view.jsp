<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/head_teacher.jsp" %>
<!-- content field start -->
        <div class="d-flex flex-wrap justify-content-center align-content-start" style="padding: 50px; padding-left: 75px; min-width: 689px;">
            <!-- content main title start -->
            <div id="" class="d-flex flex-wrap justify-content-center align-content-start my-3" style="width: 100%;">
                <div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                &nbsp;&nbsp;
                <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1">
                    <p class="flex-grow-1 m-0" style="font-size: 1.5em;">과제 상세보기</p>
                </div>
                <div class="ms-auto">
                    <a href="../teacher/assignment-list.jsp" class="darkBtn btn rounded px-3" style="height: 40px;"><b>이전</b></a>
                </div>
            </div>
            <!-- content main title end -->
            <!-- content main header start -->
            <div id="" class="d-flex justify-content-center align-content-start my-4" style="width: 100%;">
                <!-- assignment title start -->
                <div class="darkText d-flex flex-wrap align-content-center flex-grow-1 rounded p-2">
                    <div id="" class="darkText d-flex flex-wrap align-content-center rounded px-1">
                        <p class="m-0 px-3" style="text-align: left; font-size: 1.25em;">강의 명 : HTML</p>
                    </div>
                    <div class="ms-auto">
                        <button class="whiteBtn rounded px-3" style="height: 40px;"><b>수정</b></button>
                    </div>
                </div>
                <!-- assignment title end -->
            </div>
            <!-- content main header end -->
            <!-- assignment posted info start -->
            <div id="formAssignPostedInfo" class="tableCased d-flex flex-wrap justify-content-start align-content-start my-1" style="width: 100%;">
                <div class="d-flex justify-content-start align-content-center w-100">
                    <div class="tableCellName d-flex" style="min-width: 85px;">
                        과제명
                    </div>
                    <div class="tableCellValue d-flex flex-grow-1">
                        <input id="" name="" class="form-control flex-grow-1" style="border-style: none;" type="text" value="디자인을 확인하고 HTML 만들어서 제출">
                    </div>
                </div>
                <div class="d-flex justify-content-start align-content-center w-100">
                    <div class="tableCellName d-flex" style="min-width: 85px;">
                        제출방식
                    </div>
                    <div class="tableCellValue d-flex flex-grow-1">
                        <input id="" name="" class="form-control flex-grow-1" style="border-style: none;" type="text" value="HTML">
                    </div>
                </div>
                <div class="d-flex justify-content-start align-content-center w-100">
                    <div class="tableCellName d-flex" style="min-width: 85px;">
                        주차 수
                    </div>
                    <div class="tableCellValue d-flex flex-grow-1">
                        1주차
                    </div>
                    <div class="tableCellName d-flex" style="min-width: 85px;">
                        종료 일
                    </div>
                    <div class="tableCellValue d-flex flex-grow-1">
                        <input type="datetime-local" id="datetime-local" value="2025-10-01T18:00">
                    </div>
                </div>
                <div class="d-flex justify-content-start align-content-center w-100">
                    <div class="tableCellName d-flex" style="min-width: 85px;">
                        내용
                    </div>
                    <div class="tableCellValue d-flex flex-grow-1">
                        <input id="" name="" class="form-control flex-grow-1" style="border-style: none;" type="text" value="디자인을 보고 시스템의 흐름을 이해하며, html로 구현하는 능력을 함양하는 것">
                    </div>
                </div>
            </div>
            <!-- assignment posted info end -->
            <!-- submission status start -->
            <div class="accordion my-1" style="width: 100%;">
                <div class="accordionItem accordion-item">
                    <div class="accordion-header">
                        <button id="submissionStatus" class="accordion-button collapsed" type="button" 
                            data-bs-toggle="collapse" data-bs-target="#bodySubmissionStatus" 
                            aria-expanded="true" aria-controls="bodySubmissionStatus">
                        제출 현황
                        </button>
                    </div>
                    <div id="bodySubmissionStatus" class="accordion-collapse collapse show w-100">
                        <div class="d-flex justify-content-start align-content-start accordion-body p-0">
                            <div id="tableSubmissionStatus" class="tableCased d-flex flex-wrap justify-content-start align-content-start my-1 w-100">
                                <div class="d-flex flex flex-wrap justify-content-start align-content-start w-100">
                                    <div class="tableCellName d-flex justify-content-center" style="min-width: 75px;">이름</div>
                                    <div class="tableCellName d-flex justify-content-center flex-grow-1">제출 상태</div>
                                    <div class="tableCellName d-flex justify-content-center" style="min-width: 100px;">과제</div>
                                    <div class="tableCellName d-flex justify-content-center" style="min-width: 175px;">평가</div>
                                </div>
                                <div class="d-flex flex flex-wrap justify-content-start align-content-start w-100">
                                    <div class="tableCellValue d-flex justify-content-center" style="min-width: 75px;"><div class="align-content-center">전우치</div></div>
                                    <div class="tableCellValue d-flex justify-content-between flex-grow-1">
                                        <div style="width: 48px;"></div>
                                        <div class="align-content-center">제출 완료</div>
                                        <div style="width: 48px;"></div>
                                    </div>
                                    <div class="tableCellValue d-flex justify-content-center" style="min-width: 100px;">
                                        <a href="../teacher/report-view.jsp" class="darkBtn btn align-content-center">확인</a>
                                    </div>
                                    <div class="tableCellValue d-flex justify-content-between" style="min-width: 175px;">
                                        <div style="width: 48px;"></div>
                                        <div class="align-content-center">15</div>
                                        <div><a href="../teacher/report-feedback.jsp" class="darkBtn btn align-content-center">수정</a></div>
                                    </div>
                                </div>
                                <div class="d-flex flex flex-wrap justify-content-start align-content-start w-100">
                                    <div class="tableCellValue d-flex justify-content-center" style="min-width: 75px;"><div class="align-content-center">홍길동</div></div>
                                    <div class="tableCellValue d-flex justify-content-between flex-grow-1">
                                        <div style="width: 48px;"></div>
                                        <div class="align-content-center">제출 미완료</div>
                                        <div style="width: 48px;"></div>
                                    </div>
                                    <div class="tableCellValue d-flex justify-content-center" style="min-width: 100px;">
                                        <a href="../teacher/report-view.jsp" class="darkBtn btn align-content-center">확인</a>
                                    </div>
                                    <div class="tableCellValue d-flex justify-content-between" style="min-width: 175px;">
                                        <div style="width: 48px;"></div>
                                        <div class="align-content-center">--</div>
                                        <div><a href="../teacher/report-feedback.jsp" class="darkBtn btn align-content-center">평가</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- submission status end -->
            <!-- QnA list start -->
            <div class="accordion my-1" style="width: 100%;">
                <div class="accordionItem accordion-item w-100">
                    <div class="accordion-header">
                        <button id="submissionStatus" class="accordion-button collapsed mb-1" type="button" 
                            data-bs-toggle="collapse" data-bs-target="#bodyQnAList" 
                            aria-expanded="true" aria-controls="bodyQnAList">
                        질의 응답
                        </button>
                    </div>
                    <div id="bodyQnAList" class="accordion-collapse collapse show">
                        <div class="d-flex flex-wrap justify-content-start align-content-start accordion-body p-0">
                            <div class="d-flex justify-content-end my-1 w-100">
                                <div class="align-content-center" style="visibility: hidden;">
                                    <button class="darkBtn p-1" 
                                        data-bs-toggle="collapse" data-bs-target="#questionWrite" aria-expanded="false" aria-controls="questionWrite">
                                        질문하기
                                    </button>
                                </div>
                            </div>
                            <div id="tableQnAList" class="tableCased d-flex flex-wrap justify-content-start align-content-start my-1 w-100">
                                <div id="questionWrite" class="collapse" style="width: 100%;">
                                    <div class="d-flex justify-content-start align-content-start w-100 m-0 p-0">
                                        <div class="miniIcon d-flex justify-content-center m-1"></div>
                                        <div class="d-flex justify-content-center m-1">
                                            <img src="../../resources/img/profile.png" class="miniIcon">
                                        </div>
                                        <div class="d-flex justify-content-center m-2"><div class="textWideTitle align-content-center">Q . 홍길동 : </div></div>
                                        <input id="" name="" class="flex-grow-1" style="border-style: none;" type="text">
                                        <input type="button" class="clearBtn d-flex justify-content-center" style="min-width: 30px; font-size: 0.8em;" value="완료">
                                        <input type="button" class="clearBtn d-flex justify-content-center" style="min-width: 30px; font-size: 0.8em;" value="취소">
                                    </div>
                                </div>
                                <div id="question00" class="d-flex flex-wrap justify-content-start align-content-start w-100 m-0 p-0">
                                    <button class="clearBtn d-flex flex-wrap flex-grow-1 p-0"
                                        data-bs-toggle="collapse" data-bs-target="#answer00" aria-expanded="false" aria-controls="answer00">
                                        <div class="d-flex justify-content-center m-1">
                                            <img src="../../resources/img/check2.svg" class="miniIcon">
                                        </div>
                                        <div class="d-flex justify-content-center m-1">
                                            <img src="../../resources/img/profile.png" class="miniIcon">
                                        </div>
                                        <div class="d-flex justify-content-center m-2"><div class="textWideTitle align-content-center">Q . 홍길동 : </div></div>
                                        <div class="d-flex justify-content-start flex-grow-1"><div class="align-content-center">과제를 잘못 올린것 같습니다.</div></div>
                                    </button>
                                        <div class="d-flex justify-content-center m-1">
                                            <a class="clearBtn btn align-content-center p-2">
                                                <img src="../../resources/img/x-circle-fill.svg" class="microIcon">
                                            </a>
                                        </div>
                                </div>
                                <div id="answer00" class="collapse" style="width: 100%;">
                                    <div id="" class="d-flex justify-content-start align-content-start w-100 m-0 p-0">
                                        <div class="miniIcon d-flex justify-content-center m-1"></div>
                                        <div class="d-flex justify-content-center m-1">
                                            <img src="../../resources/img/profile.png" class="miniIcon">
                                        </div>
                                        <div class="d-flex justify-content-center m-2"><div class="textWideTitle align-content-center">A . 선생님 : </div></div>
                                        <input id="" name="" class="flex-grow-1" style="border-style: none;" type="text">
                                        <input type="button" class="clearBtn d-flex justify-content-center" style="min-width: 30px; font-size: 0.8em;" value="완료">
                                        <input type="button" class="clearBtn d-flex justify-content-center" style="min-width: 30px; font-size: 0.8em;" value="취소">
                                    </div>
                                    <div id="" class="d-flex justify-content-start align-content-start w-100 m-0 p-0">
                                        <div class="miniIcon d-flex justify-content-center m-1"></div>
                                        <div class="d-flex justify-content-center m-1">
                                            <img src="../../resources/img/profile.png" class="miniIcon">
                                        </div>
                                        <div class="d-flex justify-content-center m-2"><div class="textWideTitle align-content-center">A . 선생님 : </div></div>
                                        <div class="d-flex justify-content-start flex-grow-1"><div class="align-content-center">제출 상태의 '수정'을 누르면 바꿀 수 있습니다.</div></div>
                                        <input type="button" class="clearBtn d-flex justify-content-center" style="min-width: 30px; font-size: 0.8em;" value="수정">
                                        <input type="button" class="clearBtn d-flex justify-content-center" style="min-width: 30px; font-size: 0.8em;" value="삭제">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- QnA list end -->
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>