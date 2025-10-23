<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <div class="d-flex flex-wrap justify-content-center align-content-start" style="padding: 50px;  padding-left: 75px; min-width: 689px;">
            <!-- content main title start -->
            <div id="" class="d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                &nbsp;&nbsp;
                <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1">
                    <p class="flex-grow-1 m-0" style="font-size: 1.5em;">과제 상세보기</p>
                </div>
            </div>
            <!-- content main title end -->
            <!-- assignment info box start -->
            <div class="boxCased d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div class="d-flex justify-content-between w-100">
                    <div><b>강의 : </b>${assign.lecture_name}</div>
                    <div><b>이름 : </b>${report.student_name}</div>
                </div>
                <div class="d-flex justify-content-between w-100">
                    <div><b>과제 : </b>${assign.assign_name}</div>
                    <div><b>담당 : </b>${assign.teacher_name}</div>
                </div>
            </div>
            <!-- assignment info box end -->
            <!-- submission write form start -->
            <div class="d-flex flex-wrap justify-content-center align-content-start my-3 w-100">
                <div id="" class="darkText d-flex flex-wrap justify-content-between align-content-center rounded px-1 w-100">
                    <p class="d-flex m-0 p-2" style="text-align: left;">제출 내용</p>
					<c:if test="${report.id == login.id and feedback == null}">
		                <a href="<c:url value='/student/assign/${assign.assign_no}/report/${report.report_no}/modify'/>" 
		                   class="whiteBtn btn d-flex flex-wrap align-content-center rounded my-1">수정</a>
		            </c:if>
                </div>
                <div id="submissionNote" name="" class="boxCased d-flex w-100">
                    ${report.report_note}
                </div>
            </div>
            <!-- submission write form end -->
            <!-- submission file form start -->
            <div class="darkText d-flex flex-wrap justify-content-start align-content-start rounded mt-3 w-100">
                <div class="d-flex flex-wrap align-content-center px-1">
                    <p class="m-0 p-2" style="text-align: left;">첨부 파일</p>
                </div>
            </div>
            <div class="boxCased d-flex flex-wrap justify-content-start align-content-center mb-3 w-100">
		        <c:choose>
		            <c:when test="${not empty fileList}">
		                <c:forEach var="file" items="${fileList}">
		                    <div class="d-flex justify-content-end" style="width: 100%; margin-bottom: 5px;">
			                    <a href="<c:url value='/student/assign/${assign.assign_no}/report/${report.report_no}/download/${file.file_no}'/>"
			                    	target="_blank">${file.f_name}</a>
			                </div>
		                </c:forEach>
		            </c:when>
		            <c:otherwise>
		                선택된 파일 없음
		            </c:otherwise>
		        </c:choose>
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
					        <c:out value="${feedback.score != null ? feedback.score : '--'}"/> / 100
					    </div>
					</div>
                </div>
                 <div class="boxCased d-flex align-content-center w-100">
		            <c:out value="${feedback.feedback != null ? feedback.feedback : '아직 피드백이 작성되지 않았습니다.'}"/>
		        </div>
            </div>
            <!-- feedback / score info box end-->
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>