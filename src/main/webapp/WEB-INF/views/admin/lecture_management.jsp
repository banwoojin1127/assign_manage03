<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/head_admin.jsp"%>
<!-- content field start -->
<script>

//교사 선택이 눌린 경우 눌린 행 기억
var selectedObj    = null;    
var selecteTeacher = null;
//강의추가시 교사 선택 버튼 클릭
function RememberOne(obj)
{
	selectedObj    = obj;
	selecteTeacher = null;
}

//교사 목록에서 교사명 클릭시
function SaveSelected(obj)
{
	selecteTeacher = obj;
}

//교사 목록에서 선택 버튼 눌림
function SelectTeacher()
{
	if(selecteTeacher == null)
	{
		alert("교사를 선택하세요.");
		return;
	}
	var user_id = $(selecteTeacher).find("#user_id").html().trim();
	var user_name = $(selecteTeacher).find("#user_name").html().trim();
	$(selectedObj).parent().find("#user_id").val(user_id);	
	$(selectedObj).html(user_name);
	
}

let rowsAdded = 0;
function addRow() {
    const tableBody = document.getElementById("table_add").getElementsByTagName("tbody")[0];
    
    if (rowsAdded === 0) {
        // 처음 추가: 2개 서로 다른 행

        const row1 = tableBody.insertRow();
        row1.style.backgroundColor = "#c2dcff";
        
        const rowIndex = tableBody.rows.length; // 현재 행 수 기반 번호
        
        // --- 첫 번째 행 (헤더 역할) 수정 ---
        const cell0 = row1.insertCell(0);
        cell0.innerText = "강의명";
        cell0.className = "tea-td"; // 클래스 추가

        const cell1 = row1.insertCell(1);
        cell1.innerText = "교사명";
        cell1.className = "tea-td"; // 클래스 추가

        const cell2 = row1.insertCell(2);
        cell2.innerText = "최대정원";
        cell2.className = "thwidth2 tea-td"; // 클래스 추가
        
        const cell3 = row1.insertCell(3);
        cell3.innerText = "시작일";
        cell3.className = "thwidth3 tea-td"; // 클래스 추가

        const cell4 = row1.insertCell(4);
        cell4.innerText = "종료일";
        cell4.className = "thwidth3 tea-td"; // 클래스 추가
                
        
        // ------------------------------------

        for (let i = 0; i < row1.cells.length; i++) {
            row1.cells[i].style.fontWeight = "bold";
        }

        const row2 = tableBody.insertRow();
        
        // --- 두 번째 행 (데이터 역할) 수정 ---
        const r2_c0 = row2.insertCell(0);
        r2_c0.innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 97%;'>";
        r2_c0.className = "tea-td"; // 클래스 추가
        r2_c0.querySelector('input').id = "lecture_name_" + rowsAdded; 
        
        const r2_c1 = row2.insertCell(1);
        r2_c1.innerHTML  = "<input type='hidden' id='user_id' name='user_id'>";
        r2_c1.innerHTML += "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#addTeacherModal' onclick='RememberOne(this);'>선택</button>";
        r2_c1.className = "tea-td"; // 클래스 추가
        r2_c1.querySelector('button').id = "teacher_name" + rowsAdded; 
        
        const r2_c2 = row2.insertCell(2);
        r2_c2.innerHTML = "<input type='number' style='border:none; box-sizing: content-box; width: 90%;'>";
        r2_c2.className = "tea-td"; // 클래스 추가
        r2_c2.querySelector('input').id = "cap" + rowsAdded; 
        
        
        const r2_c3 = row2.insertCell(3);
        r2_c3.innerHTML = "<input type='date' style='border:none; box-sizing: content-box; width: 90%;'>";
        r2_c3.className = "tea-td"; // 클래스 추가
        r2_c3.querySelector('input').id = "start_date" + rowsAdded; 
        
        
        const r2_c4 = row2.insertCell(4);
        r2_c4.innerHTML = "<input type='date' style='border:none; box-sizing: content-box; width: 90%;'>";
        r2_c4.className = "tea-td"; // 클래스 추가
        r2_c4.querySelector('input').id = "end_date" + rowsAdded; 
        
        rowsAdded++;
        
     // ------------------------------------
    }
}

    // 전체 선택 체크 박스 실행
    function selectAll(selectAll){
        let checkboxes = document.getElementsByName("check");

        for(let checkbox of checkboxes){
            checkbox.checked = selectAll.checked;
        }
    };

    // 버튼 띄우기
    function showBtn(){
        const buttons = document.getElementsByClassName("showBtn");
        for(let i  = 0; i < buttons.length; i++)
        {
            buttons[i].style.display = "block";
        }
    };

   
    
 //편집
   function edit(button) {
       const row = button.parentElement.parentElement; // 버튼이 속한 행
       
       // 1번째 셀(체크박스/번호 등)을 제외하고 모든 셀을 input으로 변환
       for(let i = 1; i < row.cells.length - 1; i++) { // 마지막 셀은 편집 버튼
           const cell = row.cells[i];
           const currentText = cell.innerText.trim(); // 기존 텍스트

           // 항상 input 생성
           cell.innerHTML = '';
           const inputField = document.createElement('input');
           inputField.type = 'text';
           inputField.value = currentText;  // 기존 텍스트를 값으로 설정
           inputField.style.width = "95%"; // 필요시 스타일 추가
           cell.appendChild(inputField);
       }

       // 편집 버튼을 "저장" 버튼으로 변경
       button.innerHTML = "💾";
       button.setAttribute("onclick", "save(this)");
   }

   //편집 > 저장
   function save(button) {
       const row = button.parentElement.parentElement;  // 버튼이 속한 행

       // 1번째 셀 제외, 마지막 셀 제외 (편집 버튼)
       for (let i = 1; i < row.cells.length - 1; i++) {
           const cell = row.cells[i];
           if (cell.children.length > 0 && cell.children[0].tagName === 'INPUT') {
               const inputField = cell.children[0];
               const newText = inputField.value.trim();
               cell.innerHTML = newText || ''; // 빈 값일 경우 빈 텍스트
           }
       }

       // 버튼을 다시 편집 버튼으로 변경
       button.innerHTML = "✏️";
       button.setAttribute("onclick", "edit(this)");
   }
	
	//편집 > 저장
	// 저장 버튼 클릭 시, 변경된 값을 셀에 반영하고 버튼을 다시 "편집" 버튼으로 바꾸는 함수
	function save(button) 
	{
	  const row = button.parentElement.parentElement;  // 버튼이 속한 행 (tr)

	  // 행에 있는 첫 번째 셀 (편집 버튼)을 제외한 나머지 셀들을 순회
	  for (let i = 1; i < row.cells.length; i++) 
	  {  // 첫 번째 셀은 편집 버튼이므로 제외
	    const cell = row.cells[i];

	    // 셀에 input 필드가 있으면 값을 가져와서 텍스트로 변경
	    if (cell.children.length > 0 && cell.children[0].tagName === 'INPUT') 
	    {
	      const inputField = cell.children[0];
	      const newText = inputField.value.trim();  // 입력된 값 가져오기

	      // 셀의 내용을 새 텍스트로 업데이트
	      cell.innerHTML = newText || '';  // 빈 값일 경우 빈 텍스트로 설정
	    }
	  }

	  // "저장" 버튼을 다시 "편집" 버튼으로 변경
	  button.innerHTML = "✏️";  // "편집" 버튼으로 변경
	  button.setAttribute("onclick", "edit(this)");  // 편집 버튼 클릭 시 edit() 함수 호출
	}

	
	document.addEventListener("DOMContentLoaded", function() {
	    const saveBtn = document.getElementById("saveBtn");
	    if (!saveBtn) return;

	    saveBtn.addEventListener("click", function() {
	        const addTableBody = document.querySelector("#table_add tbody");
	        const classBody = document.querySelector("#class_content tbody.saveAdd");

	        if (!classBody) {
	            console.error("tbody.saveAdd를 찾을 수 없습니다.");
	            return;
	        }

	        // 헤더 제외하고 모든 데이터 행 순회
	        for (let i = 1; i < addTableBody.rows.length; i++) {
	            const row = addTableBody.rows[i];

	            const lecture_name = row.querySelector("input[id^='lecture_name']")?.value || "";
	            const teacher_name = row.querySelector("button[id^='teacher_name']")?.innerText || "";
	            const cap = row.querySelector("input[id^='cap']")?.value || "";
	            const start_date = row.querySelector("input[id^='start_date']")?.value || "";
	            const end_date = row.querySelector("input[id^='end_date']")?.value || "";

	            const newRow = classBody.insertRow();

	            // 체크박스
	            const cell1 = newRow.insertCell();
	            const checkBox = document.createElement("input");
	            checkBox.type = "checkbox";
	            checkBox.name = "check";
	            cell1.appendChild(checkBox);

	            // 번호
	            const cell2 = newRow.insertCell();
	            cell2.textContent = classBody.rows.length + 2;

	            // 강의명
	            const cell3 = newRow.insertCell();
	            cell3.textContent = lecture_name;

	            // 교사명
	            const cell4 = newRow.insertCell();
	            cell4.textContent = teacher_name;

	            // 정원
	            const cell5 = newRow.insertCell();
	            cell5.innerHTML = "/" + cap + "  <button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#addStudentModal'>추가</button>";

	            // 시작일
	            const cell6 = newRow.insertCell();
	            cell6.textContent = start_date;

	            // 종료일
	            const cell7 = newRow.insertCell();
	            cell7.textContent = end_date;

	            // 편집 버튼
	            const cell8 = newRow.insertCell();
	            const editBtn = document.createElement("button");
	            editBtn.className = "edit";
	            editBtn.textContent = "✏️";
	            editBtn.onclick = function() { edit(editBtn); };
	            cell8.appendChild(editBtn);
	        }

	        alert("저장 완료!");
	    });
	});
	
	//삭제
	function class_Delete() {
	    const tableBody = document.querySelector("#class_content tbody"); // tbody만
	    const checkboxes = tableBody.querySelectorAll("input[name='check']");
	    
	    if (![...checkboxes].some(cb => cb.checked)) {
	        alert("삭제할 행을 선택해주세요.");
	        return;
	    }
	
	    if (confirm("선택한 행을 삭제하시겠습니까?")) {
	        // 체크된 행 삭제
	        for (let i = checkboxes.length - 1; i >= 0; i--) {
	            if (checkboxes[i].checked) {
	                const row = checkboxes[i].closest("tr");
	                if (row) row.remove();
	            }
	        }
	
	        // 번호 재정렬
	        const rows = tableBody.querySelectorAll("tr");
	        let number = 1;
	        rows.forEach(row => {
	            const numberCell = row.cells[1];
	            if (numberCell) numberCell.textContent = number++;
	        });
	
	        // rowsAdded 갱신
	        rowsAdded = rows.length;
	    }
	}
	
	   /* function lecture_SearchLimit(){
	    	let document.getElementById("lectureSch")
	    	alert("강의명을 입력하세요.");
	    	};
	   */

</script>


<div style="padding: 80px 100px; text-align: center;">
	<h3 style="text-align: left; width: 500px;">
		<div id="formLoginTitle"
			class="d-flex flex-wrap align-content-start my-3"
			style="width: 100%;">
			<div id="" class="decoWideTitle" style="width: 12px;"></div>
			&nbsp;&nbsp; <b>강의 관리</b>
	</h3>

	<div style="text-align: center; margin: 5%;">
		<form class="search-box d-flex align-items-center" action="/admin/lecture_management" method="get">
			<input type="text" name="keyword" id="lectureSearch" class="form-control"
				style="width: 250px; float: left;" placeholder="강의명">
			<button type="submit" class="btn btn-primary ms-2">검색</button>
		</form>
		
		<div style="height:30px;"></div>
		<form class="showBtn" style="display: none;">
			<button type="button" id="saveBtn" class="btn btn-outline-primary"
				style="float: right; padding-block: 5px; color: #000000;">
				<b>저장</b>
			</button>

			<button type="button" class="btn btn-outline-secondary" onclick="location.href='lecture_management'"
				style="color: #000000; float: right; padding-block: 5px; margin-right: 5px;">
				<b>취소</b>
			</button>
		</form>
		<div style="height: 40px;"></div>
		<table id="table_add">
			<tbody>
				<!-- 테이블 행 추가 -->
			</tbody>
		</table>

		<div style="height: 20px;"></div>
		<form>
			<button type="button" onclick="addRow(); showBtn();"
				class="btn_align2 btn btn-outline-primary"
				style="float: right; padding-block: 5px; color: #000000;">
				<b>생성</b>
			</button>

			<button type="button" class="btn_align1 btn btn-outline-secondary"
				onclick="class_Delete()"
				style="color: #000000; float: right; padding-block: 5px; margin-right: 5px;">
				<b>삭제</b>
			</button>
		</form>
		<div style="height: 40px;"></div>

		<table id="class_content">
		
			<thead>
				<tr style="height: 40px;">
					<!-- 전체 선택 체크 박스 버튼 -->
					<th class="tea-th chwidth1"><input type="checkbox" name="check"
						class="class_add" onclick='selectAll(this)'>
					</th>
					<th class="tea-th thwidth1">번호
					</th>
					<th class="tea-th thwidth2">강의명
					</th>
					<th class="tea-th thwidth2">교사명
					</th>
					<th class="tea-th thwidth2">정원
					</th>
					<th class="tea-th thwidth3">시작일
					</th>
					<th class="tea-th thwidth3">종료일
					</th>
					<th class="edit_th"></th>
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
				 		<td><input type="checkbox" name="check"></td>
				 		<td>${status.count}</td>
				 		<td><a href="../teacher/assignment_list">${lecture.lecture_name}</a></td>
				 		<td>${lecture.user_name}</td>
				 		<td>${lecture.cnt}/${lecture.cap}
				 			<button onclick="getUserList(${lecture.lecture_no})" type="button" class="btn btn-primary" >추가</button>
						</td>
				 		<td>${lecture.start_date}</td>
				 		<td>${lecture.end_date}</td>
				 		<td><button class="edit" onclick="edit(this)">✏️</button></td>
				 	</tr>
				</c:forEach>
			 </tbody>
		</table>
		
		<br><br>
		
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
                <li class="page-item"><a class="page-link" href="#">6</a></li>
                <li class="page-item"><a class="page-link" href="#">7</a></li>
                <li class="page-item"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#">9</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">&gt;</a>
                </li>
            </ul>
        </nav>
		
	</div>
	<!-- content field end -->
</div>

<!-- add student Modal start-->
<div class="modal fade" id="addStudentModal" data-bs-backdrop="static"
	tabindex="-1" aria-labelledby="addStudentModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
		style="min-width: 777px; max-width: 777px;">
		<div class="modal-content">
			<div class="modal-header">
				<!-- content main title start -->
				<div id=""
					class="d-flex flex-wrap justify-content-start align-content-start"
					style="width: 100%;">
					<div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
					&nbsp;&nbsp;
					<div id=""
						class="textWideTitle d-flex flex-wrap align-content-center px-1">
						<p class="flex-grow-1 m-0" style="font-size: 1.5em;">학생 추가</p>
					</div>
				</div>
				<!-- content main title end -->
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<!-- info massge start -->
					<div>
						<span>학생 이름을 검색 하실 수 있습니다.</span>
					</div>
					<!-- info massge end -->
					<!-- add student form start -->
					<!-- student search by name start -->
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="학생 명"
							aria-describedby="searchButton"> <a
							class="btn btn-outline-primary" type="button" id="searchButton">검색</a>
					</div>
					<!-- student search by name end -->
					<!-- search results table start -->
					<div class="sSearchReTab rounded"
						style="border: #a9a9a9; border-style: solid; border-width: 1px;">
						<div class="sSearchReTabRowName d-flex justify-content-between"
							style="background-color: lightgrey; font-weight: bold;">
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 50%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								아이디</div>
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								이름</div>
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								성별</div>
						</div>
						<input type="radio" class="btn-check" name="studentResult"
							id="student00" autocomplete="off"> <label for="student00"
							class="sSearchReTabRowVal btn d-flex justify-content-between m-0 p-0">
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 50%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								hong123</div>
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								홍길동</div>
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								남</div>
						</label> <input type="radio" class="btn-check" name="studentResult"
							id="student01" autocomplete="off"> <label for="student01"
							class="sSearchReTabRowVal btn d-flex justify-content-between m-0 p-0">
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 50%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								chun789</div>
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								성춘향</div>
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								여</div>
						</label>
					</div>
					
					<br><br>
					
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
                <li class="page-item"><a class="page-link" href="#">6</a></li>
                <li class="page-item"><a class="page-link" href="#">7</a></li>
                <li class="page-item"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#">9</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">&gt;</a>
                </li>
            </ul>
        </nav>
					
					<!-- search results table end -->
					<!-- add student form end -->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<a href="" class="btn btn-primary" data-bs-dismiss="modal">추가</a>
			</div>
		</div>
	</div>
</div>

<!--  [[ =================================  교사를 선택하시 위한 다이얼로그 선택창 표시 시작  -->

<div class="modal fade" id="addTeacherModal" data-bs-backdrop="static"
	tabindex="-1" aria-labelledby="addTeacherModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
		style="min-width: 777px; max-width: 777px;">
		<div class="modal-content">
			<div class="modal-header">
				<!-- content main title start -->
				<div id=""
					class="d-flex flex-wrap justify-content-start align-content-start"
					style="width: 100%;">
					<div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
					&nbsp;&nbsp;
					<div id=""
						class="textWideTitle d-flex flex-wrap align-content-center px-1">
						<p class="flex-grow-1 m-0" style="font-size: 1.5em;">교사 선택</p>
					</div>
				</div>
				<!-- content main title end -->
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<!-- info massge start -->
					
					<!-- info massge end -->
					<!-- add student form start -->
					<!-- student search by name start -->
					
					<!-- 
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="교사 명"
							aria-describedby="searchButton"> <a
							class="btn btn-outline-primary" type="button" id="teachersearchButton">검색</a>
					</div>
					 -->
					 
					<!-- student search by name end -->
					<!-- search results table start -->
					<div class="sSearchReTab rounded"
						style="border: #a9a9a9; border-style: solid; border-width: 1px;">
						<div class="sSearchReTabRowName d-flex justify-content-between"
							style="background-color: lightgrey; font-weight: bold;">
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 50%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								아이디</div>
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								이름</div>
							<div class="sSearchReTabCol d-flex justify-content-center p-2"
								style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
								성별</div>
						</div>
												
						<c:forEach var="item" items="${ teacher_list }">
							<input type="radio" class="btn-check teacher_radio" name="teacherResult"
								id="${item.id}" autocomplete="off"> <label for="${item.id}" onclick="SaveSelected(this);"
								class="sSearchReTabRowVal btn d-flex justify-content-between m-0 p-0">
								<div id="user_id" class="sSearchReTabCol d-flex justify-content-center p-2"
									style="width: 50%; border: #a9a9a9; border-style: solid; border-width: 1px;">
									${item.id}</div>
								<div id="user_name"  class="sSearchReTabCol d-flex justify-content-center p-2"
									style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
									${item.user_name}</div>
								<div class="sSearchReTabCol d-flex justify-content-center p-2"
									style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
									${item.gender}</div>
							</label>
						</c:forEach> 

					</div>

					<!-- search results table end -->
					<!-- add student form end -->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<a href="javascript:;" onclick="SelectTeacher();" class="btn btn-primary" data-bs-dismiss="modal">선택</a>
			</div>
		</div>
	</div>
</div>
<script>
	function getUserList(lectureNo){
		//ajax로 데이터 받기
		//lectureNo가 강의 번호
		//mapper_Admin의 selectUserNotExistsLecturListAndTeacher의 파라미터로 lectureNo를 넘겨줄 수 있게 처리
		//컨트롤러, 레파지토리, 매퍼
		//응답받은 유저 목록을 "addStudentModal" 안에 채우기
		//그리고 모달 띄우기
		
		$('#addStudentModal').modal('show');
		
	}
</script>
<!--  ]] =================================  교사를 선택하시 위한 다이얼로그 선택창 표시 시작  -->
<!-- add student Modal end-->
<%@ include file="../include/tail.jsp"%>
