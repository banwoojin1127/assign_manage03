<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/head_admin.jsp"%>
<!-- content field start -->
<div style="padding: 80px 100px; text-align: center;">
	<h3 style="text-align: left; width: 500px;">
		<div id="formLoginTitle"
			class="d-flex flex-wrap align-content-start my-3"
			style="width: 100%;">
			<div id="" class="decoWideTitle" style="width: 12px;"></div>
			&nbsp;&nbsp; <b>학생추가</b>
	</h3>

	<div style="text-align: center; margin: 5%;">
		<h4 style="text-align: left; width: 500px;"><B>강의명 : 웹 프로그래밍</B></h4>
		<div style="height: 40px;"></div>

		<table id="class_content">		
			<thead>
				<tr style="height: 40px;">
					<th class="tea-th thwidth1">번호
					</th>
					<th class="tea-th thwidth2">아이디
					</th>
					<th class="tea-th thwidth2">이름
					</th>
					<th class="tea-th thwidth3" style="width:100px;">성별
					</th>
					<th class="tea-th thwidth2" style="width:100px;">
					</th>					
				</tr>
			</thead>
			<tbody class="saveAdd">
				<tr>
			 		<td></td>
			 		<td>${user.id}</td>
			 		<td>${user.user_name}</td>
			 		<td>${user.gender}</td>
			 		<td>
			 			<button onclick="AddStudent('4','abcd')" type="button" class="btn btn-primary">추가</button>
			 		</td>
			 	</tr>
			 </tbody>
		</table>
		
	</div>
	<!-- content field end -->
</div>

<%@ include file="../include/tail.jsp"%>
