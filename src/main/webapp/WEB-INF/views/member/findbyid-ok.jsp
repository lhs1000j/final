<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<title>회원정보 검색 결과</title>
</head>
<body>
<div class="container">

  <br><h3>${requestScope.memberVO.name}님의 회원정보</h3><br>
  <table class="table">
    <thead>
    <tr bgcolor="pink">
      <th>아이디</th>
      <th>비밀번호</th>
      <th>이름</th>
      <th>주소</th>
    </tr>
    </thead>
    <tbody>
    <tr align="center">
      <td>${memberVO.id}</td>
      <td>${memberVO.password}</td>
      <td>${memberVO.name}</td>
      <td>${memberVO.address}</td>
    </tr>
    </tbody>
  </table>
</div>
</body>
</html>
