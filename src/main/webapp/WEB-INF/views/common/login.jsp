<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/head_wide.jsp" %>
<!-- content field start -->
<script>
window.onload = function()
{
    $("#id").val("s2ezen");
    $("#pw").val("s2ezen123!");	
    
    $("#id").focus();
    
    $("#btnLogin").click(function(){
        DoLogin();
    });
}

function DoLogin()
{
    if($("#id").val() == "")
    {
        $("#msg_login").html("<span>아이디를 입력해주세요.</span>");
        $("#id").focus();
        return;
    }	
    
    if($("#pw").val() == "")
    {
        $("#msg_login").html("<span>비밀번호를 입력해주세요.</span>");
        $("#pw").focus();
        return;
    }		
    $.ajax({
        url : "login",
        type: "post",
        data :
        {
            id : $("#id").val(),
            pw : $("#pw").val()
        },
        dataType: "html",
        success : function(res)
        {
            res = res.trim();
            if(res == "ERROR")
            {
                // 로그인 에러
                alert("로그인 중 오류가 발생하였습니다. 관리자에게 문의하세요.");
            }
            else if(res == "false")
            {
                // 로그인 실패
                $("#msg_login").html("<span>아이디 또는 비밀번호가 일치하지 않습니다.</span>");
            }
            else
            {
                //로그인 성공
                alert("로그인 성공하였습니다.");
                document.location = res;
            }
        }
    });
}
</script>
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formLogin" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div class="textWideTitle d-flex flex-wrap align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">로그인</p>
                    </div>
                </div>
                <div id="formLoginRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded py-5">
                    <form id="login" class="d-flex flex-wrap justify-content-center align-content-center w-100" action="login" method="post">
                        <input id="id" class="form-control w-75 my-1" name="id" type="text" placeholder="아이디"><br>
                        <input id="pw" class="form-control w-75 my-1" name="pw" type="password" placeholder="비밀번호"><br>
                    </form>
                    <div id="msg_login" class="helpWideRequest form-text w-75 h-auto">
                    </div>
                    <button id="btnLogin" class="btnWide btn align-content-center w-75 my-1" style="height: 50px;" type="button">로그인</button>
                    <div class="darkText w-75 h-auto my-1 p-2">
                        <a href="signup" style="color: white; text-decoration : none;">회원 가입</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="find_id" style="color: white; text-decoration : none;">아이디 찾기</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="find_pw" style="color: white; text-decoration : none;">비밀번호 찾기</a>
                    </div>
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="/WEB-INF/views/include/tail.jsp" %>