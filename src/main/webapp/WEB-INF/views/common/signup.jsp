<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/head_wide.jsp" %>
<script>
//아이디가 중복되었는지 검사용
let dupCheckID = "";
let dupCheckTel = "";
let dupCheckEmail = "";

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
    //user_name 키보드 입력 이벤트 처리
    $("#user_name").keyup(function(){  
        CheckUser_Name();
    });
    //gender 선택 이벤트 처리
    $("input[name='gender']").click(function(){  
        CheckGender();
    });
    //birth 선택 이벤트 처리
    $("#year, #month, #day").change(function(){  
        CheckBirth();
    });
    //tel 키보드 입력 이벤트 처리
    $("#tel").keyup(function(){  
        CheckTel();
    });
    //email 키보드 입력 이벤트 처리
    $("#persnal").keyup(function(){  
        CheckEmail();
    });
    $("#domain").change(function(){  
        CheckEmail();
    });

    //메일인증 코드 발송
    $("#btn_email").click(function(){
        SendEmail();
    });
	
	//가입하기 이벤트처리
	$("#btn_join").click(function(){
		DoJoin();
	});
}

//아이디 검사 함수
function CheckID()
{
    require = /^(?=.*[a-z])[a-z0-9]{5,20}$/;
	id = $("#id").val();
	if(id == "")
	{
		$("#msg_id").html("<span style='color:#dc3545'>*아이디를 입력해주세요.</span>");
		return;
	}
    if(require.test(id))
    {
        $("#msg_id").html("<span style='color:#198754'>사용 가능한 아이디입니다.</span>");
    }
    else
    {
        $("#msg_id").html("<span style='color:#dc3545'>*아이디는 5 ~ 20자의 영문 소문자, 숫자만 사용 가능합니다.</span>");
        return;
    }
	$.ajax({
		url : "dupliid?id=" + id,
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
				$("#msg_id").html("<span style='color:#dc3545'>!!! 중복검사 오류가 발생했습니다. !!!</span>");
				break;
			case "DUPLICATED":					
				$("#msg_id").html("<span style='color:#dc3545'>*중복된 아이디입니다.</span>");
				break;
			case "NOT_DUPLICATED":
				$("#msg_id").html("<span style='color:#198754'>사용 가능한 아이디입니다.</span>");
				break;					
			}			
		}
	});
}

//비밀번호 검사 함수
function CheckPW()
{
    require = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@%*])[a-zA-Z0-9~!@%*]{8,16}$/;
    pw = $("#pw").val();
    if(pw == "")
	{
		$("#msg_pw").html("<span style='color:#dc3545'>*비밀번호를 입력해주세요.</span>");
		return;
	}
    if(require.test(pw))
    {
        $("#msg_pw").html("<span style='color:#198754'>사용 가능한 비밀번호입니다.</span>");
        return;
    }
    else
    {
        $("#msg_pw").html("<span style='color:#dc3545'>*비밀번호는 8 ~ 16자의 영문, 숫자, 특수문자(~,!,@,%,*)를 모두 사용해 주세요.</span>");
        return;
    }
}
//비밀번호 일치 검사 함수
function CheckPWConfirm()
{
    if( $("#pwConfirm").val() == "")
    {
        $("#msg_pwConfirm").html("<span style='color:#dc3545'>*동일한 비밀번호를 입력해주세요.</span>");
        return;
    }
    else if( $("#pw").val() != $("#pwConfirm").val() )
    {
        $("#msg_pwConfirm").html("<span style='color:#dc3545'>*비밀번호가 일치하지 않습니다.</span>");
        return;
    }else
    {
        $("#msg_pwConfirm").html("<span style='color:#198754'>비밀번호가 일치합니다.</span>");
        return;
    }
}

//이름 검사 함수
function CheckUser_Name()
{
    name = $("#user_name").val();
    if( name == "")
    {
        $("#msg_name").html("<span style='color:#dc3545'>*이름을 입력해주세요.</span>");
        return;
    }else
    {
        $("#msg_name").html("<span style='color:#198754'>확인되었습니다.</span>");
        return;
    }
}

//성별 검사 함수
function CheckGender()
{
    gender = $("input[name='gender']:checked").val();
    if( gender == null)
    {
        $("#msg_gender").html("<span style='color:#dc3545'>*성별을 선택해주세요.</span>");
        return;
    }else
    {
        $("#msg_gender").html("<span style='color:#198754'>확인되었습니다.</span>");
        return;
    }
}

//생년월일 검사 함수
function CheckBirth()
{
    year = $("#year").val();
    month = $("#month").val();
    day = $("#day").val();
    $("#birth").val( year + "-" + month + "-" + day );
    birth = $("#birth").val();
    if( year == "" || month == "" || day == "")
    {
        $("#msg_birth").html("<span style='color:#dc3545'>*생년월일을 입력해주세요.</span>");
        return;
    }else
    {
        $("#msg_birth").html("<span style='color:#198754'>확인되었습니다.</span>");
        return;
    }
}

//전화번호 검사 함수
function CheckTel()
{
    require = /^[0-9]{9,11}$/;
    tel = $("#tel").val();
    if( tel == "" || require.test(tel) == false)
    {
        $("#msg_tel").html("<span style='color:#dc3545'>전화번호를 '-'없이 입력해주세요.</span>");
        return;
    }else
    {
        $("#msg_tel").html("<span style='color:#198754'>사용 가능한 전화번호입니다.</span>");
    }
    $.ajax({
		url : "duplitel?tel=" + tel,
		type: "get",
		dataType: "html",
		success : function(res)
		{
			res = res.trim();
			
			//전화번호 중복 검사 결과를 기억한다.
			dupCheckTel = res;
			
			switch(res)
			{
			case "ERROR":
				$("#msg_tel").html("<span style='color:#dc3545'>!!! 중복검사 오류가 발생했습니다. !!!</span>");
				break;
			case "DUPLICATED":					
				$("#msg_tel").html("<span style='color:#dc3545'>이미 등록 된 전화번호입니다.</span>");
				break;
			case "NOT_DUPLICATED":
				$("#msg_tel").html("<span style='color:#198754'>사용 가능한 전화번호입니다.</span>");
				break;					
			}			
		}
	});
}

//메일 검사 함수
function CheckEmail()
{
    require = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
    persnal = $("#persnal").val();
    domain = $("#domain").val();
    $("#email").val( persnal + "@" + domain );
    email = $("#email").val();
    if( persnal == "" || domain == "" )
    {
        $("#msg_email").html("<span style='color:#dc3545'>*메일주소를 입력해주세요.</span>");
        return;
    }
    if(require.test(email))
    {
        $("#msg_email").html("<span style='color:#198754'>사용 가능한 메일주소입니다.</span>");
    }
    else
    {
        $("#msg_email").html("<span style='color:#dc3545'>*불가능한 메일주소입니다.</span>");
        return;
    }
    $.ajax({
		url : "dupliemail?email=" + email,
		type: "get",
		dataType: "html",
		success : function(res)
		{
			res = res.trim();
			
			//전화번호 중복 검사 결과를 기억한다.
			dupCheckEmail = res;
			
			switch(res)
			{
			case "ERROR":
				$("#msg_email").html("<span style='color:#dc3545'>!!! 중복검사 오류가 발생했습니다. !!!</span>");
				break;
			case "DUPLICATED":					
				$("#msg_email").html("<span style='color:#dc3545'>*이미 등록 된 메일주소입니다.</span>");
				break;
			case "NOT_DUPLICATED":
				$("#msg_email").html("<span style='color:#198754'>사용 가능한 메일주소입니다.</span>");
				break;					
			}			
		}
	});
}
//메일 인증 함수
function SendEmail()
{
	if( persnal == "" || domain == "" )
	{
		$("#msg_email").html("<span style='color:#dc3545'>*메일주소를 입력해주세요.</span>");
		$("#email").focus();
		return;
    }
	$.ajax({
		url : "sendEmail?email=" + $("#email").val(),
		type: "get",
		dataType: "html",
		success : function(res)
		{
            code = res.trim();
			if( code == "ERROR" )
			{
                $("#msg_code").html("<span style='color:#dc3545'>*인증메일 발송 오류가 발생하였습니다.</span>");
			}else
			{
                $("#msg_code").html("<span style='color:#dc3545; font-weight: bold;'>*인증코드를 메일로 발송하였습니다.</span>");
				$("#sendcode").val(code);
			}
		}
	});
}

//focus에 맞춘 화면 이동
function MovePostion()
{
    window.scrollTo({
        top: 0,
        left: 0,
        behavior: 'smooth' // 부드러운 스크롤 효과 적용
    });
}

//회원가입 요청 검사 함수
function DoJoin()
{
    // 필수 입력값이 없으면 submit 중지
    if($("#id").val() == "")
    {
        $("#msg_id").html("<span style='color:#dc3545'>*아이디를 입력해주세요.</span>");
        $("#id").focus();
        MovePostion();
        return;
    }
    if($("#pw").val() == "")
    {
        $("#msg_pw").html("<span style='color:#dc3545'>*비밀번호를 입력해주세요.</span>");
        $("#pw").focus();
        MovePostion();
        return;
    }
    if($("#pw").val() != $("#pwConfirm").val())
    {
        $("#msg_pwConfirm").html("<span style='color:#dc3545'>*동일한 비밀번호를 입력해주세요.</span>");
        $("#pwConfirm").focus();
        MovePostion();
        return;
    }
    if($("#user_name").val() == "")
    {
        $("#msg_name").html("<span style='color:#dc3545'>*이름을 입력해주세요.</span>");
        $("#user_name").focus();
        return;
    }
    if($("input[name='gender']:checked").val() == null)
    {
        $("#msg_gender").html("<span style='color:#dc3545'>*성별을 선택해주세요.</span>");
        $("#genderM").focus();
        return;
    }
    if($("#year").val() == "" || $("#month").val() == "" || $("#day").val() == "")
    {
        $("#msg_birth").html("<span style='color:#dc3545'>*생년월일을 입력해주세요.</span>");
        $("#year").focus();
        return;
    }
    if($("#persnal").val() == "" || $("#domain").val() == "")
    {
        $("#msg_email").html("<span style='color:#dc3545'>*메일주소를 입력해주세요.</span>");
        $("#persnal").focus();
        return;
    }
    
    //아이디 중복문제 미해결 시 submit 중지
    if( dupCheckID != "NOT_DUPLICATED")
    {
        alert("*사용 가능한 아이디가 아닙니다.");
        return ;
    }
    //전화번호 중복문제 미해결 시 submit 중지
    if( dupCheckTel == "DUPLICATED" || dupCheckTel == "ERROR")
    {
        alert("사용 가능한 전화번호가 아닙니다.");
        return ;
    }
    //메일주소 중복문제 미해결 시 submit 중지
    if( dupCheckEmail != "NOT_DUPLICATED")
    {
        alert("*사용 가능한 메일주소가 아닙니다.");
        return ;
    }
    
    //메일 인증문제 미해결 시 submit 중지
    if( $("#code").val() == "")
    {
        $("#msg_code").html("<span style='color:#dc3545'>*인증 코드를 입력해주세요.</span>");
        $("#code").focus();
        return;
    }
    if( $("#code").val() != $("#sendcode").val())
    {
        $("#msg_code").html("<span style='color:#dc3545'>*인증 코드가 일치하지 않습니다.</span>");
        $("#code").focus();
        return;
    }

    //가입 의사 재확인
    if(confirm("회원가입을 진행하시겠습니까?") == false)
    {
        return;
    }
    else
    {
        $("#join").submit();
    }
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
                <div id="formJoinRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded pt-3 pb-5">
                    <div id="" class="helpWideRequest form-text w-75 h-auto mb-3">
                        <span style='color:#dc3545; font-weight: bold;'> * : 필수 입력 사항입니다.</span>
                    </div>
                    <!-- join form start -->
                    <form id="join" name="join" action="signup" method="post" class="d-flex flex-wrap justify-content-center align-content-center w-100">
                        <input id="user_class" name="user_class" type="hidden" value="2">
                        <input id="user_icon" name="user_icon" type="hidden" value="0">
                        <div class="w-75 my-1">
                            <input id="id" name="id" class="form-control" type="text" placeholder="아이디">
                            <div id="msg_id" class="form-text h-auto">
                                <span style='color:#dc3545'>*아이디를 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="pw" name="pw" class="form-control" type="password" placeholder="비밀번호">
                            <div id="msg_pw" class="form-text h-auto">
                                <span style='color:#dc3545'>*비밀번호를 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="pwConfirm" name="pwConfirm" class="form-control" type="password" placeholder="비밀번호 확인">
                            <div id="msg_pwConfirm" class="form-text w-75 h-auto">
                                <span style='color:#dc3545'>*동일한 비밀번호를 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="user_name" name="user_name" class="form-control" type="text" placeholder="이름">
                            <div id="msg_name" class="form-text h-auto">
                                <span style='color:#dc3545'>*이름을 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <div id="genderSelectGroup" class="btn-group w-100">
                                <input id="genderM" name="gender" class="val-gender btn-check" type="radio" value="M" autocomplete="off">
                                <label id="" class="btn-gender btn" for="genderM">남성</label>
                                <input id="genderF" name="gender" class="val-gender btn-check" type="radio" value="F" autocomplete="off">
                                <label id="" class="btn-gender btn" for="genderF">여성</label>
                            </div>
                            <div id="msg_gender" class="helpWideRequest form-text h-auto">
                                <span style='color:#dc3545'>*성별을 선택해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <div class="input-group">
                                <select id="year" class="form-control">
                                    <option value="" selected>연도</option>
                                </select>
                                <script>
                                    // 현재 연도를 가져옵니다.
                                    const currentYear = new Date().getFullYear();
                                    // 시작 연도를 설정합니다.
                                    const startYear = 1921; // 시작 연도
                                    // select 요소를 가져옵니다.
                                    const selectElement = document.getElementById('year');

                                    // 1990년부터 현재 연도까지의 옵션을 생성합니다.
                                    for (let year = currentYear; year >= startYear; year--) 
                                    {
                                    const option = document.createElement('option');
                                    option.value = year;
                                    option.textContent = year + '년';
                                    selectElement.appendChild(option);
                                    }
                                </script>
                                <span class="input-group-text">-</span>
                                <select id="month" class="form-control">
                                    <option value="" selected>월</option>
                                </select>
                                <script>
                                    // select 요소를 가져옵니다.
                                    const monthSelect = document.getElementById('month');

                                    // 1월부터 12월까지의 옵션을 생성합니다.
                                    for (let month = 1; month <= 12; month++) 
                                    {
                                        const option = document.createElement('option');
                                        option.value = month.toString().padStart(2, '0'); // 두 자리 숫자로 만듭니다.
                                        option.textContent = month + '월';
                                        monthSelect.appendChild(option);
                                    }
                                </script>
                                <span class="input-group-text">-</span>
                                <select id="day" class="form-control rounded-end">
                                    <option value="" selected>일</option>
                                </select>
                                <script>
                                    // select 요소를 가져옵니다.
                                    const daySelect = document.getElementById('day');

                                    // 1일부터 31일까지의 옵션을 생성합니다.
                                    for (let day = 1; day <= 31; day++) 
                                    {
                                        const option = document.createElement('option');
                                        option.value = day.toString().padStart(2, '0'); // 두 자리 숫자로 만듭니다.
                                        option.textContent = day + '일';
                                        daySelect.appendChild(option);
                                    }
                                </script>
                            </div>
                            <input id="birth" name="birth" type="hidden">
                            <div id="msg_birth" class="form-text h-auto">
                                <span style='color:#dc3545'>*생년월일을 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="w-75 my-1">
                            <input id="tel" name="tel" class="form-control my-1" type="text" placeholder="전화번호">
                            <div id="msg_tel" class="form-text h-auto">
                                <span style='color:#dc3545'>전화번호를 '-'없이 입력해주세요.</span>
                            </div>
                        </div>
                        <!-- email input group start -->
                        <div class="input-group w-75 my-1">
                            <input id="persnal" name="persnal"class="form-control" type="text" placeholder="이메일">
                            <span class="input-group-text">@</span>
                            <!-- mail get in field start -->
                            <select id="domain" name="domain" class="form-select rounded-end">
                                <option value="" >선택</option>
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="doum.net">doum.net</option>
                                <option value="hanmail.net">hanmail.net</option>
                            </select>
                            <!-- mail get in field end -->
                        </div>
                        <input type="hidden" id="email" name="email">
                        <div id="msg_email" class="form-text w-75 h-auto">
                            <span style='color:#dc3545'>*메일주소를 입력해주세요.</span>
                        </div>
                        <div class="d-flex flex-column align-content-center w-75 mb-3">
                            <input type="hidden" id="sendcode" name="sendcode">
                            <label for="code" class="form-label m-2" style="font-weight: bold;">인증 코드 입력 : </label>
                            <div class="d-flex flex-wrap justify-content-between align-content-center">
                                <input id="code" name="code" class="form-control" style="width: 60%; height: 100%;" type="text">
                                <input id="btn_email" class="btnWide" style="width: 40%;" type="button" value="인증 메일 발송">
                            </div>
                            <div id="msg_code" class="form-text h-auto mt-2">
                                <span style='color:#dc3545;'>*사용 중인 메일주소로 인증해야 합니다.</span>
                            </div>
                            <div class="form-text h-auto mt-2" style="font-size: 0.8em;">
                                <span style='color:#198754;'>
                                    인증코드는 메일로 발송됩니다.
                                    <br>
                                    메일이 도착하지 않을 경우 스팸 메일함을 확인해주세요.
                                </span>
                            </div>
                        </div>
                        <!-- email input group end -->
                        <button id="btn_join" class="btnWide align-content-center w-75 my-1" style="height: 50px;" type="button">
                            회원 가입
                        </button>
                    </form>
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>