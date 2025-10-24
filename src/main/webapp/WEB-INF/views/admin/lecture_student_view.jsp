<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/head_admin.jsp" %>

<div style="margin: 230px 0px 0px 80px;">
	<h3 id="title">
		<div id="panelContent" class="p-5">
		<div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
		<div id="" class="decoWideTitle" style="width: 12px;"></div>
		&nbsp;&nbsp;
			<b style="vertical-align: middle;">[${lectureVO.lecture_name}] 
			<br>수강생 목록 [${lectureVO.cnt}명 / ${lectureVO.cap}명]</b>
	</h3>
</div>

<div style="margin-left: 120px;">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>No.</th>
                <th>ID</th>
                <th>이름</th>
                <th>성별</th>
                <th>이메일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${studentsInLecture}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${student.id}</td>
                    <td>${student.user_name}</td>
                    <td>${student.gender}</td>
                    <td>${student.email}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty studentsInLecture}">
                <tr><td colspan="5">현재 강의를 수강하는 학생이 없습니다.</td></tr>
            </c:if>
        </tbody>
    </table>

    <a href="${pageContext.request.contextPath}/admin/lecture_management" class="btn btn-secondary">목록으로</a>
</div>


<%@ include file="../include/tail.jsp"%>