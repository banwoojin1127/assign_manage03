<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <div style="padding: 80px 130px; text-align: center;">
            <h3 style="text-align: left; width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>과제 조회</b>
            </h3>
            <br>
            <form class="lectureBtn listMargin">
                <button type="submit" class="btn lectureText btn-outline-secondary">
                    암석 탐구</button>
                <button type="submit" class="btn lectureText btn-outline-secondary">
                    하늘에서 음식이 내린다면</button>
                <button type="submit" class="btn lectureText btn-outline-secondary">
                    floccinaucinihilipilificastically</button>
                <button type="submit" class="btn lectureText btn-outline-secondary">
                    호박고구마 vs 밤고구마</button>
                <button type="submit" class="btn lectureText btn-outline-secondary">
                    감자는 왜 맛있을까</button>
                <button type="submit" class="btn lectureText btn-outline-secondary">
                    주말이 짧은 과학적 이유</button>
            
                <button type="submit" class="btn lectureText btn-outline-secondary">. . .</button>
            </form>

            <br><br>
            
            <div class="listMargin" id="teacherInfo1">
                <img src="../../resources/img/profile.png" style="margin-left: 100px; width:250px; height:250px;">
                <div id="teacherInfo2">
                    <b id="lectureName" style="display: block; margin-top: 20px;">
                    floccinaucinihil
                    <br>
                    ipilificastically
                    </b>
                    <div id="teacherName" style="margin-top: 10px;">
                    담당 교사 : 홍길동
                    </div>
                </div>
            </div>
            <br><br>

            <table id="assignment-list" class="listMargin" style="width: 1260px; font-size: 20px;">
                <tr style="background-color: #c2dcff;">
                    <th style="width: 80px;">번호</td>
                    <th style="width: 300px">주차</td>
                    <th style="width: 1000px">과제명</td>
                    <th style="width: 400px;">제출 기한</td>
                </tr>
                <tr>
                    <th>1</th>
                    <td>1주차</td>
                    <td><a href="../student/assignment-view.jsp">과제 A</a></td>
                    <td class="endDate">09-29-00:00</td>
                </tr>
                <tr>
                    <th>2</th>
                    <td>2주차</td>
                    <td><a href="../student/assignment-view.jsp">과제 B</a></td>
                    <td class="endDate">09-30-00:00</td>
                </tr>
                <tr>
                    <th>3</th>
                    <td>3주차</td>
                    <td><a href="../student/assignment-view.jsp">과제 C</a></td>
                    <td>10-04-00:00</td>
                </tr>
            </table>
            <br><br>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>