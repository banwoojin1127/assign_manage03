//userInfo.js
//중복되었는지 검사용
let dupCheckID = "";
let dupCheckTel = "";
let dupCheckEmail = "";
let sessionLogin = "";

// 메일을 수정하는지 확인용
let changeEmail = false;

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
		CheckBeforeDoing();
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
        if(sessionLogin == "" || sessionLogin == null)
        {
            $("#msg_pw").html("<span style='color:#dc3545'>*비밀번호를 입력해주세요.</span>");
            return;
        }else
        {
            $("#msg_pw").html("<span style='color:#198754'>*변경을 원하시는 경우에만 입력해주세요.</span>");
            return;
        }
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
        if(sessionLogin == "")
        {
            $("#msg_pwConfirm").html("<span style='color:#dc3545'>*동일한 비밀번호를 입력해주세요.</span>");
            return;
        }else
        {
            $("#msg_pwConfirm").html("<span style='color:#198754'>*변경을 원하시는 경우에만 입력해주세요.</span>");
            return;
        }
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
    $("#msg_tel").html(""); // 이전 메시지를 초기화

    if (sessionLogin == "" || sessionLogin == null) {
        // 1. **로그인하지 않은 경우 (필수 입력)**
        if (tel == "") {
            $("#msg_tel").html("<span style='color:#dc3545'>*전화번호를 입력해주세요.</span>");
            return; // 필수 입력이므로 함수 종료
        } else if (!require.test(tel)) {
            $("#msg_tel").html("<span style='color:#dc3545'>*전화번호를 '-'없이 9~11자리로 입력해주세요.</span>");
            return; // 유효성 검사 실패 시 함수 종료
        }
        // 유효성 검사 통과: 다음 로직으로 진행 (예: 중복 확인 또는 폼 제출)
        $("#msg_tel").html("<span style='color:#198754'>사용 가능한 전화번호 형식입니다.</span>");

    } else { // sessionLogin != ""
        // 2. **로그인한 경우 (선택적 입력 - 변경 시에만 입력)**
        if (tel == "") {
            // 전화번호를 입력하지 않았음 = 변경하지 않음.
            // 폼 제출은 막지 않고 안내 메시지만 표시하며, AJAX 호출을 건너뛰기 위해 return 합니다.
            $("#msg_tel").html("<span style='color:#198754'>*변경을 원하시는 경우에만 입력해주세요.</span>");
            // 변경하지 않는 경우 중복 검사를 할 필요가 없으므로 여기서 함수를 종료합니다.
            // 만약 서버에서 전화번호 필드가 비어있어도 기존 정보를 유지하도록 처리한다면 이 return은 적절합니다.
            return; 
        } else if (!require.test(tel)) {
            // 전화번호를 입력했지만 유효성 검사 실패
            $("#msg_tel").html("<span style='color:#dc3545'>*전화번호를 '-'없이 9~11자리로 입력해주세요.</span>");
            return; // 유효성 검사 실패 시 함수 종료
        } else {
            // 전화번호를 입력했고, 유효성 검사 통과 (변경 예정)
            $("#msg_tel").html("<span style='color:#198754'>사용 가능한 전화번호 형식입니다.</span>");
        }
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
                if(sessionLogin != "" && tel == sessionTel) {
                    // 로그인한 상태에서 기존 전화번호와 동일한 경우 (변경하지 않음)
                    dupCheckTel = "NOT_DUPLICATED"; // 중복 아님으로 처리
                    // 기존 전화번이라는 안내 메시지 추가
                    $("#msg_tel").html("<span style='color:#198754'>현재 사용 중인 전화번호입니다.</span>"); 
                } else {
                    $("#msg_tel").html("<span style='color:#dc3545'>*이미 등록 된 전화번호입니다.</span>");
                }
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
    $("#msg_email").html(""); // 이전 메시지를 초기화

    if (sessionLogin == "" || sessionLogin == null) {
        // 1. **로그인하지 않은 경우 (필수 입력)**
        if (persnal == "" || domain == "") {
            $("#msg_email").html("<span style='color:#dc3545'>*메일주소를 입력해주세요.</span>");
            return; // 필수 입력이므로 함수 종료
        } else if (!require.test(email)) {
            $("#msg_email").html("<span style='color:#dc3545'>*불가능한 메일주소 형식입니다.</span>");
            return; // 유효성 검사 실패 시 함수 종료
        }
        // 유효성 검사 통과 메시지
        $("#msg_email").html("<span style='color:#198754'>사용 가능한 메일주소 형식입니다.</span>");

    } else { // sessionLogin != ""
        // 2. **로그인한 경우 (선택적 입력 - 변경 시에만 입력)**
        if (persnal == "" || domain == "") {
            // 이메일을 입력하지 않았음 = 변경하지 않음.
            changeEmail = false;
            // 폼 제출은 막지 않고 안내 메시지만 표시하며, AJAX 호출을 건너뛰기 위해 return 합니다.
            $("#msg_email").html("<span style='color:#198754'>*변경을 원하시는 경우에만 입력해주세요.</span>");
            // 변경하지 않는 경우 중복 검사를 할 필요가 없으므로 여기서 함수를 종료합니다.
            // 만약 서버에서 이메일 필드가 비어있어도 기존 정보를 유지하도록 처리한다면 이 return은 적절합니다.
            return; 
        } else if (!require.test(email)) {
            // 이메일을 입력했지만 유효성 검사 실패
            $("#msg_email").html("<span style='color:#dc3545'>*불가능한 메일주소 형식입니다.</span>");
            return; // 유효성 검사 실패 시 함수 종료
        } else {
            // 이메일을 입력했고, 유효성 검사 통과 (변경 예정)
            $("#msg_email").html("<span style='color:#198754'>변경될 메일주소 형식입니다.</span>");
        }
    }
    
    // 유효성 검사를 통과하고, 로그인 상태일 때 입력이 비어있지 않은 경우에만 AJAX 호출
    $.ajax({
        url : "dupliemail?email=" + email,
        type: "get",
        dataType: "html",
        success : function(res)
        {
            res = res.trim();
            
            // 이메일 중복 검사 결과를 기억한다.
            dupCheckEmail = res;
            
            switch(res)
            {
            case "ERROR":
                $("#msg_email").html("<span style='color:#dc3545'>!!! 중복검사 오류가 발생했습니다. !!!</span>");
                break;
            case "DUPLICATED":                
                if(sessionLogin != "" && email == sessionEMail) {
                    // 로그인한 상태에서 기존 이메일과 동일한 경우 (변경하지 않음)
                    changeEmail = false;
                    dupCheckEmail = "NOT_DUPLICATED"; // 중복 아님으로 처리
                    // 기존 메일이라는 안내 메시지 추가
                    $("#msg_email").html("<span style='color:#198754'>현재 사용 중인 메일주소입니다.</span>"); 
                } else {
                    $("#msg_email").html("<span style='color:#dc3545'>*이미 등록 된 메일주소입니다.</span>");
                }
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
    $("#msg_afterSand").html("");
    persnal = $("#persnal").val();
    domain = $("#domain").val();
	if( persnal == "" || domain == "" )
	{
		$("#msg_email").html("<span style='color:#dc3545'>*메일주소를 입력해주세요.</span>");
		$("#email").focus();
		return;
    }
    if( sessionLogin != "" )
    {
        changeEmail = true;
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
                $("#msg_afterSand").html("<span style='color:#198754;'>인증코드는 메일로 발송됩니다.<br>메일이 도착하지 않을 경우 스팸 메일함을 확인해주세요.</span>");
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
function CheckBeforeDoing()
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
        if(sessionLogin == "")
        {
            $("#msg_pw").html("<span style='color:#dc3545'>*비밀번호를 입력해주세요.</span>");
            $("#pw").focus();
            MovePostion();
            return;
        }else
        {
            $("#msg_pw").html("<span style='color:#dc3545'></span>");
        }
    }
    if($("#pw").val() != $("#pwConfirm").val())
    {
        if(sessionLogin == "")
        {
            $("#msg_pwConfirm").html("<span style='color:#dc3545'>*동일한 비밀번호를 입력해주세요.</span>");
            $("#pwConfirm").focus();
            MovePostion();
            return;
        }else
        {
            $("#msg_pwConfirm").html("<span style='color:#dc3545'></span>");
        }
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
        if(sessionLogin == "")
        {
            $("#msg_birth").html("<span style='color:#dc3545'>*생년월일을 선택해주세요.</span>");
            $("#year").focus();
            return;
        }else
        {
            $("#msg_birth").html("<span style='color:#dc3545'></span>");
        }
    }
    if($("#tel").val() == "")
    {
        if(sessionLogin == "")
        {
            $("#msg_tel").html("<span style='color:#dc3545'>*전화번호를 입력해주세요.</span>");
            $("#tel").focus();
            return;
        }else
        {
            $("#msg_tel").html("<span style='color:#dc3545'></span>");
        }
    }
    if($("#persnal").val() == "" || $("#domain").val() == "")
    {
        if(sessionLogin == "")
        {
            $("#msg_email").html("<span style='color:#dc3545'>*메일주소를 입력해주세요.</span>");
            $("#persnal").focus();
            return;
        }else
        {
            $("#msg_email").html("<span style='color:#dc3545'></span>");
        }
    }
    
    //아이디 중복문제 미해결 시 submit 중지
    if( dupCheckID != "NOT_DUPLICATED")
    {
        alert("*사용 가능한 아이디가 아닙니다.");
        return ;
    }
    //전화번호 중복문제 미해결 시 submit 중지
    if( dupCheckTel != "NOT_DUPLICATED")
    {
        alert("*사용 가능한 전화번호가 아닙니다.");
        return ;
    }
    //메일주소 중복문제 미해결 시 submit 중지
    if( dupCheckEmail != "NOT_DUPLICATED")
    {
        alert("*사용 가능한 메일주소가 아닙니다.");
        return ;
    }
    
    //메일 인증문제 미해결 시 submit 중지
    if( sessionLogin == "" || changeEmail )
    {
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
    }

    if( sessionLogin == "" )
    {
        //가입 의사 재확인
        if(confirm("회원가입을 진행하시겠습니까?") == false)
        {
            return;
        }
        else
        {
            $("#join").submit();
        }
    }else if( sessionLogin != "" )
    {
        //수정 의사 재확인
        if(confirm("회원정보 수정을 진행하시겠습니까?") == false)
        {
            return;
        }
        else
        {
            $("#InfoModify").submit();
        }
    }else
    {
        alert("알 수 없는 오류가 발생했습니다.");
        return;
    }
}