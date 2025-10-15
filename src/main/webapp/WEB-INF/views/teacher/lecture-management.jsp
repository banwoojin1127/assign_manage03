<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="../include/head_teacher.jsp" %>
        <!-- content field start -->
        <div style="text-align:center; margin: 5%;">
            <h4 style="text-align: left;"><b>● 강의 관리</b></h4>
            <form class="search-box" action="" method="get";>
                <input type="text" id="class" class="form-control" style=" width:250px; float:left;" placeholder="강의명">
                <button type="submit" class="btn btn-primary" style="float:left; background-color: #3a8efd;">검색</button>
            </form>
            <br>
            <div stlye="height:30px;"></div>
                <form class="showBtn" style="display: none;">
                    <button type="submit" class="btn btn-outline-primary" style="float: right; padding-block: 5px; color:#000000;"><b>저장</b></button>

                    <button type="submit" class="btn btn-outline-secondary" style="color:#000000; float: right; padding-block: 5px; margin-right: 5px;"><b>추가</b></button>
                    
                    <button type="submit" class="btn btn-outline-secondary" style="color:#000000; float: right; padding-block: 5px; margin-right: 5px;"><b>제거</b></button>
                </form>
                <div style="height: 40px;"></div>
            <table id="table_add">
                <tbody>
                    <!-- 테이블 행 추가 -->
                </tbody>
            </table>

            <div style="height: 50px;"></div>
            <form>
                <button type="button" onclick="addRow(); showBtn();" class="btn btn-outline-primary" style="float: right; padding-block: 5px; color:#000000;"><b>생성</b></button>

                <button type="button" class="btn btn-outline-secondary" style="color:#000000; float: right; padding-block: 5px; margin-right: 5px;"><b>편집</b></button>

                <button type="button" class="btn btn-outline-secondary" onclick="class_Delete()" style="color:#000000; float: right; padding-block: 5px; margin-right: 5px;"><b>삭제</b></button>
            </form>
            <div style="height: 40px;"></div>
        </form>

        <table id="class_content">
            <tr style="height: 40px;">
                <!-- 전체 선택 체크 박스 버튼 -->
                <th class="tea-th chwidth1"><input type="checkbox" name="check" class="class_add" onclick='selectAll(this)'></td>
                <th class="tea-th thwidth1">번호</td>
                <th class="tea-th">강의명</td>
                <th class="tea-th thwidth2">정원</td>
                <th class="tea-th thwidth3">시작일</td>
                <th class="tea-th thwidth3">종료일</td>
            </tr>
            <tr>
                <!-- 체크 박스 네임 지정 -->
                <td class="tea-td"><input type="checkbox" name="check"></td>
                <td class="tea-td">1</td>
                <td class="tea-td"><a href="../teacher/assignment-list.jsp" style="width: 100%; height: 100%; text-decoration: none;">자바의 정석</a></td>
                <td class=" class="tea-td"">29/35<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addStudentModal">추가</button></td>
                <td class="tea-td">2025.09.29</td>
                <td class="tea-td">2025.09.29</td>
            </tr>
            <tr>
                <td class="tea-td"><input type="checkbox" name="check"></td>
                <td class="tea-td">2</td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
            </tr>
            <tr>
                <td class="tea-td"><input type="checkbox" name="check"></td>
                <td class="tea-td">3</td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
            </tr>
            <tr>
                <td class="tea-td"><input type="checkbox" name="check"></td>
                <td class="tea-td">4</td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
            </tr>
            <tr>
                <td class="tea-td"><input type="checkbox" name="check"></td>
                <td class="tea-td">5</td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
            </tr>
            <tr>
                <td class="tea-td"><input type="checkbox" name="check"></td>
                <td class="tea-td">6</td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
            </tr>
            <tr>
                <td class="tea-td"><input type="checkbox" name="check"></td>
                <td class="tea-td">7</td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
                <td class="tea-td"></td>
            </tr>
        </table>
        </div>
        <!-- content field end -->
    </div>
    <script>
let rowsAdded = 0;

function addRow() {
    const tableBody = document.getElementById("table_add").getElementsByTagName("tbody")[0];

    if (rowsAdded === 0) {
        // 처음 추가: 2개 서로 다른 행

        const row1 = tableBody.insertRow();
        row1.style.backgroundColor = "#c2dcff";
        
        // --- 첫 번째 행 (헤더 역할) 수정 ---
        const cell0 = row1.insertCell(0);
        cell0.innerHTML = "<input type='checkbox'>";
        cell0.className = "chwidth1 tea-td"; // 클래스 추가
        
        const cell1 = row1.insertCell(1);
        cell1.innerText = "번호";
        cell1.className = "thwidth1 tea-td"; // 클래스 추가

        const cell2 = row1.insertCell(2);
        cell2.innerText = "강의명";
        cell2.className = "tea-td"; // 클래스 추가

        const cell3 = row1.insertCell(3);
        cell3.innerText = "정원";
        cell3.className = "thwidth2 tea-td"; // 클래스 추가

        const cell4 = row1.insertCell(4);
        cell4.innerText = "시작일";
        cell4.className = "thwidth3 tea-td"; // 클래스 추가

        const cell5 = row1.insertCell(5);
        cell5.innerText = "종료일";
        cell5.className = "thwidth3 tea-td"; // 클래스 추가
        // ------------------------------------

        for (let i = 0; i < row1.cells.length; i++) {
            row1.cells[i].style.fontWeight = "bold";
        }

        const row2 = tableBody.insertRow();
        
        // --- 두 번째 행 (데이터 역할) 수정 ---
        const r2_c0 = row2.insertCell(0);
        r2_c0.innerHTML = "<input type='checkbox' style='width:20px;'>";
        r2_c0.className = "tea-td"; // 클래스 추가
        
        const r2_c1 = row2.insertCell(1);
        r2_c1.innerText = rowsAdded + 1;
        r2_c1.className = "tea-td"; // 클래스 추가
        
        const r2_c2 = row2.insertCell(2);
        r2_c2.innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 97%;'>";
        r2_c2.className = "tea-td"; // 클래스 추가
        
        const r2_c3 = row2.insertCell(3);
        r2_c3.innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%;'>";
        r2_c3.className = "tea-td"; // 클래스 추가
        
        const r2_c4 = row2.insertCell(4);
        r2_c4.innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%;'>";
        r2_c4.className = "tea-td"; // 클래스 추가
        
        const r2_c5 = row2.insertCell(5);
        r2_c5.innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%;'>";
        r2_c5.className = "tea-td"; // 클래스 추가
        // ------------------------------------
        
        rowsAdded = 2;
    }
    else {
        // 이후 추가: 한 줄씩
        const newRow = tableBody.insertRow();

        // --- 이후 추가되는 행 수정 ---
        const new_c0 = newRow.insertCell(0);
        new_c0.innerHTML = "<input type='checkbox' style='width:20px;'>";
        new_c0.className = "tea-td"; // 클래스 추가
        
        const new_c1 = newRow.insertCell(1);
        new_c1.innerText = `${rowsAdded + 1 - 1}`;
        new_c1.className = "tea-td"; // 클래스 추가
        
        const new_c2 = newRow.insertCell(2);
        new_c2.innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 97%;'>";
        new_c2.className = "tea-td"; // 클래스 추가
        
        const new_c3 = newRow.insertCell(3);
        new_c3.innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%;'>";
        new_c3.className = "tea-td"; // 클래스 추가
        
        const new_c4 = newRow.insertCell(4);
        new_c4.innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%;'>";
        new_c4.className = "tea-td"; // 클래스 추가
        
        const new_c5 = newRow.insertCell(5);
        new_c5.innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%;'>";
        new_c5.className = "tea-td"; // 클래스 추가
        // ------------------------------------

        rowsAdded += 1;
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

    function class_Delete(){
        const checkboxes = document.getElementsByName("check");
        
        let isChecked = false;

        for(let i = 0; i < checkboxes.length; i++)
        {
            if(checkboxes[i].checked)
            {
                isChecked = true;
                break;
            }
        }

        if(isChecked){
            confirm("삭제하시겠습니까?");
        }
        else{
            alert("삭제할 행을 선택해주세요.");
        }
    };

    </script>
    <!-- add student Modal start-->
    <div class="modal fade" id="addStudentModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="addStudentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="min-width: 777px; max-width: 777px;">
            <div class="modal-content">
                <div class="modal-header">
                    <!-- content main title start -->
                    <div id="" class="d-flex flex-wrap justify-content-start align-content-start" style="width: 100%;">
                        <div id="" class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                        &nbsp;&nbsp;
                        <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1">
                            <p class="flex-grow-1 m-0" style="font-size: 1.5em;">학생 추가</p>
                        </div>
                    </div>
                    <!-- content main title end -->
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
                            <input type="text" class="form-control" placeholder="학생 명" aria-describedby="searchButton">
                            <a class="btn btn-outline-primary" type="button" id="searchButton">검색</a>
                        </div>
                        <!-- student search by name end -->
                        <!-- search results table start -->
                        <div class="sSearchReTab rounded" style="border: #a9a9a9; border-style: solid; border-width: 1px;">
                            <div class="sSearchReTabRowName d-flex justify-content-between" style="background-color: lightgrey; font-weight: bold;">
                                <div class="sSearchReTabCol d-flex justify-content-center p-2" style="width: 50%; border: #a9a9a9; border-style: solid; border-width: 1px;">
                                    아이디
                                </div>
                                <div class="sSearchReTabCol d-flex justify-content-center p-2" style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
                                    이름
                                </div>
                                <div class="sSearchReTabCol d-flex justify-content-center p-2" style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
                                    성별
                                </div>
                            </div>
                            <input type="radio" class="btn-check" name="studentResult" id="student00" autocomplete="off">
                            <label for="student00" class="sSearchReTabRowVal btn d-flex justify-content-between m-0 p-0">
                                <div class="sSearchReTabCol d-flex justify-content-center p-2" style="width: 50%; border: #a9a9a9; border-style: solid; border-width: 1px;">
                                    hong123
                                </div>
                                <div class="sSearchReTabCol d-flex justify-content-center p-2" style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
                                    홍길동
                                </div>
                                <div class="sSearchReTabCol d-flex justify-content-center p-2" style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
                                    남
                                </div>
                            </label>
                            <input type="radio" class="btn-check" name="studentResult" id="student01" autocomplete="off">
                            <label for="student01" class="sSearchReTabRowVal btn d-flex justify-content-between m-0 p-0">
                                <div class="sSearchReTabCol d-flex justify-content-center p-2" style="width: 50%; border: #a9a9a9; border-style: solid; border-width: 1px;">
                                    chun789
                                </div>
                                <div class="sSearchReTabCol d-flex justify-content-center p-2" style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
                                    성춘향
                                </div>
                                <div class="sSearchReTabCol d-flex justify-content-center p-2" style="width: 25%; border: #a9a9a9; border-style: solid; border-width: 1px;">
                                    여
                                </div>
                            </label>
                        </div>
                        <!-- search results table end -->
                        <!-- add student form end -->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <a href="" class="btn btn-primary" data-bs-dismiss="modal">추가</a>
                </div>
            </div>
        </div>
    </div>
    <!-- add student Modal end-->
<%@ include file="../include/tail.jsp" %>
