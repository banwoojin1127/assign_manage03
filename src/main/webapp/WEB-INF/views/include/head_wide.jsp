<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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



<!-- jquery set start -->
    <script src="<c:url value='/resources/js/jquery-3.7.1.min.js'/>"></script>
<!-- jquery set end -->
<!-- stylesheet group start -->
    <link rel="stylesheet" href="<c:url value='/resources/css/project_v01.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/wide_v01.css'/>"/>
    
<!-- stylesheet group end -->
<!-- tab title start -->
    <title>비대면 과제관리</title>
<!-- tab title end -->
</head>
<body>
<!-- top main header start -->
<%@ include file="/WEB-INF/views/include/head_top_none.jsp" %>
<!-- top main header end -->
<!-- side nav menu accordion end -->
    <div id="" class="d-flex flex-wrap" style="padding-top: 200px;">
<!-- content field start -->