<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <a href="../assign/list/${assign.lecture_no}" class="darkBtn btn rounded px-3" style="height: 40px;"><b>이전</b></a>
                </div>
            </div>
            <!-- content main title end -->
            <!-- content main header start -->
            <div id="" class="d-flex justify-content-center align-content-start my-4" style="width: 100%;">
                <!-- assignment title start -->
                <div class="darkText d-flex flex-wrap align-content-center flex-grow-1 rounded p-2">
                    <div id="" class="darkText d-flex flex-wrap align-content-center rounded px-1">
                        <p class="m-0 px-3" style="text-align: left; font-size: 1.25em;">
                        	강의명 : ${assign.lecture_name}
                        </p>
                    </div>
                    <div class="ms-auto">
			            <!-- 수정 / 저장 버튼 -->
			            <button id="editBtn" class="whiteBtn rounded px-3" style="height: 40px;"><b>수정</b></button>
			            <button id="saveBtn" class="whiteBtn rounded px-3" style="height: 40px; display:none;"><b>저장</b></button>
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
                        ${assign.assign_name}
                    </div>
                </div>
                <div class="d-flex justify-content-start align-content-center w-100">
                    <div class="tableCellName d-flex" style="min-width: 85px;">
                        제출방식
                    </div>
                    <div class="tableCellValue d-flex flex-grow-1">
                        ${assign.assign_method}
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
                        제출 기한
                    </div>
                    <div class="tableCellValue d-flex flex-grow-1">
                        ${assign.end_date}
                    </div>
                </div>
                <div class="d-flex justify-content-start align-content-center w-100">
                    <div class="tableCellName d-flex" style="min-width: 85px;">
                        내용
                    </div>
                    <div class="tableCellValue d-flex flex-grow-1">
                        ${assign.assign_note}
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
                                
                                <!-- 헤더 -->
                                <div class="d-flex flex flex-wrap justify-content-start align-content-start w-100">
                                    <div class="tableCellName d-flex justify-content-center" style="width: 120px;">이름</div>
                                    <div class="tableCellName d-flex justify-content-center flex-grow-1">제출 상태</div>
                                    <div class="tableCellName d-flex justify-content-center" style="min-width: 100px;">과제</div>
                                    <div class="tableCellName d-flex justify-content-center" style="min-width: 175px;">평가</div>
                                </div>
                                
                                <!-- 학생 리스트 반복 -->
                                <c:forEach var="student" items="${student_list}">
	                                <div class="d-flex flex flex-wrap justify-content-start align-content-start w-100">
	                                
	                                	<!-- 이름 -->
	                                    <div class="tableCellValue d-flex justify-content-center" style="width: 120px;">          
	                                        <div class="align-content-center">${student.user_name}</div>
	                                    </div>
	                                    
	                                    <!-- 제출 상태 -->
	                                    <div class="tableCellValue d-flex justify-content-between flex-grow-1">
	                                        <div style="width: 48px;"></div>
	                                        <div class="align-content-center">
	                                        	<c:choose>
								                    <c:when test="${student.report_no ne null}">
								                        제출 완료
								                    </c:when>
								                    <c:otherwise>
								                        제출 미완료
								                    </c:otherwise>
												</c:choose>
	                                        </div>
	                                        
	                                        <!-- 제출/수정 버튼 -->
	                                        <div style="width: 70px;">
		                                        <c:if test="${student.id == id}">
									                <c:choose>
									                    <c:when test="${student.report_no ne null}">
									                        <a href="<c:url value='/student/assign/${assign.assign_no}/report/${student.report_no}/modify'/>" class="darkBtn btn">수정</a>
									                    </c:when>
									                    <c:otherwise>
									                        <a href="<c:url value='/student/assign/${assign.assign_no}/report/submit'/>" class="darkBtn btn">제출</a>
									                    </c:otherwise>
									                </c:choose>
									     	    </c:if>
								            </div>
	                                    </div>
	                                    
	                                    <!-- 과제 확인 -->
	                                    <div class="tableCellValue d-flex justify-content-center" style="min-width: 100px;">
										    <a href="javascript:void(0);" class="darkBtn btn"
										       onclick="     
										               if ('${student.report_no}' === '' || '${student.report_no}' === 'null') {
										                   alert('제출한 과제물이 없습니다.');
										               } else {
										                   // 제출한 과제물이 있으면 페이지 이동
										                   window.location.href = '<c:url value='/student/assign/${assign.assign_no}/report/${student.report_no}'/>';
										               }
										           }
										       ">
										       확인
										    </a>
										</div>
	                                    
	                                    <!-- 평가 -->
	                                    <div class="tableCellValue d-flex justify-content-between" style="min-width: 175px;">
	                                        <div style="width: 48px;"></div>
	                                        <div class="align-content-center">
												<c:out value="${student.score != null ? student.score : '--'}"/>
											</div>
	                                        <div style="width: 48px;"></div>
	                                    </div>
	                                </div>
                                </c:forEach>
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
                        
							<!-- 질문하기 버튼 -->                        
                            <div class="d-flex justify-content-end my-1 w-100">
                                <div class="align-content-center">
                                    <button class="darkBtn p-1" 
                                        data-bs-toggle="collapse" data-bs-target="#questionWrite" aria-expanded="false" aria-controls="questionWrite">
                                        질문하기
                                    </button>
                                </div>
                            </div>
                            <div id="tableQnAList" class="tableCased d-flex flex-wrap justify-content-start align-content-start my-1 w-100">
                                 <!-- 질문 입력 폼 -->
                                <div id="questionWrite" class="collapse" style="width: 100%; margin-left: -10px">
                                    <form class="d-flex justify-content-start align-content-start w-100 m-0 p-0"
                                    	action="<c:url value='/student/assign/${assign.assign_no}/quest/add'/>" method="post"	>
                                        <div class="miniIcon d-flex justify-content-center m-1"></div>
                                        <div class="d-flex justify-content-center m-1">
                                            <img src="../../resources/img/profile.png" class="miniIcon">
                                        </div>
                                        <div class="d-flex justify-content-center m-2"><div class="textWideTitle align-content-center">Q . ${login.user_name} : </div></div>
                                        <input name="quest_note" class="flex-grow-1" style="border-style: none;" type="text" placeholder="질문을 입력하세요."
               								required oninvalid="this.setCustomValidity('질문 내용을 입력해주세요.')" oninput="this.setCustomValidity('')">
                                        <input type="submit" class="clearBtn d-flex justify-content-center" style="min-width: 30px; font-size: 0.8em;" value="완료">
                                        <input type="button" class="clearBtn d-flex justify-content-center" style="min-width: 30px; font-size: 0.8em;"
                                       		value="취소" onclick="$('#questionWrite').collapse('hide')">
                                    </form>
                                </div>
                                
                                <!-- 질문/답변 반복 -->
                                <c:forEach var="q" items="${quest}">
	                                <div id="question${q.quest_no}" class="d-flex flex-wrap justify-content-start align-content-start w-100 m-0 p-0">
	                                
	                                	<!-- 질문 버튼 -->
	                                    <button class="clearBtn d-flex flex-wrap flex-grow-1 p-0"
	                                        data-bs-toggle="collapse" data-bs-target="#answer${q.quest_no}" aria-expanded="false" aria-controls="answer${q.quest_no}">
	                                        
	                                        <div class="d-flex justify-content-center m-1" style="width: 40px; height: 24px;">
	                                        	<c:if test="${answer[q.quest_no] != null}">
										        		<img src="<c:url value='/resources/img/check2.svg'/>" class="miniIcon">
										    	</c:if>
										    </div>
										    
										    <!-- 질문 내용 -->
	                                        <div class="d-flex justify-content-center m-1">
	                                            <img src="<c:url value="/resources/img/profile.png"/>" class="miniIcon">
	                                        </div>
	                                        <div class="d-flex justify-content-center m-2"><div class="textWideTitle align-content-center">Q . ${q.user_name} : </div></div>
	                                        <div class="d-flex justify-content-start flex-grow-1">
	                                        	<div class="align-content-center questionText">${q.quest_note}</div>
	                                        	<input type="text" class="questionInput form-control"
            										 value="${q.quest_note}" style="display:none; width:100%;">
	                                        </div>
	                                    </button>
	                                    
	                                    <!-- 작성자만 보이는 버튼 -->
	                                    <!-- 기본 버튼: 수정, 삭제 -->
                                    	<c:if test="${q.id eq login.id}">
		                                    <div class="d-flex flex-row ms-2 align-items-center">
		                                        <input type="button" class="clearBtn editBtn" style="min-width: 30px; font-size:0.8em;" value="수정">
		                                        <input type="button" class="clearBtn removeBtn" style="min-width: 30px; font-size:0.8em;" value="삭제">
		                                        <input type="button" class="clearBtn saveBtn" style="min-width: 30px; font-size:0.8em; display:none;" value="완료">
		                                        <input type="button" class="clearBtn cancelBtn" style="min-width: 30px; font-size:0.8em; display:none;" value="취소">
		                                    </div>
		                                </c:if>
	                                </div>
	                                
	                                <!-- 답변 영역 -->
	                                <c:if test="${answer[q.quest_no] != null}">
		                                <div id="answer${q.quest_no}" class="collapse" style="width: 100%; margin-left: 30px">
		                                    <div id="" class="d-flex justify-content-start align-content-start w-100 m-0 p-0">
		                                        <div class="miniIcon d-flex justify-content-center m-1"></div>
		                                        <div class="d-flex justify-content-center m-1">
		                                            <img src="<c:url value="/resources/img/profile.png"/>" class="miniIcon">
		                                        </div>
		                                        <div class="d-flex justify-content-center m-2"><div class="textWideTitle align-content-center">A . ${answer[q.quest_no].user_name} : </div></div>
		                                        <div class="d-flex justify-content-start flex-grow-1">
		                                            <div class="align-content-center">${answer[q.quest_no].answer_note}</div>
		                                        </div>
		                                    </div>
		                                </div>
		                        	</c:if>
	                        	</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- QnA list end -->
            <script>
			$(document).ready(function() {
			
			    // 수정 버튼 클릭 시
			    $("#editBtn").click(function() {
			        // input들 편집 가능하게
			        $("#formAssignPostedInfo input").prop("readonly", false).css("border-style", "solid");
			        
			        // 버튼 전환
			        $("#editBtn").hide();
			        $("#saveBtn").show();
			    });
			
			    // 저장 버튼 클릭 시
			    $("#saveBtn").click(function() {
			        const updatedData = {
			            assign_name: $("#assignName").val(),
			            assign_method: $("#assignMethod").val(),
			            end_date: $("#endDate").val(),
			            assign_note: $("#assignNote").val()
			        };
			
			        // AJAX로 서버에 전송
			        $.ajax({
			            type: "POST",
			            url: "<c:url value='/teacher/updateAssignment'/>",  // 실제 컨트롤러 URL에 맞게 변경
			            contentType: "application/json",
			            data: JSON.stringify(updatedData),
			            success: function() {
			                alert("수정 완료!");
			                $("#formAssignPostedInfo input").prop("readonly", true).css("border-style", "none");
			                $("#saveBtn").hide();
			                $("#editBtn").show();
			            },
			            error: function() {
			                alert("수정 중 오류가 발생했습니다.");
			            }
			        });
			    });
			});
			</script>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>