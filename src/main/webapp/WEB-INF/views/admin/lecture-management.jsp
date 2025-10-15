<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_admin.jsp" %>
<!-- content field start -->
        <script>
        let rowsAdded = 0;

        function addRow() {
            const tableBody = document.getElementById("table_add").getElementsByTagName("tbody")[0];

            if (rowsAdded === 0)
            {
                // 처음 추가: 2개 서로 다른 행

                const row1 = tableBody.insertRow();
                row1.style.backgroundColor = "#c2dcff";
                
                const cell0 = row1.insertCell(0);
                cell0.innerHTML = "<input type='checkbox'>";
                cell0.className = "chwidth1"

                const cell1 = row1.insertCell(1);
                cell1.innerText = "번호";
                cell1.className = "thwidth1"

                const cell2 = row1.insertCell(2);
                cell2.innerText = "강의명";
                cell1.className = "thwidth1"

                const cell3 = row1.insertCell(3);
                cell3.innerText = "교사";
                cell3.className = "thwidth2"

                const cell4 = row1.insertCell(4);
                cell4.innerText = "정원";
                cell4.className = "thwidth2"

                const cell5 = row1.insertCell(5);
                cell5.innerText = "생성일";
                cell5.className = "thwidth3"

                const cell6 = row1.insertCell(6);
                cell6.innerText = "종료일";
                cell6.className = "thwidth3"

                for (let i = 0; i < row1.cells.length; i++)
                {
                        row1.cells[i].style.fontWeight = "bold";
                }

                const row2 = tableBody.insertRow();
                row2.insertCell(0).innerHTML = "<input type='checkbox' style='width:13px; height: 13px;'>";
                row2.insertCell(1).innerText = rowsAdded + 1;
                row2.insertCell(2).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 97%; text-align: center;'>";
                row2.insertCell(3).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%; text-align: center;'>";
                row2.insertCell(4).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%; text-align: center;'>";
                row2.insertCell(5).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%; text-align: center;'>";
                row2.insertCell(6).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%; text-align: center;'>";
                rowsAdded = 2;
            }else
            {
                // 이후 추가: 한 줄씩
                const newRow = tableBody.insertRow();

                newRow.insertCell(0).innerHTML = "<input type='checkbox' style='width:13px; height: 13px;'>";
                newRow.insertCell(1).innerText = `${rowsAdded + 1 - 1}`;
                newRow.insertCell(2).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 97%; text-align: center;'>";
                newRow.insertCell(3).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%; text-align: center;'>";
                newRow.insertCell(4).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%; text-align: center;'>";
                newRow.insertCell(5).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%; text-align: center;'>";
                newRow.insertCell(6).innerHTML = "<input type='text' style='border:none; box-sizing: content-box; width: 90%; text-align: center;'>";

                rowsAdded += 1;
            }
        }

        // 전체 선택 체크 박스 실행
        function selectAll(selectAll){
            let checkboxes = document.getElementsByName("check");

            for(let checkbox of checkboxes){
                checkbox.checked = selectAll.checked;
            }
        }

        // 버튼 띄우기
        function showBtn(){
            const buttons = document.getElementsByClassName("showBtn");
            for(let i  = 0; i < buttons.length; i++)
            {
                buttons[i].style.display = "block";
            }
        }

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
        }
        </script>
        <div style="padding: 80px 130px; text-align: center; width: 1664px;">
            <h3 style="text-align: left; width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>강의 관리</b>
            </h3>
            <br>
            <div class="me-auto p-2">    
                <form class="row row-cols-lg-auto g-3 align-items-center" style="margin-left: -15px;">
                    <div class="col-12" style="width: 115px;">
                        <select class="form-select" aria-label="Small select example">
                            <option selected>전체</option>
                            <option value="2">강의명</option>
                            <option value="3">교사</option>                    
                        </select>
                    </div>
                    <div class="col-12" style="width: 220px;">
                        <label class="visually-hidden" for="inlineFormInputGroupUsername">Username</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="inlineFormInputGroupUsername"
                                placeholder="Username">
                        </div>
                    </div>
                    <div class="col-12" style="width: 75px;">
                        <button type="submit" class="btn btn-primary">검색</button>
                    </div>
                </form>
            </div>
            
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

            <table id="class_content" border="1">
                <tr class="he" style="height: 40px;">
                    <!-- 전체 선택 체크 박스 버튼 -->
                    <th class="chwidth1"><input type="checkbox" name="check" class="class_add" onclick='selectAll(this)'></td>
                    <th class="thwidth1">번호</td>
                    <th class="thwidth1">강의명</td>
                    <th class="thwidth2">교사</td>
                    <th class="thwidth2">정원</td>
                    <th class="thwidth3">생성일</td>
                    <th class="thwidth3">종료일</td>
                </tr>
                <tr class="he">
                    <!-- 체크 박스 네임 지정 -->
                    <td><input type="checkbox" name="check"></td>
                    <td>1</td>
                    <td><a href="../admin/assignment-list.jsp" class="assigment">자바의 정석</a></td>
                    <td>홍길동</td>
                    <td>20 / 50</td>
                    <td>2025.9.22</td>
                    <td>2025.9.22</td>
                </tr>
                <tr class="he">
                    <td><input type="checkbox" name="check"></td>
                    <td>2</td>
                    <td><a href="../admin/assignment-list.jsp" class="assigment">양식의탐구</a></td>
                    <td>돌멩이</td>
                    <td>25 / 40</td>
                    <td>2025.9.22</td>
                    <td>2025.9.22</td>                 
                </tr>
                <tr class="he">
                    <td><input type="checkbox" name="check"></td>
                    <td>3</td>
                    <td><a href="../admin/assignment-list.jsp" class="assigment">하늘에서 음식이 내린다면</a></td>
                    <td>김밥</td>
                    <td>10 / 30</td>
                    <td>2025.9.22</td>
                    <td>2025.9.22</td>
                </tr>
                <tr class="he">
                    <td><input type="checkbox" name="check"></td>
                    <td>4</td>
                    <td>
                        <a href="../admin/assignment-list.jsp" class="assigment">
                        floccinaucinihilipilificastically</a>
                    </td>
                    <td>james</td>
                    <td>35 / 40</td>
                    <td>2025.9.22</td>
                    <td>2025.9.22</td>
                </tr>
                <tr class="he">
                    <td><input type="checkbox" name="check"></td>
                    <td>5</td>
                    <td><a href="../admin/assignment-list.jsp" class="assigment">주말이 짧은 과학적 이유</a></td>
                    <td>박과학</td>
                    <td>5 / 50</td>
                    <td>2025.9.22</td>
                    <td>2025.9.22</td>
                </tr>
                <tr class="he">
                    <td><input type="checkbox" name="check"></td>
                    <td>6</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr class="he">
                    <td><input type="checkbox" name="check"></td>
                    <td>7</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
        <br><br>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>