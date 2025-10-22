<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/head_wide.jsp" %>
<!-- content field start -->
<script>
window.onload = function()
{
    $("#id").focus();
    
    $("#pwFind").click(function(){
        DoPWFind();
    });
    $("#codeCheck").click(function(){
        DoCodeCheck();
    });
}

// 비밀번호 찾기 함수
function DoPWFind()
{
    if($("#id").val() == "")
    {
        $("#msgPWFind").html("<span>아이디를 입력해주세요.</span>");
        $("#id").focus();
        return;
    }	
    
    if($("#tel").val() == "")
    {
        $("#msgPWFind").html("<span>전화번호를 '-'없이 입력해주세요.</span>");
        $("#tel").focus();
        return;
    }		
    $.ajax({
        url : "find_pw",
        type: "post",
        data :
        {
            id : $("#id").val(),
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
            else if(res == "" || res == "null")
            {
                // 조회 실패
                $("#msgPWFind").html("<span>아이디 또는 전화번호가 일치하지 않습니다.</span>");
            }
            else
            {
                // 조회 성공
                $("#email").val(res);
                SendEmail();
                eMailModal.click();
            }
        }
    });

}

//메일 인증 함수
function SendEmail()
{
    $.ajax({
        url : "sendEmail?email=" + $("#email").val(),
        type: "get",
        dataType: "html",
        success : function(res)
        {
            code = res.trim();
            if( code == "ERROR" )
            {
                $("#msg_code").html("<span style='color:#dc3545'>!!! 인증메일 발송 오류가 발생하였습니다. !!!</span>");
            }else
            {
                $("#msg_code").html("<span style='color:#dc3545; font-weight: bold;'>등록된 이메일로 인증 코드가 발송 되었습니다.<br>인증 코드를 입력해 주세요.</span>");
                $("#sendcode").val(code);
            }
        }
    });
}

// 인증 코드 확인 함수
function DoCodeCheck()
{
    if( $("#code").val() == "" )
    {
        $("#msg_code").html("<span style='color:#dc3545'>!!! 인증 코드를 입력해 주세요. !!!</span>");
        $("#code").focus();
        return;
    }
    if( $("#code").val() != $("#sendcode").val() )
    {
        $("#msg_code").html("<span style='color:#dc3545'>!!! 인증 코드가 일치하지 않습니다. !!!</span>");
        $("#code").focus();
        return;
    }
    // 인증 성공 시 비밀번호 찾기 완료 페이지로 이동
    $("#temp").submit();
}
</script>
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formFindPW" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formFindPWTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div class="textWideTitle d-flex flex-wrap justify-content-between align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">비밀번호 찾기</p>
                        <a href="login" class=" darkBtn btn">이전</a>
                    </div>
                </div>
                <div id="formFindPWRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded py-5">
                    <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                        <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                            <form id="temp" name="temp" class="d-flex flex-wrap justify-content-center align-content-center w-100" action="reset_pw" method="post">
                                <input type="hidden" id="email" name="email">
                                <div class="form-floating">
                                    <input id="id" name="id" class="form-control m-2" type="text" placeholder="이름">
                                    <label for="id" class="mx-2">아이디를 입력해주세요.</label>
                                </div>
                                <div class="form-floating">
                                    <input id="tel" name="tel" class="form-control m-2" type="text" placeholder="전화번호">
                                    <label for="tel" class="mx-2">전화번호를 '-'없이 입력해주세요.</label>
                                </div>
                            </form>
                        </div>
                        <button id="pwFind" class="btnWide btn align-content-center w-25 my-1" type="button">
                            확인
                        </button>
                        <button id="eMailModal" style="opacity: 0;" data-bs-toggle="modal" data-bs-target="#codeCheckModal"></button>
                        <!-- code check Modal start-->
                        <div class="modal fade" id="codeCheckModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="codeCheckModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="min-width: 777px; max-width: 777px;">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <!-- content main title start -->
                                        <div class="d-flex flex-wrap justify-content-start align-content-start" style="width: 100%;">
                                            <div class="decoWideTitle" style="width: 12px; height: 40px;"></div>
                                            &nbsp;&nbsp;
                                            <div class="textWideTitle d-flex flex-wrap align-content-center px-1">
                                                <p class="flex-grow-1 m-0" style="font-size: 1.5em;">이메일 인증</p>
                                            </div>
                                        </div>
                                        <!-- content main title end -->
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="container-fluid">
                                            <!-- info massge start -->
                                            <div id="msg_code">
                                            </div>
                                            <!-- info massge end -->
                                            <!-- code check form start -->
                                            <div>
                                                    <input type="hidden" id="sendcode" name="sendcode">
                                                    <input id="code" name="code" class="form-control" type="text" placeholder="인증 코드">
                                            </div>
                                            <!-- code check form end -->
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                        <button id="codeCheck" class="btn btn-primary">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- code check Modal end-->
                    </div>
                    <div id="msgPWFind" class="helpWideRequest form-text w-75 h-auto">
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