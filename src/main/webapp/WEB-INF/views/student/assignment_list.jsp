<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <div style="padding: 80px 130px; text-align: center;">
            <h3 style="text-align: left; width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>과제 조회</b>
            </h3>
            <br>
            
            <!-- 강의 버튼 -->
            <div class="lecture-button-container" style="display: flex; flex-wrap: wrap; gap: 10px;">
	             <c:forEach var="entry" items="${lectureMap}">
			    		<button type="submit" class="btn lectureText btn-outline-secondary
				    		<c:if test='${lecture_no == entry.key}'> active</c:if>'"
				    		onclick="location.href='<c:url value="/student/assign/list/${entry.key}"/>'">
			            	${entry.value}
		            	</button>
				</c:forEach>
			</div>
		    
            <br><br>
            
            <!-- 강의 정보 -->
            <c:if test="${not empty assignList and lecture_no != null}">
	            <div class="listMargin" id="teacherInfo1" th:if="${assignList != null and !assignList.isEmpty()}">
	                <img src="<c:url value="/resources/img/profile.png"/>" style="margin-left: 100px; width:250px; height:250px;">
	                <div id="teacherInfo2">
	                    <b id="lectureName" style="display: block; margin-top: 20px;">${assignList[0].lecture_name}</b>
	                    <div id="teacherName" style="margin-top: 10px;">담당 교사 : ${assignList[0].teacher_name}</div>
	                </div>
	            </div>
	            <br><br>
            </c:if>

			<!-- 과제 테이블 -->
            <table id="assignment-list" class="listMargin" style="width: 1260px; font-size: 20px;">
                <tr style="background-color: #c2dcff;">
                    <th style="width: 80px;">번호</td>
                    <th style="width: 300px">주차</td>
                    <th style="width: 1000px">과제명</td>
                    <th style="width: 400px;">제출 기한</td>
                </tr>
                
                <!-- 과제가 없을 경우 -->
                <c:if test="${empty assignList}">
		            <tr>
		                <td colspan="4">등록된 과제가 없습니다.</td>
		            </tr>
		        </c:if>
	
	            <!-- 과제 목록 반복 -->
	            <c:forEach var="assign" items="${assignList}" varStatus="stat">
		            <tr>
		                <td>${stat.index + 1}</td>
		                <td>${assign.week_no}주차</td>
		                <td>
		                    <a href="<c:url value="/student/assign/${assign.assign_no}"/>">
		                        ${assign.assign_name}
		                    </a>
		                </td>
		                <td>${assign.end_date}</td>
		            </tr>
		        </c:forEach>
            </table>
            <br><br>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>