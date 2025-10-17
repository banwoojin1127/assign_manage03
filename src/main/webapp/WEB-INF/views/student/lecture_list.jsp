<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <div style="padding: 80px 130px; text-align: center;">
            <h3 style="text-align: left; width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>강의 조회</b>
            </h3>
            <br>
            <div class="d-flex mb-3" style="width: 1410px;"> 
                <div class="me-auto p-2">    
                    <form class="row row-cols-lg-auto g-3 align-items-center" style="margin-left: -15px;">
                        <div class="col-12" style="width: 115px;">
                            <select class="form-select" aria-label="Small select example" name="type">
                                <option value="전체" ${search.type == '전체' ? 'selected' : ''}>전체</option>
                                <option value="강의명" ${search.type == '전체' ? 'selected' : ''}>강의명</option>
                                <option value="교사명" ${search.type == '전체' ? 'selected' : ''}>교사명</option>                    
                            </select>
                        </div>
                        <div class="col-12" style="width: 220px;">
                            <label class="visually-hidden" for="inlineFormInputGroupUsername">Username</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="inlineFormInputGroupUsername"
                                    placeholder="검색어" value="${search.keyword != null ? search.keyword : ''}">
                            </div>
                        </div>
                        <div class="col-12" style="width: 75px;">
                            <button type="submit" class="btn btn-primary">검색</button>
                        </div>
                    </form>
                </div>
                <div class="p-2">
                    <form> 
                        <div class="col-12">
                            <select class="form-select form-select-sm" name="sort" aria-label="Small select example"
                            onchange="this.form.submit()">
                                <option value="no_asc">번호(오름차순)</option>
		                        <option value="no_desc">번호(내림차순)</option>
		                        <option value="start_asc">시작일(오름차순)</option>
		                        <option value="start_desc">시작일(내림차순)</option>
		                        <option value="end_asc">종료일(오름차순)</option>
		                        <option value="end_desc">종료일(내림차순)</option>
                            </select>
                        </div>
                    </form>
                </div>    
                <div class="p-2">
                    <div class="col-12">
                        <select class="form-select form-select-sm" name="limitno" aria-label="Small select example" onchange="this.form.submit()">
	                        <option value="10" ${search.limitno == 10 ? 'selected' : ''}>10개씩</option>
	                        <option value="20" ${search.limitno == 20 ? 'selected' : ''}>20개씩</option>
	                        <option value="30" ${search.limitno == 30 ? 'selected' : ''}>30개씩</option>
	                    </select>
                    </div>
                </div>
            </div>

            <table id="user-list" class="table table-bordered table-hover" style="width: 1405px;">
                <thead class="table-light">
                    <tr>
                        <th scope="col" class="table-primary">번호</th>
                        <th class="table-primary">강의명</th>
                        <th class="table-primary">교사명</th>
                        <th class="table-primary">시작일</th>
                        <th class="table-primary">종료일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="lec" items="${list}" varStatus="status">
		                <tr>
		                    <td>${status.count + ((search.pageno - 1) * search.limitno)}</td>
		                    <td>${lec.lecture_name}</td>
		                    <td>${lec.teacher_name}</td>
		                    <td>${lec.start_date}</td>
		                    <td>${lec.end_date}</td>
		                </tr>
		            </c:forEach>
		            <c:if test="${empty list}">
		                <tr>
		                    <td colspan="5">조회된 강의가 없습니다.</td>
		                </tr>
		            </c:if>
                </tbody>
            </table>
        </div>
        <nav aria-label="Page navigation example" style="margin-top: -40px; width: 1600px;">
		    <ul class="pagination justify-content-center">
		        <li class="page-item ${search.pageno == 0 ? 'disabled' : ''}">
		            <a class="page-link" href="?page=${search.pageno - 1 >= 0 ? search.pageno - 1 : 0}&type=${search.type}&keyword=${search.keyword}&limitno=${search.limitno}">&lt;</a>
		        </li>
		        <c:forEach var="i" begin="${startbk}" end="${endbk}">
		            <li class="page-item ${i == search.pageno ? 'active' : ''}">
		                <a class="page-link" href="?page=${i}&type=${search.type}&keyword=${search.keyword}&limitno=${search.limitno}">${i + 1}</a>
		            </li>
		        </c:forEach>
		        <li class="page-item ${search.pageno == maxpage - 1 ? 'disabled' : ''}">
		            <a class="page-link" href="?page=${search.pageno + 1 < maxpage ? search.pageno + 1 : maxpage - 1}&type=${search.type}&keyword=${search.keyword}&limitno=${search.limitno}">&gt;</a>
		        </li>
		    </ul>
		</nav>
        <br><br>
        <!-- content field end -->
<%@ include file="../include/tail.jsp" %>