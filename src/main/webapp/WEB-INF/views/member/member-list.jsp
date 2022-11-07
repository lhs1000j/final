<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<title>조회 결과</title>
</head>
<body>
<div class="container">
    <br><h3>회원 정보 목록</h3>
    <br>
    <table class="table">
        <thead>
        <tr align="center" bgcolor="#eaffd0">
            <th>아이디</th>
            <th>이름</th>
            <th>주소</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="mvo">
            <tr align="center">
                <td>${mvo.id}</td>
                <td>${mvo.name}</td>
                <td>${mvo.address}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>