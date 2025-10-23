<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_teacher.jsp" %>

<script>
    $(document).ready(function(){
        // 추가 버튼 클릭 -> 입력폼 보여주기
        $("#create").click(function(){
            $(".create_table").show();
        });
    });
</script>

<div style="padding: 80px 130px; text-align: center;">
    <h3 style="text-align: left; width: 500px;">
        <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
            <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
            <b>과제 조회</b>
        </div>
    </h3>
    <br>

    <!-- 강의 버튼 -->
    <div style="line-height: 5px; width: 1310px; text-align: left;">
        <c:forEach var="lecture" items="${lectureList}">
 <a href="<c:url value='/teacher/assignment_list/${lecture.lecture_no}'/>"
       class="btn tea-lecture ${selectedLectureNo == lecture.lecture_no ? 'btn-outline-primary' : 'btn-outline-secondary'}">
       ${lecture.lecture_name}
    </a>


        </c:forEach>
    </div>

    <br><br>

    <!-- 과제 목록 -->
    <table style="width: 1310px; font-size: 20px; border-collapse: collapse;">
        <tr class="tea-tr" style="background-color: #c2dcff;">
            <th class="tea-th" style="padding: 10px; border: 1px solid #999;">번호</th>
            <th class="tea-th" style="padding: 10px; border: 1px solid #999;">주차</th>
            <th class="tea-th" style="padding: 10px; border: 1px solid #999;">과제명</th>
            <th class="tea-th" style="padding: 10px; border: 1px solid #999;">제출 기한</th>
        </tr>
        <c:forEach var="assign" items="${assignmentList}">
            <tr class="tea-tr">
                <td class="tea-td" style="padding: 8px; border: 1px solid #999;">${assign.assign_no}</td>
                
                
                <td class="tea-td" style="padding: 8px; border: 1px solid #999;">
                    <c:out value="${assign.assign_name.split(' ')[0]}" />
                </td>
                
                
                
                <td class="tea-td" style="padding: 8px; border: 1px solid #999;">
                    <a href="<c:url value="/teacher/assignment_view/${assign.assign_no}"/>">
                        ${assign.assign_name}
                    </a>
                </td>
                <td class="tea-td" style="padding: 8px; border: 1px solid #999; color:red;">
                    ${assign.end_date}
                </td>
            </tr>
            
        </c:forEach>
    </table>

    <br>
    
    
    
    
   
        <div style="line-height: 5px; width: 1310px; text-align: left;">

    <!-- 추가 버튼 + 입력폼 -->
    <button type="button" id="create" class="btn tea-lecture btn-outline-primary" >추가</button>

    <form id="addAssignmentForm" method="post" action="/control/teacher/assignment_add">
        <input type="hidden" name="lecture_no" value="${selectedLectureNo}">
        <table class="create_table" style="width: 1310px; font-size: 20px; display: none; margin-top: 10px;">
            <tr class="tea-tr" style="background-color: #c2dcff;">
                <th class="tea-th">주차</th>
                <th class="tea-th">과제명</th>
                <th class="tea-th">제출 기한</th>
            </tr>
            <tr class="tea-tr">
                <td class="tea-td"><input type="text" name="week" placeholder="예: 4주차"></td>
                <td class="tea-td"><input type="text" name="assign_name" placeholder="과제명"></td>
                <td class="tea-td"><input type="datetime-local" name="end_date"></td>
            </tr>
        </table>
        <br>
        <button type="submit" class="btn tea-lecture btn-outline-secondary create_table" style="float: left;">저장</button>
    </form>
    </div>
    
    

    <!-- 추가 버튼 + 입력폼 -->


</div>

<%@ include file="../include/tail.jsp" %>
