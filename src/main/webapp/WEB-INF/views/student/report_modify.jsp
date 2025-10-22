<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <div class="d-flex flex-wrap justify-content-center align-content-start" style="padding: 50px;  padding-left: 75px; min-width: 689px;">
            <!-- content main title start -->
            <div id="" class="d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                &nbsp;&nbsp;
                <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1">
                    <p class="flex-grow-1 m-0" style="font-size: 1.5em;">과제 수정</p>
                </div>
            </div>
            <!-- content main title end -->
            <!-- assignment info box start -->
            <div class="boxCased d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div class="d-flex justify-content-between w-100">
                    <div><b>강의 : </b>${assign.lecture_name}</div>
                    <div><b>이름 : </b>${report.student_name}</div>
                </div>
                <div class="d-flex justify-content-between w-100">
                    <div><b>과제 : </b>${assign.assign_name}</div>
                    <div><b>담당 : </b>${assign.teacher_name}</div>
                </div>
            </div>
            <!-- assignment info box end -->
            <!-- submission write form start -->
            <form id="submissionForm" action="<c:url value='/student/assign/${assign.assign_no}/report/${report.report_no}/modify'/>"
            	method="post" enctype="multipart/form-data" class="w-100">
	            <div class="d-flex flex-wrap justify-content-center align-content-start my-3 w-100">
	                <label id="" for="submissionWriteTextarea" class="darkText d-flex flex-wrap align-content-center rounded px-1 w-100">
	                    <p class="m-0 p-2" style="text-align: left;">제출 내용</p>
	                </label>
	                <textarea id="submissionWriteTextarea" name="report_note" class="boxCased d-flex form-control" rows="10">
	                	<c:out value="${report.report_note}"/>
	                </textarea>
	            </div>
	            <!-- submission write form end -->
	            <!-- submission file form start -->
	            <div class="darkText d-flex flex-wrap justify-content-between align-content-start rounded mt-3 w-100">
			        <div class="d-flex flex-wrap align-content-center px-1">
			            <p class="m-0 p-2" style="text-align: left;">첨부 파일</p>
			        </div>
			        <div class="align-content-center">
			            <label for="submissionWriteFiles" class="mx-1 px-1">
			                <img src="<c:url value='/resources/img/file-earmark-plus-fill.png'/>" class="microIcon">
			            </label>
			        </div>
			    </div>
			    <div class="boxCased d-flex flex-wrap align-content-center mb-3 w-100" id="fileListDisplay">
			    
            	<!-- 기존 파일과 새 파일이 여기 표시됨 -->
		        </div>
		
		        <input id="submissionWriteFiles" name="attach" class="form-control"
		               style="display: none;" type="file" multiple onchange="updateFileList()">
		        <!-- submission file form end -->
		
		        <button type="submit" class="darkBtn btn">확인</button>
		    </form>
		</div>
		
		<script type="text/javascript">
		    let selectedFiles = [];
		    let existingFiles = [];
		
		    // 기존 파일 초기화
		    window.addEventListener('DOMContentLoaded', () => {
		        <c:forEach var="file" items="${fileList}">
		            existingFiles.push({
		                file_no: '${file.file_no}',
		                f_name: '${file.f_name}'
		            });
		        </c:forEach>
		        renderFileList();
		    });
		
		    function updateFileList() {
		        const input = document.getElementById('submissionWriteFiles');
		        for (let i = 0; i < input.files.length; i++) {
		            const file = input.files[i];
		            if (!selectedFiles.some(f => f.name === file.name && f.size === file.size)) {
		                selectedFiles.push(file);
		            }
		        }
		        renderFileList();
		    }
		
		    function renderFileList() {
		        const display = document.getElementById('fileListDisplay');
		        display.innerHTML = '';
		
		        const allFiles = [...existingFiles, ...selectedFiles];
		
		        if (allFiles.length === 0) {
		            display.textContent = '선택된 파일 없음';
		            return;
		        }
		
		        allFiles.forEach((file, index) => {
		            const fileDiv = document.createElement('div');
		            fileDiv.style.display = 'inline-flex';
		            fileDiv.style.alignItems = 'center';
		            fileDiv.style.border = '1px solid #ccc';
		            fileDiv.style.padding = '2px 6px';
		            fileDiv.style.borderRadius = '4px';
		            fileDiv.style.marginRight = '5px';
		            fileDiv.style.marginBottom = '3px';
		
		            const fileName = document.createElement('span');
		            fileName.textContent = file.f_name || file.name;
		
		            const removeBtn = document.createElement('button');
		            removeBtn.type = 'button';
		            removeBtn.textContent = '삭제';
		            removeBtn.className = 'btn btn-sm btn-danger';
		            removeBtn.style.marginLeft = '5px';
		            removeBtn.onclick = () => {
		                if (file.file_no) {
		                    existingFiles = existingFiles.filter(f => f.file_no != file.file_no);
		                } else {
		                	selectedFiles = selectedFiles.filter(f => f != file);
		                }
		                renderFileList();
		            };
		
		            fileDiv.appendChild(fileName);
		            fileDiv.appendChild(removeBtn);
		
		            if (file.file_no) {
		                const hidden = document.createElement('input');
		                hidden.type = 'hidden';
		                hidden.name = 'existingFiles';
		                hidden.value = file.file_no;
		                fileDiv.appendChild(hidden);
		            }
		
		            display.appendChild(fileDiv);
		        });
		    }
		
		    // 폼 제출 시 새 파일을 input에 추가
		    document.getElementById('submissionForm').addEventListener('submit', function (e) {
			    const input = document.getElementById('submissionWriteFiles');
			
			    if (selectedFiles.length > 0) {
			        const dataTransfer = new DataTransfer();
			        selectedFiles.forEach(file => dataTransfer.items.add(file));
			        input.files = dataTransfer.files;
			    } else {
			        // 새 파일이 없으면 input 자체를 제거해서 서버로 전송되지 않게 함
			        input.remove();
			    }
			});
		</script>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>