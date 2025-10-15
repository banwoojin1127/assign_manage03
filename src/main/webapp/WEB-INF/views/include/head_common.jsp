<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- bootstrap preset start -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>
<!-- bootstrap preset end -->
<!-- jquery set start -->
    <script src="../../resources/js/jquery-3.7.1.min.js"></script>
<!-- jquery set end -->
<!-- stylesheet group start -->
    <link rel="stylesheet" href="../../resources/css/project_v01.css"/>
    <link rel="stylesheet" href="../../resources/css/wide_v01.css"/>
<!-- stylesheet group end -->
<!-- tab title start -->
    <title>비대면 과제관리</title>
<!-- tab title end -->
</head>
<body>
<!-- top main header start -->
    <div id="mainHeader" 
        class="justify-content-center align-content-start offcanvas offcanvas-top show m-0 p-0"
        data-bs-scroll="true" data-bs-backdrop="false" data-bs-keyboard="false" tabindex="-1" 
        aria-labelledby="offcanvasLabel"
        style="width: 100vw; height: min-content; z-index: 1046;">
        <div id="headerUser" class="d-flex justify-content-end align-content-center flex-wrap" style="height: 50px;">
            <span class="d-flex align-content-center flex-wrap" style="height: 50px;">
                <span id="">반갑습니다. 홍길동 님</span>
            </span>
            &nbsp;&nbsp;&nbsp;
            <span class="d-flex align-content-center flex-wrap h-100">
                <a href="../common/my-page.jsp" id="" class="darkBtn btn rounded" style="height: 75%;">마이 페이지</a>
            </span>
            &nbsp;&nbsp;&nbsp;
            <span class="d-flex align-content-center flex-wrap h-100">
                <a href="../common/login.jsp" id="" class="darkBtn btn rounded" style="height: 75%;">로그아웃</a>
            </span>
            &nbsp;&nbsp;&nbsp;
        </div>
        <div id="headerTitle" class="d-flex justify-content-between flex-wrap" style="height: 150px;">
            <div id="documentTitle" class="d-flex flex-wrap align-content-center">
                <p>
                    비대면 과제관리<br>
                    시스템
                </p>
            </div>
        </div>
    </div>
<!-- top main header end -->
<!-- side nav menu accordion start -->
    <div id="panelNav" class="offcanvas offcanvas-bottom show" 
        data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" 
        aria-labelledby="offcanvasLabel"
        style="width: 256px; height: 100vh;">
        <div id="navSideBar" class="accordion accordion-flush" style="background-color: #223964;">
            <div id="accordionFst" class="defCollaps accordion-item">
                <h2 id="" class="accordion-header ">
                    <button id="" class="accordion-button"
                        style="font-weight: bold; color: white; background-color: #223964;" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseFst" aria-expanded="true"
                        aria-controls="collapseFst">
                        관리자
                    </button>
                </h2>
                <div id="collapseFst" class="defCollaps accordion-collapse collapse show" style="border-style:none;" data-bs-parent="#navSideBar">
                    <div id="" class="accordion-body row row-cols-2 m-0 p-0" style="width: 100%">
                        <a href="../admin/user-management.jsp" id="" class="btn d-flex col flex-wrap justify-content-center align-content-center h-50" style="width: 97%; font-weight: bold;">
                            <span>관리자</span>
                        </a>
                        <div class="blank d-flex col flex-wrap m-0 p-0" style="width: 3%;"></div>
                    </div>
                </div>
            </div>
            <div id="accordionSnd" class="defCollaps accordion-item">
                <h2 id="" class="accordion-header ">
                    <button id="" class="accordion-button collapsed "
                        style="font-weight: bold; color: white; background-color: #223964;" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseSnd" aria-expanded="false"
                        aria-controls="collapseSnd">
                        교사
                    </button>
                </h2>
                <div id="collapseSnd" class="defCollaps accordion-collapse collapse" style="border-style:none;" data-bs-parent="#navSideBar">
                    <div id="" class="accordion-body row row-cols-2 m-0 p-0" style="width: 100%">
                        <a href="../teacher/teacher-main.jsp" id="" class="btn d-flex col flex-wrap justify-content-center align-content-center h-50" style="width: 97%; font-weight: bold;">
                            <span>교사</span>
                        </a>
                        <div class="blank d-flex col flex-wrap m-0 p-0" style="width: 3%;"></div>
                    </div>
                </div>
            </div>
            <div id="accordionTrd" class="defCollaps accordion-item">
                <h2 id="" class="accordion-header ">
                    <button id="" class="accordion-button collapsed "
                        style="font-weight: bold; color: white; background-color: #223964;" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseTrd" aria-expanded="false"
                        aria-controls="collapseTrd">
                        학생
                    </button>
                </h2>
                <div id="collapseTrd" class="defCollaps accordion-collapse collapse" style="border-style:none;" data-bs-parent="#navSideBar">
                    <div id="" class="accordion-body row row-cols-2 m-0 p-0" style="width: 100%">
                        <a href="../student/stundent-main.jsp" id="" class="btn d-flex col flex-wrap justify-content-center align-content-center h-50" style="width: 97%; font-weight: bold;">
                            <span>학생</span>
                        </a>
                        <div class="blank d-flex col flex-wrap m-0 p-0" style="width: 3%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- side nav menu accordion end -->
    <div id="" style="margin-top: 200px; margin-left: 256px;">
<!-- content field start -->