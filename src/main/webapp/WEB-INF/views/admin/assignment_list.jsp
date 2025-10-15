<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_admin.jsp" %>
<!-- content field start -->
        <div class="d-flex flex-wrap justify-content-center align-content-start" style="text-align: center; margin: 50px; padding-top: 50px; min-width: 689px;">
        <script>
            $(document).ready(function(){
                $("#create").click(function(){
                    $(".create_table").show();
                })
            })
        </script>
            <h3 style="text-align: left; width: 100%;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>과제 관리</b>
                </div>
            </h3>
            <br><br>
            <div class="justify-content-center" style="width: 100%; font-size: 20px; border:2px solid black; border-radius: 15px; border-color:#c2dcff; display: flex;">
                <img src="resources/img/profile.png" style="margin-left: 25px; width:250px;  height:250px;">
                <div class="align-content-center" style="width: 700px; height: 200px; border:2px solid #c2dcff; border-radius: 15px; background-color: #c2dcff; margin-left: 90px; margin-top: 25px;">
                    <div id="teacherName" style="text-align: center;">
                    담당 교수 : 홍길동
                    </div>
                </div>
            </div>
            <br><br>
            <table style="width: 100%; font-size: 20px;">
                <tr style="background-color: #c2dcff;">
                    <th style="min-width: 49px;">번호</th>
                    <th style="min-width: 100px">주차</th>
                    <th style="min-width: 340px">과제명</th>
                    <th style="min-width: 200px;">종료일</th>
                </tr>
                <tr>
                    <th>1</th>
                    <td>1주차</td>
                    <td><a href="../admin/assignment-view.html">과제 A</a></td>
                    <td style="color: red;">09-29-00:00</td>
                </tr>
                <tr>
                    <th>2</th>
                    <td>2주차</td>
                    <td><a href="../admin/assignment-view.html">과제 B</a></td>
                    <td style="color: red;">09-30-00:00</td>
                </tr>
                <tr>
                    <th>3</th>
                    <td>3주차</td>
                    <td><a href="../admin/assignment-view.html">과제 C</a></td>
                    <td>10-04-00:00</td>
                </tr>
            </table>
            <br>
            <div class="d-flex flex-wrap justify-content-end" style="width: 100%;">
                <button type="submit" id="create" class="btn btn-outline-primary lecture"
                style="height: 50px">추가</button>
                &nbsp;&nbsp;&nbsp;
                <button type="submit" class="btn btn-outline-secondary lecture create_table"
                style="height: 50px;">저장</button>
            </div>
            <br><br><br>
            <table class="create_table" style="width: 100%; font-size: 20px; display: none;">
                <tr style="background-color: #c2dcff;">
                    <th style="min-width: 49px;">번호</td>
                    <th style="min-width: 100px">주차</td>
                    <th style="min-width: 340px">과제명</td>
                    <th style="min-width: 200px;">종료일</td>
                </tr>
                <tr>
                    <th>4</th>
                    <td>4주차</td>
                    <td>과제 D</td>
                    <td>10-05-00:00</td>
                </tr>
            </table>
            <br>
        </div>
        <br><br><br><br>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>