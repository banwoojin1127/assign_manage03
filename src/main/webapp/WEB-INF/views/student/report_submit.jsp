<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <div class="d-flex flex-wrap justify-content-center align-content-start" style="padding: 50px;  padding-left: 75px; min-width: 689px;">
            <!-- content main title start -->
            <div id="" class="d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                &nbsp;&nbsp;
                <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1">
                    <p class="flex-grow-1 m-0" style="font-size: 1.5em;">과제 제출</p>
                </div>
            </div>
            <!-- content main title end -->
            <!-- assignment info box start -->
            <div class="boxCased d-flex flex-wrap justify-content-start align-content-start my-3" style="width: 100%;">
                <div class="d-flex justify-content-between w-100">
                    <div><b>강의 : </b>${assign.lecture_name}</div>
                    <div><b>이름 : </b>${user_name}</div>
                </div>
                <div class="d-flex justify-content-between w-100">
                    <div><b>과제 : </b>${assign.assign_name}</div>
                    <div><b>담당 : </b>${assign.teacher_name}</div>
                </div>
            </div>
            <!-- assignment info box end -->
            <!-- submission write form start -->
            <form id="submissionForm" action="<c:url value='/student/assign/${assign.assign_no}/report/submit'/>"
            	method="post" enctype="multipart/form-data" class="w-100">
	            <div class="d-flex flex-wrap justify-content-center align-content-start my-3 w-100">
	                <label id="" for="submissionWriteTextarea" class="darkText d-flex flex-wrap align-content-center rounded px-1 w-100">
	                    <p class="m-0 p-2" style="text-align: left;">제출 내용</p>
	                </label>
	                <textarea id="submissionWriteTextarea" name="report_note" class="boxCased d-flex form-control" rows="10"></textarea>
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
			    <div class="boxCased d-flex flex-wrap justify-content-start align-content-center mb-3 w-100" id="fileListDisplay">
				    선택된 파일 없음
				</div>
			
			    <input id="submissionWriteFiles" name="attach" class="form-control"
			    	style="display: none;" type="file" multiple onchange="updateFileList()">
	
				<script type="text/javascript">
				    let selectedFiles = [];
				
				    function updateFileList() {
				        const input = document.getElementById('submissionWriteFiles');
				        for (let i = 0; i < input.files.length; i++) {
				            const file = input.files[i];
				            // 중복 파일 추가 방지
				            if (!selectedFiles.some(f => f.name === file.name && f.size === file.size)) {
				                selectedFiles.push(file);
				            }
				        }
				        renderFileList();
				    }
				
				    function renderFileList() {
				        const display = document.getElementById('fileListDisplay');
				        display.innerHTML = '';
				
				        if (selectedFiles.length === 0) {
				            display.textContent = '선택된 파일 없음';
				            return;
				        }
				
				        selectedFiles.forEach((file, index) => {
				            const fileDiv = document.createElement('div');
				            fileDiv.className = 'd-flex align-items-center m-1';
				            fileDiv.style.border = '1px solid #ccc';
				            fileDiv.style.padding = '2px 6px';
				            fileDiv.style.borderRadius = '4px';
				
				            const fileName = document.createElement('span');
				            fileName.textContent = file.name;
				            fileName.style.marginRight = '10px';
				
				            const removeBtn = document.createElement('button');
				            removeBtn.type = 'button';
				            removeBtn.textContent = '삭제';
				            removeBtn.className = 'btn btn-sm btn-danger';
				            removeBtn.onclick = () => {
				                selectedFiles.splice(index, 1);
				                renderFileList();
				            };
				
				            fileDiv.appendChild(fileName);
				            fileDiv.appendChild(removeBtn);
				            display.appendChild(fileDiv);
				        });
				    }
				
				    // 폼 제출 시 selectedFiles를 input에 추가
				    document.getElementById('submissionForm').addEventListener('submit', function() {
				        const form = this;
				        const dataTransfer = new DataTransfer(); // 새로운 FileList 생성
				
				        selectedFiles.forEach(file => dataTransfer.items.add(file));
				        const input = document.getElementById('submissionWriteFiles');
				        input.files = dataTransfer.files; // input.files에 추가
				    });
				</script>
			    <!-- submission file form end -->
				<button type="submit" class="darkBtn btn">확인</button>
			</form>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>