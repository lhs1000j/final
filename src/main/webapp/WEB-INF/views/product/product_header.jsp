<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-21
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    <link rel="stylesheet" href="/css/normalize.css">--%>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
    .hori{list-style: none; display: flex; justify-content: space-around;}
    /*li{margin: 0 10px;}*/
    ul{margin-bottom: 0; height: 50px}
    </style>
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
            <ul class="nav" style="height: 41px;">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="product">판매/재고</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="product_manager">상품관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="product_upload">상품등록</a>
                </li>
            </ul>
            <ul class="nav" style="height: 41px;">
                <li>
                  <a class="nav-link" aria-current="page" href="/">홈페이지</a>
                </li>
                <c:if test="${sessionScope.get('member_class') == 1}">
                  <li>
                    <a class="nav-link" aria-current="page" href="/mypage">마이페이지</a>
                  </li>
                </c:if>
                <c:if test="${sessionScope.get('member_class') == 0}">
                  <li>
                    <a class="nav-link" aria-current="page" href="#">관리자페이지</a>
                  </li>
                </c:if>
                <li>
                  <c:if test="${sessionScope.get('member_id') != null}">
        <%--            <input type="button" value="로그아웃">--%>
                    <a class="nav-link" aria-current="page" href="logout">로그아웃</a>
                  </c:if>
                  <c:if test="${sessionScope.get('member_id')== null}">
        <%--            <input type="button" value="로그인">--%>
                    <a class="nav-link" aria-current="page" href="loginCheck">로그인</a>
                  </c:if>
                </li>
            </ul>
        </nav>
    </div>
</header>
</body>
</html>
