<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <script>
        $(document).ready(function(){
            $(".lectureArrow").click(function(){
                const arrow = $(this);
                const listId = arrow.data("target");
                const src1 = "<c:url value='/resources/img/arrow1.png'/>";
                const src2 = "<c:url value='/resources/img/arrow2.png'/>";

                // 화살표 방향 토글
                if (arrow.attr("src") === src1) {
                    arrow.attr("src", src2);
                } else {
                    arrow.attr("src", src1);
                }

                // 해당 강의 리스트 슬라이드 토글
                $("#" + listId).slideToggle();
            });
        });
        </script>
        <div style="padding: 50px; float: left; text-align: center; width: 1649px;">
            <br><br><br>
            <form style="margin: 0px 350px; font-size: 23px;">
            
            <!-- 학생 이름과 미제출 과제 개수 -->
                <c:choose>
		            <c:when test="${not empty list}">
		                <div class="mainText" style="border: 2px solid #c2dcff; padding: 20px 50px 20px 0px;">
		                    <img src="<c:url value='/resources/img/folder.png'/>" style="width: 90px;">&nbsp;&nbsp;
		                    <b>이젠계정</b> 님이 아직 제출하지 않은 과제가 
		                    <b>${list.size()}개</b> 있습니다.
		                </div>
		            </c:when>
		            <c:otherwise>
		                <div class="mainText" style="border: 2px solid #c2dcff; padding: 20px 50px 20px 0px;">
		                    <img src="<c:url value='/resources/img/folder.png'/>" style="width: 90px;">&nbsp;&nbsp;
		                    <b>이젠계정</b> 님이 아직 제출하지 않은 과제가 없습니다.
		                </div>
		            </c:otherwise>
		        </c:choose>
                <br>
                
                <!-- 과제 리스트 -->
		        <c:forEach var="main" items="${list}">
		            <div class="mainText lectureList">
		                <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
		                    <div style="text-align: left; margin-top: 15px;">
		                        <b>&nbsp;&nbsp;${main.lecture_name}</b>
		                    </div>
		                    <div style="text-align: right;">
		                        <img 
		                            class="lectureArrow" 
		                            data-target="lectureListView${main.assign_no}"
		                            src="<c:url value='/resources/img/${main.days_left <= 5 ? "arrow2.png" : "arrow1.png"}'/>" 
		                            style="width: 80px; cursor:pointer;">
		                    </div>
		                </div>
		
		                <!-- 클릭 시 열리는 과제 상세 영역 -->
		                <a href="<c:url value='/student/assign/${main.assign_no}'/>" class="lectureLink">
		                    <div id="lectureListView${main.assign_no}" class="mainText lectureListView"
		                    style="display: ${main.days_left <= 5 ? 'block' : 'none'};">
		                        <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
		                            <div style="text-align: left;"><b>${main.assign_no}</b></div>
		                            <br><br>
		                            <div style="text-align: left;">${main.teacher_name} 강사님</div>
		                            <div style="text-align: right;">
		                                <b>남은 기한</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                <span class="${main.days_left <= 5 ? 'endDate' : ''}">
		                                	${main.days_left}일 남았습니다.
		                                </span>
		                            </div>
		                        </div>
		                    </div>
		                </a>
		            </div>
		            <br>
		        </c:forEach>

		        <!-- 미제출 과제가 없을 경우 -->
		        <c:if test="${empty list}">
		            <div class="mainText" style="padding: 30px;">
		                제출하지 않은 과제가 없습니다.
		            </div>
		        </c:if>
            </form>
        </div>
<%@ include file="../include/tail.jsp" %>