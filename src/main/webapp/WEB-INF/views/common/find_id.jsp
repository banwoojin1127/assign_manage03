<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/head_wide.jsp" %>
<!-- content field start -->
<script>
window.onload = function()
{
    $("#user_name").focus();
    
    $("#idFind").click(function(){
        DoIDFind();
    });
}

function DoIDFind()
{
    if($("#user_name").val() == "")
    {
        $("#msgIDFind").html("<span>이름을 입력해주세요.</span>");
        $("#user_name").focus();
        return;
    }	
    
    if($("#tel").val() == "")
    {
        $("#msgIDFind").html("<span>전화번호를 '-'없이 입력해주세요.</span>");
        $("#tel").focus();
        return;
    }		
    $.ajax({
        url : "find_id",
        type: "post",
        data :
        {
            user_name : $("#user_name").val(),
            tel : $("#tel").val()
        },
        dataType: "html",
        success : function(res)
        {
            res = res.trim();
            if(res == "ERROR")
            {
                // 조회 에러
                alert("조회 중 오류가 발생하였습니다. 관리자에게 문의하세요.");
            }
            else if(res == "false")
            {
                // 조회 실패
                $("#msgIDFind").html("<span>이름 또는 전화번호가 일치하지 않습니다.</span>");
            }
            else
            {
                // 조회 성공
                document.location = res;
            }
        }
    });
}
</script>
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formFindID" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formFindIDTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div id="" class="textWideTitle d-flex flex-wrap justify-content-between align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">아이디 찾기</p>
                        <a href="login" class=" darkBtn btn">이전</a>
                    </div>
                </div>
                <div id="formFindIDRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded py-5">
                    <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                        <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                            <form class="d-flex flex-wrap justify-content-center align-content-center w-100" method="post">
                                <div class="form-floating">
                                    <input id="user_name" name="user_name" class="form-control m-2" type="text" placeholder="이름">
                                    <label for="user_name" class="mx-2">이름을 입력해주세요.</label>
                                </div>
                                <div class="form-floating">
                                    <input id="tel" name="tel" class="form-control m-2" type="text" placeholder="전화번호">
                                    <label for="tel" class="mx-2">전화번호를 '-'없이 입력해주세요.</label>
                                </div>
                            </form>
                        </div>
                        <button id="idFind" class="btnWide btn align-content-center w-25 my-1" type="button">확인</a>
                    </div>
                    <div id="msgIDFind" class="helpWideRequest form-text w-75 h-auto">
                    </div>
                    <!-- service center info field start -->
                    <div class="d-flex flex-wrap align-content-start w-75 mt-4">
                        <div id="" class="decoWideTitle" style="width: 6px;"></div>
                        &nbsp;
                        <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1" style="width: 95%;">
                            <p class="m-0" style="font-size: 0.75em;">고객센터</p>
                        </div>
                        <div class="mt-2" style="font-size: 0.75em;">
                            고 객 센 터 Tel : 070 - 1234 - 5678
                        </div>
                    </div>
                    <!-- service center info field end -->
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>