<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="styleSheet" href="css/bootstrap.min.css">
    <link rel="styleSheet" href="css/orderOk.css">
    <link rel="stylesheet" href="js/jquery.min.js">
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<main style="margin-top: 100px;">
    <div class="content" style="position: relative;">
        <h4 class="title_name">주문내역서</h4>
        <div class="product">
                <p class="productTitle">상품명: ${book_title}</p>
                <p class="productDescription">주문수량:1개</p>
                <p class="productPrice">가격: ${book_price}원</p>
        </div>
        <div class="address">
            <c:forEach var="info" items="${memberInfo}">
                <p class="memberName">이름: ${info.member_name}</p>
                <p class="addrNumber">우편번호: ${info.member_postcode}</p>
                주소:
                <p class="addr">${info.member_address}<br>${info.member_detailAddress}<br>${info.member_extraAddress}</p>
            </c:forEach>
        </div>
        <a href="/" style="position: absolute; bottom: 50px; right: 580px;"><img src="img/logo.png" alt=""></a>
    </div>
</main>
<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>
