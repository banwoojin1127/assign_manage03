<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<!-- chart set start -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- chart set end -->
<!-- jquery set start -->
    <script src="<c:url value="/resources/js/jquery-3.7.1.min.js"/>"></script>
<!-- jquery set end -->
<!-- stylesheet group start -->
    <link rel="stylesheet" href="<c:url value="/resources/css/project_v01.css" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/admin_v01.css" />"/>
    
<!-- stylesheet group end -->
<!-- tab title start -->
    <title>비대면 과제관리</title>
<!-- tab title end -->
</head>
<body>
<!-- top main header start -->
<%@ include file="/WEB-INF/views/include/head_top_user.jsp" %>
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
                        사용자 관리
                    </button>
                </h2>
                <div id="collapseFst" class="defCollaps accordion-collapse collapse show" style="border-style:none;" data-bs-parent="#navSideBar">
                    <div id="" class="accordion-body row row-cols-2 m-0 p-0" style="width: 100%">
                        <a href="../admin/user-management.jsp" id="" class="btn d-flex col flex-wrap justify-content-center align-content-center h-50" style="width: 97%; font-weight: bold;">
                            <span>사용자 관리</span>
                        </a>
                        <div class="blank d-flex col flex-wrap m-0 p-0" style="width: 3%;"></div>
                        <a href="../admin/teacher-signup.jsp" id="" class="btn d-flex col flex-wrap justify-content-center align-content-center h-50" style="width: 97%;">
                            <span>교사 등록</span>
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
                        강의 관리
                    </button>
                </h2>
                <div id="collapseSnd" class="defCollaps accordion-collapse collapse" style="border-style:none;" data-bs-parent="#navSideBar">
                    <div id="" class="accordion-body row row-cols-2 m-0 p-0" style="width: 100%">
                        <a href="../admin/lecture-management.jsp" id="" class="btn d-flex col flex-wrap justify-content-center align-content-center h-50" style="width: 97%;">
                            <span>강의 관리</span>
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
                        과제 관리
                    </button>
                </h2>
                <div id="collapseTrd" class="defCollaps accordion-collapse collapse" style="border-style:none;" data-bs-parent="#navSideBar">
                    <div id="" class="accordion-body row row-cols-2 m-0 p-0" style="width: 100%">
                        <a href="../admin/assignment-list.jsp" id="" class="btn d-flex col flex-wrap justify-content-center align-content-center h-50" style="width: 97%;">
                            <span>과제 관리</span>
                        </a>
                        <div class="blank d-flex col flex-wrap m-0 p-0" style="width: 3%;"></div>
                    </div>
                </div>
            </div>
            <div id="accordionFth" class="defCollaps accordion-item">
                <h2 id="" class="accordion-header">
                    <button id="" class="accordion-button collapsed "
                        style="font-weight: bold; color: white; background-color: #223964;" type="button"
                        data-bs-toggle="collapse" data-bs-target="#collapseFth" aria-expanded="false"
                        aria-controls="collapseFth">
                        개인 통계
                    </button>
                </h2>
                <div id="collapseFth" class="defCollaps accordion-collapse collapse" style="border-style:none;" data-bs-parent="#navSideBar">
                    <div id="" class="accordion-body row row-cols-2 m-0 p-0" style="width: 100%">
                        <a href="../teacher/statistics.jsp" id="" class="btn d-flex col flex-wrap justify-content-center align-content-center h-50" style="width: 97%; font-weight: bold;">
                            <span>통계</span>
                        </a>
                        <div class="blank d-flex col flex-wrap m-0 p-0" style="width: 3%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- side nav menu accordion end -->

<div id="marginhead">

<!-- content field start -->