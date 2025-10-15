<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/head_teacher.jsp" %>
<!-- content field start -->
        <script>
            $(document).ready(function(){
                $("#arrow1").click(function(){
                    var check = $(this).attr("src");
                    if(check == "../../resources/img/arrow1.png")
                    {
                        $(this).attr("src", "../../resources/img/arrow2.png")
                    }else
                    {
                        $(this).attr("src", "../../resources/img/arrow1.png")
                    }
                    $("#view1").slideToggle();
                })

                $("#arrow2").click(function(){
                    var check = $(this).attr("src");
                    if(check == "../../resources/img/arrow1.png")
                    {
                        $(this).attr("src", "../../resources/img/arrow2.png")
                    }else
                    {
                        $(this).attr("src", "../../resources/img/arrow1.png")
                    }
                    $("#view2").slideToggle();
                })

                $("#arrow3").click(function(){
                    var check = $(this).attr("src");
                    if(check == "../../resources/img/arrow1.png")
                    {
                        $(this).attr("src", "../../resources/img/arrow2.png")
                    }else
                    {
                        $(this).attr("src", "../../resources/img/arrow1.png")
                    }
                    $("#view3").slideToggle();
                })

                $("#arrow4").click(function(){
                    var check = $(this).attr("src");
                    if(check == "../../resources/img/arrow1.png")
                    {
                        $(this).attr("src", "../../resources/img/arrow2.png")
                    }else
                    {
                        $(this).attr("src", "../../resources/img/arrow1.png")
                    }
                    $("#view4").slideToggle();
                })
            })
        </script>
        <div style="padding: 50px; float: left; text-align: center; width: 1649px;">
            <br><br><br>
            <form style="margin: 0px 350px; font-size: 23px;">
                <div class="tea-text" style="border: 2px solid #c2dcff; padding: 20px 50px 20px 0px;">
                    <img src="../../resources/img/folder.png" style="width: 90px;">&nbsp;&nbsp;
                    <b>홍길동</b> 교사님이 생성한 <b style="color: red;">마감 임박</b> 과제가 <b>2개</b> 있습니다.
                </div>
                <br>
                <div class="tea-text" style="background-color: #c2dcff; padding: 10px;">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                        <div style="text-align: left; margin-top: 15px;">
                            &nbsp;
                            <b>&nbsp;&nbsp;암석 탐구</b>
                        </div>
                        <div style="text-align: right;"><img id="arrow1" src="../../resources/img/arrow1.png" style="width: 80px;"></div>
                    </div>
                    <a href="../teacher/assignment-list.html" style="text-decoration: none;">
                        <div id="view1" class="tea-text" style="background-color: white; padding: 20px;">
                            <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                                <div style="text-align: left;"><b>바위와 ROCK 페스티벌의 연관성</b></div>
                                <br><br>
                                <div style="text-align: left;">돌맹이 강사님</div>
                                <div style="text-align: right;">
                                <b>남은 기한</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span style="color: red;">3일 남았습니다.<span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <br>
                <div class="tea-text" style="background-color: #c2dcff; padding: 10px;">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                        <div style="text-align: left; margin-top: 15px;">
                            &nbsp;
                            <b>&nbsp;&nbsp;암석 탐구</b>
                        </div>
                        <div style="text-align: right;"><img id="arrow2" src="../../resources/img/arrow1.png" style="width: 80px;"></div>
                    </div>
                    <a href="../teacher/assignment-list.html" style="text-decoration: none;">
                        <div id="view2" class="tea-text" style="background-color: white; padding: 20px;">
                            <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                                <div style="text-align: left;"><b>바위와 ROCK 페스티벌의 연관성</b></div>
                                <br><br>
                                <div style="text-align: left;">돌맹이 강사님</div>
                                <div style="text-align: right;">
                                <b>남은 기한</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span style="color: red;">5일 남았습니다.<span>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <br>
                <div class="tea-text" style="background-color: #c2dcff; padding: 10px;">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                        <div style="text-align: left; margin-top: 15px;">
                            &nbsp;
                            <b>&nbsp;&nbsp;암석 탐구</b>
                        </div>
                        <div style="text-align: right;"><img id="arrow3" src="../../resources/img/arrow2.png" style="width: 80px;"></div>
                    </div>
                    <a href="../teacher/assignment-list.html" style="text-decoration: none;">
                        <div id="view3" class="tea-text" style="background-color: white; padding: 20px; display: none;">
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
                <div class="tea-text" style="background-color: #c2dcff; padding: 10px;">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr);">
                        <div style="text-align: left; margin-top: 15px;">
                            &nbsp;
                            <b>&nbsp;&nbsp;암석 탐구</b>
                        </div>
                        <div style="text-align: right;"><img id="arrow4" src="../../resources/img/arrow2.png" style="width: 80px;"></div>
                    </div>
                    <a href="../teacher/assignment-list.html" style="text-decoration: none;">
                        <div id="view4" class="tea-text" style="background-color: white; padding: 20px; display: none;">
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
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>