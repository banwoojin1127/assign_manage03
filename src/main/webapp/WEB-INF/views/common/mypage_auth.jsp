<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="co" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<co:choose>
    <co:when test="${login.user_class == '0'}">
        <%@ include file="/WEB-INF/views/include/head_admin.jsp" %>
    </co:when>
    <co:when test="${login.user_class == '1'}">
        <%@ include file="/WEB-INF/views/include/head_teacher.jsp" %>
    </co:when>
    <co:when test="${login.user_class == '2'}">
        <%@ include file="/WEB-INF/views/include/head_student.jsp" %>
    </co:when>
    <co:otherwise>
        <co:redirect url="/common/login"/>
    </co:otherwise>
</co:choose>
<!-- content field start -->
<script>
window.onload = function()
{
    $("#pw").val("s2ezen123!");	

    $("#pw").focus();
    
    $("#btnAuth").click(function(){
        DoAuth();
    });
}
function DoAuth()
{
    if($("#pw").val() == "")
    {
        $("#msg_auth").html("<span>비밀번호를 입력해주세요.</span>");
        $("#pw").focus();
        return;
    }		
    $.ajax({
        url : "mypage_auth",
        type: "post",
        data :
        {
            pw : $("#pw").val()
        },
        dataType: "html",
        success : function(res)
        {
            res = res.trim();
            if(res == "ERROR")
            {
                // 인증 에러
                alert("인증 중 오류가 발생하였습니다. 관리자에게 문의하세요.");
            }
            else if(res == "false")
            {
                // 인증 실패
                $("#msg_auth").html("<span>비밀번호가 일치하지 않습니다.</span>");
            }
            else
            {
                //인증 성공
                document.location = "mypage_edit";
            }
        }
    });
}   
</script>
        <div style="padding: 20px 32px; text-align: center; width: 512px;">
            <h3 style="text-align: left; width: 512px;">
                <div id="formLoginTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div class="decoWideTitle" style="width: 12px;"></div>&nbsp;&nbsp;
                <b>회원정보 수정</b>
            </h3>
            <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 512px;">
                <div id="formFindPW" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="width: 512px;">
                    <div id="formFindPWTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                        <div class="textWideTitle d-flex flex-wrap align-content-center px-1" style="width: 95%;">
                            <p class="m-0" style="font-size: 1.5em;">&nbsp;&nbsp;본인 확인</p>
                        </div>
                    </div>
                    <div id="formFindPWRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 py-5" style="border-radius: 50px;">

                        <div class="d-flex flex-wrap align-content-start w-75 mt-4">
                            <div class="decoWideTitle" style="width: 8px  ;"></div>
                            &nbsp;
                            <div class="textWideTitle d-flex flex-wrap align-content-center px-1" style="width: 95%;">
                                <p class="m-0" style="font-size: 1.1em;">비밀번호</p>
                            </div>
                        </div>

                        <div class="d-flex flex-wrap justify-content-center align-content-center w-75">
                            <div class="d-flex flex-wrap justify-content-center w-100">
                                <div class="d-flex flex-wrap justify-content-center align-content-center w-100">
                                    <input id="pw" class="form-control m-2 my-3" name="" type="password" style="height: 50px;" placeholder="비밀번호 입력">
                                </div>
                            </div>
                            <div id="msg_auth" class="helpWideRequest form-text w-75 h-auto" style="margin-left: -110px;">
                            비밀번호를 입력해주세요.
                            </div>
                        </div>
                        <div class="d-flex flex-wrap justify-content-center align-content-start w-75">
                            <button id="btnAuth" class="btnWide btn align-content-center h-75 my-3" type="button"
                                style="width: 505px; background-color: white; color: black;
                                border: solid 1px; font-size: 1.1em;">확인</button>
                        </div>
                            <!-- service center info field start -->
                        <div class="d-flex flex-wrap align-content-start w-75 mt-4">
                            <div class="mt-2" style="font-size: 0.9em;">
                                회원정보 수정을 위한 비밀번호 확인 절차입니다.
                            </div>
                        </div>
                        <!-- service center info field end -->
                    </div>
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>