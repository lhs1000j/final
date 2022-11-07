<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-28
  Time: 오후 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<header>
    <div class="logo">
        <a href="/"><img src="img/logo.png" alt="logo"></a>
        <h1>Green Book</h1>
    </div>
    <div>
        <nav class="nav nav-tabs">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="book_list?largeCategory=국내도서">국내도서</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="book_list?largeCategory=외국도서">외국도서</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="book_list?largeCategory=eBook">eBook</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="book_list?largeCategory=웹소설/코믹">웹소설/코믹</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="book_list?largeCategory=중고샵">중고샵</a>
                </li>
            </ul>
            <ul class="nav">
                <li class="nav-item">
                <c:choose>
                    <c:when test="${empty sessionScope.member_id}">
                        <a class="nav-link" aria-current="page" href="/login">로그인</a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link" aria-current="page" href="/logout">로그아웃</a>
                    </c:otherwise>
                </c:choose>
                </li>
                <li class="nav-item">
                    <c:if test="${not empty sessionScope.member_id}">
                        <a class="nav-link" aria-current="page" href="/mypage">마이페이지</a>
                    </c:if>
                </li>
                <li class="nav-item">
                    <c:if test="${sessionScope.member_class ne 2 and not empty sessionScope.member_class}">
                        <a class="nav-link" aria-current="page" href="/cart">장바구니</a>
                    </c:if>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/list">고객센터</a>
                </li>
            </ul>
        </nav>
    </div>
</header>
</body>
</html>
