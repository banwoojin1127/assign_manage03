<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/head_teacher.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- content field start -->
<script>
    // 기존 DeleteLecture() 함수는 제거하거나 사용하지 않도록 합니다.

    // 페이지 로드 시 URL 파라미터 확인
    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        const deleteSuccess = urlParams.get('deleteSuccess');
        
        if (deleteSuccess === 'true') {
            alert("강의가 성공적으로 삭제 처리되었습니다.");
        } else if (deleteSuccess === 'false') {
            alert("강의 삭제 중 오류가 발생했습니다.");
        }
        
        // 메시지 표시 후 URL에서 파라미터 제거 (선택 사항, 깔끔한 URL 유지를 위해)
        if (deleteSuccess) {
             history.replaceState(null, null, location.pathname + location.search.replace(/&deleteSuccess=[^&]+/, '').replace(/\?deleteSuccess=[^&]+&?/, '?'));
        }
    }
    
    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        const registerSuccess = urlParams.get('registerSuccess');
        const message = urlParams.get('msg');
        
        /* if (registerSuccess === 'true') {
            // Confirm 창 요청 반영: 메시지를 사용자에게 보여줍니다.
            if (confirm(message + "\n확인을 누르면 목록이 초록색으로 바뀝니다.")) {
                // 입력 완료하면 초록색으로 바꾸기 요청 반영
                document.getElementById('formLoginTitle').style.backgroundColor = '#e6ffe6'; // 예시: 제목 영역을 초록색으로
                document.body.style.backgroundColor = '#f0fff0'; // 예시: 배경 전체를 연한 초록색으로
            }
        } else if (registerSuccess === 'false') {
            alert("강의 등록 중 오류가 발생했습니다. (교수 이름, 데이터 형식 등 확인)");
        } */
        
        // 메시지 표시 후 URL에서 파라미터 제거 (선택 사항)
        /* if (registerSuccess) {
             // URL 정리
             history.replaceState(null, null, location.pathname);
        } */
        
        // ... (기존 삭제 관련 스크립트도 여기에 유지) ...
    }
</script>
<div style="padding: 80px 100px; text-align: center;">
	<h3 style="text-align: left; width: 500px;">
		<div id="formLoginTitle"
			class="d-flex flex-wrap align-content-start my-3"
			style="width: 100%;">
			<div id="" class="decoWideTitle" style="width: 12px;"></div>
			&nbsp;&nbsp; <b>강의 관리</b>
	</h3>
		<br>
		<div style="text-align: center; class="mb-3 d-flex justify-content-end">
		    <form action="lecture_management" method="get" class="d-flex">
		        <input type="text" name="keyword" class="form-control me-2" style="width: 250px; float: left;" placeholder="강의명" value="${keyword}">
		        <button type="submit" class="btn btn-primary ms-2">검색</button>
		        <a href="lecture_management" class="btn btn-outline-secondary ms-2">전체 목록</a>
		    </form>
		</div>

		<div style="height: 20px;"></div>
		<form>
    <button onclick="document.location='<c:url value='/teacher/lecture_register'/>'"
            type="button" class="d-flex btn btn-primary" id="btnRegister" style="margin-left: 950px; width: 100px; text-align: center;">
        강의 등록
    </button>
</form>
		<div style="height: 20px;"></div>

		<table id="class_content">		
			<thead>
				<tr style="height: 40px;">
					<th class="tea-th thwidth1">번호
					</th>
					<th class="tea-th thwidth2">강의명
					</th>
					<th class="tea-th thwidth2">교사명
					</th>
					<th class="tea-th thwidth3" style="width:100px;">정원
					</th>
					<th class="tea-th thwidth3">시작일
					</th>
					<th class="tea-th thwidth3">종료일
					</th>
					<th class="edit_th" ></th>
				</tr>
			</thead>
		
		<%-- <tr>
				<!-- 체크 박스 네임 지정 -->
				<td class="tea-td"><input type="checkbox" name="check"></td>
				<td class="tea-td">1</td>
				<td class="tea-td"><a href="../teacher/assignment_list"
					style="width: 100%; height: 100%; text-decoration: none;">${lecture.lecture_name}</a></td>
				<td class="tea-td">${lecture.user_name}</td>
				<td class="tea-td"" data-ref="http://localhost:8080/control/admin/user_management">29/35
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#addStudentModal">추가</button>
				</td>
				<td class="tea-td">${lecture.start_date}</td>
				<td class="tea-td">${lecture.end_date}</td>
				<td id="edit_td"><button class="edit" onclick="edit(this)">✏️</button></td>
			</tr> --%>

			<tbody class="saveAdd">
				<c:forEach var="lecture" items="${lectureList}" varStatus="status">
					<tr>
				 	<!-- 이후 추가되는 데이터가 여기에 들어갈 것입니다. -->
				 		<td>${status.count}</td>
				 		<td><a style="text-decoration-line: none; color:black;" href="../teacher/assignment_list/${lecture.lecture_no}">${lecture.lecture_name}</a></td>
				 		<td>${lecture.user_name}</td>
				 		<td>
					 		<a style="text-decoration-line: none; color:black;" href="${pageContext.request.contextPath}/teacher/lecture_student_view?no=${lecture.lecture_no}">
					 		${lecture.cnt}/${lecture.cap}
					 		</a>
				 		</td>
				 		<td>${lecture.start_date}</td>
				 		<td>${lecture.end_date}</td>
				 		<td>
						   <button onclick="document.location='<c:url value='/teacher/lecture_register/${lecture.lecture_no}'/>'" type="button" class="btn btn-primary">
                    			수정
						    </button>
				 			<button onclick="if(confirm('강의를 삭제하시겠습니까?')) { document.location='<c:url value='/teacher/lecture_delete?no=${lecture.lecture_no}'/>' }" type="button" class="btn btn-danger">
                    			삭제
                			</button>
                    				
				 			<button onclick="document.location='<c:url value='/teacher/lecture_student_add?no=${lecture.lecture_no}'/>'" type="button" class="btn btn-secondary">
			                    학생추가
			                </button>
				 		</td>
				 	</tr>
				</c:forEach>
			 </tbody>
		</table>
		
		<br><br>
		
		<p class="text-center">총 ${totalCount}개의 강의 중 ${startRow + 1} ~ ${startRow + lectureList.size()}번째 강의</p>

<div class="d-flex justify-content-center mt-4">
    <nav aria-label="Page navigation example" id="page">
        <ul class="pagination justify-content-center">
        
            <c:if test="${startPage > pageBlock}">
                <li class="page-item">
                    <a class="page-link" href="lecture_management?pageNum=${startPage - pageBlock}&keyword=${keyword}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${pageNum > 1}">
                <li class="page-item">
                    <a class="page-link" href="lecture_management?pageNum=${pageNum - 1}&keyword=${keyword}" aria-label="Previous">
                        <span aria-hidden="true">&lt;</span>
                    </a>
                </li>
            </c:if>

            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <li class="page-item ${i == pageNum ? 'active' : ''}">
                    <a class="page-link" href="lecture_management?pageNum=${i}&keyword=${keyword}">${i}</a>
                </li>
            </c:forEach>

            <c:if test="${pageNum < totalPage}">
                <li class="page-item">
                    <a class="page-link" href="lecture_management?pageNum=${pageNum + 1}&keyword=${keyword}" aria-label="Next">
                        <span aria-hidden="true">&gt;</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${endPage < totalPage}">
                <li class="page-item">
                    <a class="page-link" href="lecture_management?pageNum=${startPage + pageBlock}&keyword=${keyword}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </nav>
</div>
		
	</div>
	<!-- content field end -->
</div>

<%@ include file="../include/tail.jsp"%>
