<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<jsp:include page="../header.jsp" />
<c:forEach var="info" items="${memberInfo}">
    <div class="container px-4 py-5" id="featured-3">
        <div class="card mb-5 bg-light">
            <div class="card-body">
                <h2>마이페이지</h2>

                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th class="w-25" scope="col">필수정보</th>
                            <th scope="col"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="w-25">아이디</td>
                            <td>${info.member_id}</td>
                        </tr>
                        <tr>
                            <td class="w-25">비밀번호</td>
                            <td>*****</td>
                        </tr>
                        <tr>
                            <td class="w-25">닉네임</td>
                            <td>${info.member_name}</td>
                        </tr>
                        <tr>
                            <td class="w-25">이름</td>
                            <td>${info.member_name}</td>
                        </tr>
                        <tr>
                            <td class="w-25">전화번호</td>
                            <td>${info.member_phone}</td>
                        </tr>
                        <tr>
                            <td class="w-25">이메일</td>
                            <td>${info.member_email}</td>
                        </tr>
                        <tr>
                            <td class="w-25">주소</td>
                            <td>${info.member_address} ${info.member_extraAddress} ${info.member_detailAddress}</td>
                        </tr>
                        <tr style="text-align: center;">
                            <td colspan="2">
                                <a href="/memberModify">수정하기</a>
                                <a href="/">Home</a>
                                <a href="/withdrawal">탈퇴하기</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
<jsp:include page="../footer.jsp" />
</body>
</html>