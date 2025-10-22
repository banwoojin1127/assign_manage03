<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_admin.jsp" %>
<!-- content field start -->
        <div id="body">
            <h3 id="title">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>사용자 관리</b>
            </h3>
            <div class="d-flex mb-3" style="width: 1410px; text-align: right;">
                
                <button type="button" class="btn btn-primary ms-auto" style="width:95x; margin-right: 10px ;"
                    onclick="location.href='teacher_signup'">
                    교사 등록
                </button>
            </div>
            
            <div class="d-flex mb-3"> 
		       <form class="d-flex align-items-center gap-2">
		           <div style="width: 115px;">
		               <select class="form-select" aria-label="Small select example">
		                   <option value="all" selected>전체</option>
		                   <option value="class" value="class">등급</option>
		                   <option value="id" value="id">아이디</option>
		                   <option value="user_name" value="user_name">이름</option>
		                   <option value="gender" value="gender">성별</option>                      
		               </select>
		           </div>
		           
		           <div style="width: 220px;">
		               <label class="visually-hidden" for="inlineFormInputGroupUsername" onclick="">검색</label>
		               <div class="input-group">
		                   <input type="text" class="form-control" id="inlineFormInputGroupUsername"
		                       placeholder="검색어를 입력해주세요.">
		               </div>
		           </div>
		           
		           <div>
		               <button type="submit" class="btn btn-primary">검색</button>
		           </div>
		      </form>
		      		<div class="d-flex mb-3 d-flex align-items-center gap-2">
		        <div>
		            <form class="right-align1"> 
			            <select class="form-select form-select-sm" aria-label="Small select example">
			                 <option value="asc" selected>번호(오름차순)</option>
			                 <option>번호(내림차순)</option>
			                 <option>등급순(높은순)</option>
			                 <option>등급순(낮은순)</option>
			                 <option>생년월일(오름차순)</option>
			                 <option>생년월일(내림차순)</option>
			                 <option>이름(오름차순)</option>
			                 <option>이름(내림차순)</option>
			                 <option>아이디(오름차순)</option>
			                 <option>아이디(내림차순)</option>
	            		</select>
		            </form>
		        </div>    
	       
		        <div>
		         <select class="right-align2 form-select form-select-sm" aria-label="Small select example">
		             <option value="10" selected>10개씩</option>
		             <option value="20">20개씩</option>
		             <option value="50">50개씩</option>
		         </select>
		        </div>
	  	 	</div>
		      
		      
			</div>
			
			

			<div style="vertical-align:middle;">
	            <table id="user-list" class="table table-bordered table-hover" style="width: 1405px;">
	                <thead  class="table-light">
	                    <tr>
	                        <th scope="col" class="" style="vertical-align:middle;">번호</th>
	                        <th class="">등급</th>
	                        <th class="">아이디</th>
	                        <th class="">이름</th>
	                        <th class="">성별</th>
	                        <th class="">생년월일</th>
	                        <th class="">전화번호</th>
	                        <th class="">이메일</th>
	                    </tr>
	                </thead>
	                
	                <tbody>
	                	<c:forEach var="user" items="${userList}" varStatus="status">
		                    <tr>
		                        <th scope="row">${status.count}</th>
		                        <td>${user.user_class}</td>
		                        <%-- ${user.user_class_name} -> VO_User의 get_user_class_name() --%>
		                        <td>${user.id}</td>
		                        <td>${user.user_name}</td>
		                        <td>${user.gender}</td>
		                        <td>${user.birth}</td>
		                        <td>${user.tel}</td>
		                        <td>${user.email}</td>
		                    </tr>
	                   </c:forEach>
	                </tbody>
	            </table>
       		 </div>
        <nav aria-label="Page navigation example" id="page">
            <ul class="pagination justify-content-center ">
                <li class="page-item disabled">
                    <a class="page-link">&lt;</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">&gt;</a>
                </li>
            </ul>
        </nav>
        <br><br>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>