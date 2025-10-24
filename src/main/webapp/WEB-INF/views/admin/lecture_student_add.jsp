<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/head_admin.jsp" %>

<div style="margin: 230px 0px 0px 80px;">
	<h3 id="title">
		<div id="panelContent" class="p-5">
		<div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
		<div id="" class="decoWideTitle" style="width: 12px;"></div>
		&nbsp;&nbsp;
			<b style="vertical-align: middle;">[${lectureVO.lecture_name}] 학생 추가</b>
	</h3>
</div>

<div style="margin-left: 120px;">
    <form action="${pageContext.request.contextPath}/admin/lecture_student_ok" method="post">
        <input type="hidden" name="lectureNo" value="${lectureVO.lecture_no}">
        
        <button type="submit" class="btn btn-primary">선택 학생 추가</button>
        <a href="${pageContext.request.contextPath}/admin/lecture_management" class="btn btn-secondary">목록으로</a>
        <br><br>
        
        <table class="table" style="width: 880px; font-size: 15px;">
            <thead>
                <tr>
                    <th style="width: 10px; background-color: rgb(240, 240, 240);"></th>
                    <th style="background-color: rgb(240, 240, 240);">ID</th>
                    <th style="background-color: rgb(240, 240, 240);">이름</th>
                    <th style="background-color: rgb(240, 240, 240);">성별</th>
                    <th style="background-color: rgb(240, 240, 240);">이메일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${studentList}">
                    <tr>
                        <td><input type="checkbox" name="studentIds" value="${student.id}"></td>
                        <td>${student.id}</td>
                        <td>${student.user_name}</td>
                        <td>${student.gender}</td>
                        <td>${student.email}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty studentList}">
                    <tr><td colspan="5">현재 추가 가능한 학생이 없습니다.</td></tr>
                </c:if>
            </tbody>
        </table>

        
    </form>
</div>

<%@ include file="../include/tail.jsp"%>