<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/head_wide.jsp" %>
<script>
//

//아이디가 중복되었는지 검사용
let dupCheckID = "";

window.onload = function()
{
	$("#id").focus();
	
	//id 키보드 입력 이벤트 처리
	$("#id").keyup(function(){
		CheckID();
	});

    //pw 키보드 입력 이벤트 처리
	$("#pw").keyup(function(){
		CheckPW();
	});

    //pw_confirm 키보드 입력 이벤트 처리
    $("#pwConfirm").keyup(function(){  
        CheckPWConfirm();
    });
	
	//가입하기 이벤트처리
	$("#btnSubmit").click(function(){
		DoJoin();
	});
	
	//메일인증 코드 발송
	$("#btnMail").click(function(){
		SendMail();
	});	
}

//*아이디 검사 함수
function CheckID()
{
	id = $("#id").val();
	if(id == "")
	{
		$("#msg_id").html("<span style='color:#dc3545'>아이디를 입력하세요.</span>");
		return;
	}
    if(/^(?=.*[a-z])[a-z0-9]{5,20}$/.test(id))
    {
        $("#msg_id").html("<span style='color:#198754'>사용 가능한 아이디입니다.</span>");
    }
    else
    {
        $("#msg_id").html("<span style='color:#dc3545'>아이디는 5 ~ 20자의 영문 소문자, 숫자만 사용 가능합니다.</span>");
        return;
    }/*
	$.ajax({
		url : "idcheck.do?id=" + id,
		type: "get",
		dataType: "html",
		success : function(res)
		{
			res = res.trim();
			
			//아이디 중복 검사 결과를 기억한다.
			dupCheckID = res;
			
			switch(res)
			{
			case "ERROR":
				$("#msg_box").html("<span style='color:#dc3545'>중복검사 오류가 발생했습니다.</span>");
				break;
			case "DUPLICATED":					
				$("#msg_box").html("<span style='color:#dc3545'>중복된 아이디입니다.</span>");
				break;
			case "NOT_DUPLICATED":
				$("#msg_box").html("<span style='color:#198754'>사용 가능한 아이디입니다.</span>");
				break;					
			}			
		}
	});*/
}

//비밀번호 검사 함수
function CheckPW()
{
    require = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@%*])[a-zA-Z0-9~!@%*]{8,16}$/;
    pw = $("#pw").val();
    if(pw == "")
	{
		$("#msg_pw").html("<span style='color:#dc3545'>비밀번호를 입력하세요.</span>");
		return;
	}
    if(require.test(pw))
    {
        $("#msg_pw").html("<span style='color:#198754'>사용 가능한 비밀번호입니다.</span>");
    }
    else
    {
        $("#msg_pw").html("<span style='color:#dc3545'>비밀번호는 8 ~ 16자의 영문, 숫자, 특수문자(~,!,@,%,*)를 모두 사용해 주세요.</span>");
        return;
    }
}
//비밀번호 일치 검사 함수
function CheckPWConfirm()
{
    if($("#pw").val() != $("#pwConfirm").val())
    {
        $("#msg_pwConfirm").html("<span style='color:#dc3545'>비밀번호가 일치하지 않습니다.</span>");
        return;
    }else
    {
        $("#msg_pwConfirm").html("<span style='color:#198754'>비밀번호가 일치합니다.</span>");
        return;
    }
}

//*회원가입 요청 검사 함수
function DoJoin()
{
	// id 입력값이 없으면 메세지 출력하고 submit 중지
	if($("#id").val() == "")
	{
		alert("아이디를 입력하세요");
		$("#id").focus();
		return;
	}	
	
	if($("#userpw").val() == "")
	{
		alert("비밀번호를 입력하세요");
		$("#userpw").focus();
		return;
	}
	
	if($("#userpw").val() != $("#pwcheck").val())
	{
		alert("비밀번호가 일치하지 않습니다.");
		$("#userpw").focus();
		return;
	}	
	
	if($("#name").val() == "")
	{
		alert("이름을 입력하세요");
		$("#name").focus();
		return;
	}	
	
	if( dupCheckID != "NOT_DUPLICATED")
	{
		alert("사용가능한 아이디가 아닙니다.");
		return ;
	}
	
	if( $("#code").val() == "")
	{
		alert("인증코드를 입력하세요");
		$("#code").focus();
		return;		
	}
	if( $("#code").val() != $("#sendcode").val())
	{
		alert("인증코드가 일치하지 않습니다.");
		$("#code").focus();
		return;		
	}	
	
	//가입방지코드가 일치하는지 검사
	$.ajax({
		url : "getsign.do",
		type: "get",
		dataType: "html",
		success : function(res)
		{
			sign = res.trim();
			if( $("#sign").val() != sign )
			{
				alert("자동가입 방지코드가 일치하지 않습니다.");
			}else
			{
				if(confirm("회원가입을 진행하시겠습니까?") == false)
				{
					return;
				}
				//document.join.submit();
				$("#join").submit();
			}
		}
	});
}

//메일 검사 함수
function SendMail()
{
	if( $("#mail").val() == "")
	{
		alert("메일주소를 입력하세요");
		$("#mail").focus();
		return;		
	}	
	$.ajax({
		url : "sendmail.do?mail=" + $("#mail").val(),
		type: "get",
		dataType: "html",
		success : function(res)
		{
			code = res.trim();
			if( code == "ERROR" )
			{
				alert("인증메일 발송 오류가 발생하였습니다.");
			}else
			{
				alert("인증코드를 메일로 발송하였습니다.");
				$("#sendcode").val(code);
			}
		}
	});	
}
</script>
<!-- content field start -->
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formJoin" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formJoinTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div class="textWideTitle d-flex flex-wrap justify-content-between align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">회원가입</p>
                        <a href="login" class=" darkBtn btn">이전</a>
                    </div>
                </div>
                <div id="formJoinRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded py-5">
                    <form id="join" name="join" action="signup" method="post" class="d-flex flex-wrap justify-content-center align-content-center w-100">
                        <input id="user_class" name="user_class" type="hidden" value="2">
                        <div class="w-75 my-1">
                            <input id="id" name="id" class="form-control" type="text" placeholder="아이디">
                            <div id="msg_id" class="form-text h-auto">
                                <span style='color:#dc3545'>아이디를 입력하세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="pw" name="pw" class="form-control" type="password" placeholder="비밀번호">
                            <div id="msg_pw" class="form-text h-auto">
                                <span style='color:#dc3545'>비밀번호를 입력하세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="pwConfirm" name="pwConfirm" class="form-control" type="password" placeholder="비밀번호 확인">
                            <div id="msg_pwConfirm" class="form-text w-75 h-auto">
                                <span style='color:#dc3545'>비밀번호를 한번 더 입력하세요.</span>
                            </div>
                        </div>
                        <!-- email input group start -->
                        <div class="input-group w-75 my-1">
                            <input id="email" name="email"class="form-control" type="text" placeholder="이메일" required>
                            <span class="input-group-text">@</span>
                            <!-- mail get in field start -->
                            <select id="emailDomain" name="emailDomain" class="form-select rounded-end" required>
                                <option value="" >선택</option>
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="doum.net">doum.net</option>
                                <option value="hanmail.net">hanmail.net</option>
                            </select>
                            <!-- mail get in field end -->
                            <div id="" class="form-text h-auto">
                                올바른 이메일을 입력해주세요.
                            </div>
                            <!-- 이미 등록 된 이메일 주소입니다. -->
                        </div>
                        <!-- email input group end -->
                        <div class="w-75 my-1">
                            <input id="user_name" name="user_name" class="form-control" type="text" placeholder="이름" required>
                            <div id="" class="form-text h-auto">
                                이름을 입력해주세요.
                            </div>
                            <div class="form-text h-auto">
                                확인되었습니다.
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="birth" name="birth" class="form-control" type="text" placeholder="생년월일" required>
                            <div id="" class="form-text h-auto">
                                생년월일을 입력해주세요.
                            </div>
                            <div class="form-text h-auto">
                                확인되었습니다.
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <div id="genderSelectGroup" class="btn-group w-100">
                                <input id="genderM" name="gender" class="val-gender btn-check" type="radio" value="M" required autocomplete="off">
                                <label id="" class="btn-gender btn" for="genderM">남성</label>
                                <input id="genderF" name="gender" class="val-gender btn-check" type="radio" value="F" required autocomplete="off">
                                <label id="" class="btn-gender btn" for="genderF">여성</label>
                            </div>
                            <div id="" class="helpWideRequest form-text h-auto">
                                성별을 선택해주세요.
                            </div>
                            <div class="helpWideRequest form-text h-auto">
                                확인되었습니다.
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="tel" name="tel" class="form-control my-1" type="text" placeholder="휴대전화 번호">
                            <div id="" class="form-text h-auto">
                                휴대전화 번호를 입력해주세요.
                            </div>
                                <!-- 이미 등록 된 휴대전화 번호입니다. -->
                            <div class="form-text h-auto">
                                확인되었습니다.
                            </div>
                        </div>
                        <button type="submit" id="btnWideRequest" class="btn align-content-center w-75 my-1" style="height: 50px;">회원 가입</button>
                    </form>
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>