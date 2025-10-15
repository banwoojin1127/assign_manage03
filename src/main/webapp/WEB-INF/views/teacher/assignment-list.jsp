<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/head_teacher.jsp" %>

<!-- content field start -->
        <script>
            $(document).ready(function(){
                $("#create").click(function(){
                    $(".create_table").show();
                })
            })
        </script>
        <div style="padding: 80px 130px; text-align: center;">
            <h3 style="text-align: left; width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>과제 조회</b>
            </h3>
            <br>
            <form style="line-height: 5px; width: 1310px; text-align: left;">
                <button type="submit" class="btn tea-lecture btn-outline-primary">암석 탐구</button>
                <button type="submit" class="btn tea-lecture btn-outline-secondary">하늘에서 음식이 내린다면</button>
                <button type="submit" class="btn tea-lecture btn-outline-secondary">
                    floccinaucinihilipilificastically</button>
                <button type="submit" class="btn tea-lecture btn-outline-secondary">호박고구마 vs 밤고구마</button>
                <br><br>
                <button type="submit" class="btn tea-lecture btn-outline-secondary">감자는 왜 맛있을까</button>
                <button type="submit" class="btn tea-lecture btn-outline-secondary">주말이 짧은 과학적 이유</button>
                <button type="submit" class="btn tea-lecture btn-outline-secondary">수학</button>
                
                <button type="submit" class="btn tea-lecture btn-outline-secondary">. . .</button>
                <br><br><br>
                <button type="submit" class="btn tea-ecture btn-outline-secondary" style="float: right;">편집</button>
            </form>
            <br><br>
            <table style="width: 1310px; font-size: 20px;">
                <tr class="tea-tr" style="background-color: #c2dcff;">
                    <th class="tea-th" style="width: 80px;">번호</td>
                    <th class="tea-th" style="width: 300px">주차</td>
                    <th class="tea-th" style="width: 1000px">과제명</td>
                    <th class="tea-th" style="width: 400px;">제출 기한</td>
                </tr>
                <tr class="tea-tr">
                    <th class="tea-th">1</th>
                    <td class="tea-td">1주차</td>
                    <td class="tea-td"><a href="../teacher/assignment-view.jsp">과제 A</a></td>
                    <td class="tea-td" style="color: red;">09-29-00:00</td>
                </tr>
                <tr class="tea-tr">
                    <th class="tea-th">2</th>
                    <td class="tea-td">2주차</td>
                    <td class="tea-td"><a href="../teacher/assignment-view.jsp">과제 B</a></td>
                    <td class="tea-td" style="color: red;">09-30-00:00</td>
                </tr>
                <tr class="tea-tr">
                    <th class="tea-th">3</th>
                    <td class="tea-td">3주차</td>
                    <td class="tea-td"><a href="../teacher/assignment-view.jsp">과제 C</a></td>
                    <td class="tea-td">10-04-00:00</td>
                </tr>
            </table>
            <br>
            <div style="width: 200px;">
                <button type="submit" id="create" class="btn tea-lecture btn-outline-primary"
                style="float: left; margin-left: 50px;">추가</button>
            </div>
            <br><br><br>
            <table class="create_table" style="width: 1310px; font-size: 20px; display: none;">
                <tr class="tea-tr" style="background-color: #c2dcff;">
                    <th class="tea-th" style="width: 80px;">번호</td>
                    <th class="tea-th" style="width: 300px">주차</td>
                    <th class="tea-th" style="width: 1000px">과제명</td>
                    <th class="tea-th" style="width: 400px;">제출 기한</td>
                </tr>
                <tr class="tea-tr">
                    <th class="tea-th">4</th>
                    <td class="tea-td">4주차</td>
                    <td class="tea-td">과제 D</td>
                    <td class="tea-td">10-05-00:00</td>
                </tr>
            </table>
            <br>
            <div style="text-align: left; width: 1510px">
                <button type="submit" class="btn tea-lecture btn-outline-secondary create_table"
                style="float: right; margin-right: 200px;">저장</button>
            </div>
        </div>
        <br><br><br><br>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>