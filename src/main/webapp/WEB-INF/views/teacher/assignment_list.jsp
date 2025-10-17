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
            
            
            
<!-- 기존 하드코딩 강의 버튼 -->
<div style="line-height: 5px; width: 1310px; text-align: left;">
    <a href="/control/teacher/assignment_list/1" 
       class="btn tea-lecture btn-outline-primary" >강의1</a>
    <a href="/control/teacher/assignment_list/2" 
       class="btn tea-lecture btn-outline-secondary">강의2</a>
    <a href="/control/teacher/assignment_list/3" 
       class="btn tea-lecture btn-outline-secondary" >강의3</a>
    <a href="/control/teacher/assignment_list/4" 
       class="btn tea-lecture btn-outline-secondary" >긴글강의예시입니다긴글강의예시입니다긴글강의예시입니다4</a>
    <a href="/control/teacher/assignment_list/5" 
       class="btn tea-lecture btn-outline-secondary" >강의5</a>
    <a href="/control/teacher/assignment_list/6" 
       class="btn tea-lecture btn-outline-secondary" >강의6</a>
    <a href="/control/teacher/assignment_list/7" 
       class="btn tea-lecture btn-outline-secondary" >강의7</a>
</div>



                
                
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
                    <td class="tea-td"><a href="/control/teacher/assignment_view/1">과제 A</a></td>
                    <td class="tea-td" style="color: red;">09-29-00:00</td>
                </tr>
                <tr class="tea-tr">
                    <th class="tea-th">2</th>
                    <td class="tea-td">2주차</td>
                    <td class="tea-td"><a href="/control/teacher/assignment_view/2">과제 B</a></td>
                    <td class="tea-td" style="color: red;">09-30-00:00</td>
                </tr>
                <tr class="tea-tr">
                    <th class="tea-th">3</th>
                    <td class="tea-td">3주차</td>
                    <td class="tea-td"><a href="/control/teacher/assignment_view/3">과제 C</a></td>
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