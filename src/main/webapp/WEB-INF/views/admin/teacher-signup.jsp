<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/head_admin.jsp" %>
<!-- content field start -->
        <div id="panelContent" class="d-flex flex-wrap justify-content-center align-content-center p-5" style="width: 100%;">
            <div id="formJoin" class="d-flex flex-wrap justify-content-center align-content-center p-0 m-0" style="min-width: 500px; max-width: 500px;">
                <div id="formJoinTitle" class="d-flex flex-wrap align-content-start my-3" style="width: 100%;">
                    <div id="" class="decoWideTitle" style="width: 12px;"></div>
                    &nbsp;&nbsp;
                    <div id="" class="textWideTitle d-flex flex-wrap align-content-center px-1" style="width: 95%;">
                        <p class="m-0" style="font-size: 1.5em;">교사 회원가입</p>
                    </div>
                </div>
                <div id="formJoinRequest" class="col-12 d-flex flex-wrap justify-content-center align-content-center border border-dark border-1 rounded py-5">
                    <input id="" class="form-control w-75 my-1" name="" type="text" placeholder="아이디"><br>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        아이디를 입력하세요.
                        <br>
                        아이디는 5~20자의 영문 소문자, 숫자와 <br>특수기호(_),(-)만 사용 가능합니다.
                        <br>
                        중복된 아이디입니다.
                    </div>
                    <input id="" class="form-control w-75 my-1" name="" type="password" placeholder="비밀번호"><br>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        비밀번호를 입력하세요.
                        <br>
                        비밀번호: 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해 주세요.
                    </div>
                    <input id="" class="form-control w-75 my-1" name="" type="password" placeholder="비밀번호 확인"><br>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        비밀번호가 일치하지 않습니다.
                    </div>
                    <!-- email input group start -->
                    <div class="input-group w-75 my-1">
                        <input class="form-control" name="" type="text" placeholder="이메일">
                        <span class="input-group-text">@</span>
                        <!-- mail dropdown get in field start -->
                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Dropdown
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="#">naver.com</a></li>
                            <li><a class="dropdown-item" href="#">gmail.com</a></li>
                            <li><a class="dropdown-item" href="#">doum.net</a></li>
                            <li><a class="dropdown-item" href="#">hanmail.net</a></li>
                        </ul>
                        <!-- mail dropdown get in field end -->
                    </div>
                    <!-- email input group start -->
                    <br>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        이메일을 입력해주세요.
                        <br>
                        이미 등록된 이메일 주소입니다.
                    </div>
                    <input id="" class="form-control w-75 my-1" name="" type="text" placeholder="이름"><br>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        이름을 입력해주세요.
                    </div>
                    <input id="" class="form-control w-75 my-1" name="" type="text" placeholder="생년월일"><br>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        생년월일을 입력해주세요.
                    </div>
                    <div id="genderSelectGroup" class="btn-group w-75 my-1">
                        <input id="genderM" class="val-gender btn-check" name="options" type="radio" autocomplete="off">
                        <label id="" class="btn-gender btn" for="genderM">남성</label>
                        <input id="genderF" class="val-gender btn-check" name="options" type="radio" autocomplete="off">
                        <label id="" class="btn-gender btn" for="genderF">여성</label>
                    </div>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        성별을 선택해주세요.
                    </div>
                    <input id="" class="form-control w-75 my-1" name="" type="text" placeholder="전화번호"><br>
                    <div id="" class="helpWideRequest form-text w-75 h-auto">
                        전화번호를 입력해주세요.
                        <br>
                        이미 등록된 전화번호입니다.
                    </div>
                    <a href="user-management.jsp" id="btnWideRequest" name="tsignup" onclick="tsignup()" class="btn align-content-center w-75 my-1" style="height: 50px;" type="button">교사 등록</a>
                </div>
            </div>
        </div>
<!-- content field end -->
<%@ include file="../include/tail.jsp" %>