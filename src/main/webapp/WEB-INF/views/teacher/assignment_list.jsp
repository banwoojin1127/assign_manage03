<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_teacher.jsp" %>

<script>
    $(document).ready(function(){
    	// 초기에는 추가 버튼, 저장/취소 버튼, 폼 모두 숨김
    	$("#create, #save, #cancel, .create_table").hide();

        // 강의 버튼 클릭 시 (lecture-button-container 내부의 버튼)
        $(".lecture-button-container button").click(function(){
            $("#create").show(); // 강의 선택 시 추가 버튼 표시
            $(".create_table").hide();
            $("#save, #cancel").hide();
        });
    	
        // 추가 버튼 클릭 -> 입력폼 보여주기
        $("#create").click(function(){
            $(".create_table").show();
            $("#create").hide();
            $("#save, #cancel").show();
        });
        
     	// 취소 버튼 클릭 -> 입력폼 및 저장/취소 버튼 숨기기
        $("#cancel").click(function(){
            $(".create_table").hide();
            $("#save, #cancel").hide();
            $("#create").show();
            // 입력 내용 초기화
            $("#addAssignmentForm")[0].reset();
        });
    });
</script>
<c:if test="${not empty lecture_no}">
    <script>
        $(function() {
            $("#create").show();
        });
    </script>
</c:if>

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
				    		onclick="location.href='<c:url value="/teacher/assign/list/${entry.key}"/>'">
			            	${entry.value}
		            	</button>
				</c:forEach>
			</div>
		    
            <br><br>
            
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
		                    <a href="<c:url value="/teacher/assign/${assign.assign_no}"/>">
		                        ${assign.assign_name}
		                    </a>
		                </td>
		                <td>${assign.end_date}</td>
		            </tr>
		        </c:forEach>
            </table>
            <!-- 추가 버튼 + 입력폼 -->
            <div style="width: 1260px; display: flex; justify-content: flex-end; margin-top: 20px; margin-left: 50px">
		    	<button type="button" id="create" class="btn tea-lecture btn-outline-primary" style="float: left; display:none;">추가</button>
	    	</div>
		
		    <form id="addAssignmentForm" method="post" action="<c:url value='/teacher/assign/add'/>">
		        <input type="hidden" name="lecture_no" value="${lecture_no}">
		        <table class="create_table" style="width: 1310px; font-size: 20px; display: none; margin-top: 10px;">
		            <tr class="tea-tr" style="background-color: #c2dcff;">
		                <th class="tea-th">과제명</th>
		                <th class="tea-th">제출 기한</th>
		            </tr>
		            <tr class="tea-tr">
		                <td class="tea-td"><input type="text" name="assign_name" placeholder="과제명"></td>
		                <td class="tea-td"><input type="datetime-local" name="end_date"></td>
		            </tr>
		        </table>
		        <div class="create_table" style="display: none; margin-top: 10px; margin-right: 78px; text-align: right;">
		            <button type="submit" id="save" class="btn tea-lecture btn-outline-secondary">저장</button>
		            <button type="button" id="cancel" class="btn btn-outline-danger">취소</button>
		        </div>
		    </form>
        </div>

    <br>
    
    


<%@ include file="../include/tail.jsp" %>
