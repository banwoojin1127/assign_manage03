<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_student.jsp" %>
<!-- content field start -->
        <script>
            $(document).ready(function(){
                $("#lectureArrow1").click(function(){
                    var check = $(this).attr("src");
                    if(check == "../../resources/img/arrow1.png")
                    {
                        $(this).attr("src", "../../resources/img/arrow2.png")
                    }else
                    {
                        $(this).attr("src", "../../resources/img/arrow1.png")
                    }
                    $("#lectureListView1").slideToggle();
                })

                $("#lectureArrow2").click(function(){
                    var check = $(this).attr("src");
                    if(check == "../../resources/img/arrow1.png")
                    {
                        $(this).attr("src", "../../resources/img/arrow2.png")
                    }else
                    {
                        $(this).attr("src", "../../resources/img/arrow1.png")
                    }
                    $("#lectureListView2").slideToggle();
                })

                $("#lectureArrow3").click(function(){
                    var check = $(this).attr("src");
                    if(check == "../../resources/img/arrow1.png")
                    {
                        $(this).attr("src", "../../resources/img/arrow2.png")
                    }else
                    {
                        $(this).attr("src", "../../resources/img/arrow1.png")
                    }
                    $("#lectureListView3").slideToggle();
                })

                $("#lectureArrow4").click(function(){
                    var check = $(this).attr("src");
                    if(check == "../../resources/img/arrow1.png")
                    {
                        $(this).attr("src", "../../resources/img/arrow2.png")
                    }else
                    {
                        $(this).attr("src", "../../resources/img/arrow1.png")
                    }
                    $("#lectureListView4").slideToggle();
                })
            })
        </script>
        <div style="padding: 50px; float: left; text-align: center; width: 1649px;">
            <br><br><br>
            <form style="margin: 0px 350px; font-size: 23px;">
                <div class="mainText" style="border: 2px solid #c2dcff; padding: 20px 50px 20px 0px;">
                    <img src="../../resources/img/folder.png" style="width: 90px;">&nbsp;&nbsp;
                    <b>홍길동</b> 님이 아직 제출하지 않은 과제가 <b>3개</b> 있습니다.
                </div>
                <br>
                <div class="mainText lectureList">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                        <div style="text-align: left; margin-top: 15px;">
                            <b>&nbsp;&nbsp;암석 탐구</b>
                        </div>
                        <div style="text-align: right;"><img id="lectureArrow1" src="../../resources/img/arrow1.png" style="width: 80px;"></div>
                    </div>
                    <a href="../student/assignment-list.jsp" class="lectureLink">
                        <div id="lectureListView1" class="mainText lectureListView">
                            <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                                <div style="text-align: left;"><b>바위와 ROCK 페스티벌의 연관성</b></div>
                                <br><br>
                                <div style="text-align: left;">돌맹이 강사님</div>
                                <div style="text-align: right;">
                                <b>남은 기한</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span class="endDate">3일 남았습니다.<span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <br>
                <div class="mainText lectureList">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                        <div style="text-align: left; margin-top: 15px;">
                            <b>&nbsp;&nbsp;암석 탐구</b>
                        </div>
                        <div style="text-align: right;"><img id="lectureArrow2" src="../../resources/img/arrow1.png" style="width: 80px;"></div>
                    </div>
                    <a href="../student/assignment-list.jsp" class="lectureLink">
                        <div id="lectureListView2" class="mainText lectureListView">
                            <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                                <div style="text-align: left;"><b>바위와 ROCK 페스티벌의 연관성</b></div>
                                <br><br>
                                <div style="text-align: left;">돌맹이 강사님</div>
                                <div style="text-align: right;">
                                <b>남은 기한</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span class="endDate">5일 남았습니다.<span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <br>
                <div class="mainText lectureList">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                        <div style="text-align: left; margin-top: 15px;">
                            <b>&nbsp;&nbsp;암석 탐구</b>
                        </div>
                        <div style="text-align: right;"><img id="lectureArrow3" src="../../resources/img/arrow2.png" style="width: 80px;"></div>
                    </div>
                    <a href="../student/assignment-list.jsp" class="lectureLink">
                        <div id="lectureListView3" class="mainText lectureListView" style="display: none;">
                            <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                                <div style="text-align: left;"><b>바위와 ROCK 페스티벌의 연관성</b></div>
                                <br><br>
                                <div style="text-align: left;">돌맹이 강사님</div>
                                <div style="text-align: right;">
                                <b>남은 기한</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>14일 남았습니다.<span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <br>
                <div class="mainText lectureList">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                        <div style="text-align: left; margin-top: 15px;">
                            <b>&nbsp;&nbsp;암석 탐구</b>
                        </div>
                        <div style="text-align: right;"><img id="lectureArrow4" src="../../resources/img/arrow2.png" style="width: 80px;"></div>
                    </div>
                    <a href="../student/assignment-list.jsp" class="lectureLink">
                        <div id="lectureListView4" class="mainText lectureListView" style="display: none;">
                            <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                                <div style="text-align: left;"><b>바위와 ROCK 페스티벌의 연관성</b></div>
                                <br><br>
                                <div style="text-align: left;">돌맹이 강사님</div>
                                <div style="text-align: right;">
                                <b>남은 기한</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>18일 남았습니다.<span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </form>
        </div>
<%@ include file="../include/tail.jsp" %>