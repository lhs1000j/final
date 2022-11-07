<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="styleSheet" href="css/bootstrap.css">
    <link href="js/bootstrap.js">
    <link rel="styleSheet" href="css/buy_ok.css">
    <link rel="stylesheet" href="js/jquery.min.js">
</head>
<body>
<main>
    <div class="content">
        <h1>이용해 주셔서 감사합니다.</h1><br>
        <div class="line"></div>
        <h4 class="title">주문내역</h4>
        <table border="1" class="content_tb">
            <tr class="content_tb_top">
                <td style="width: 50px;">선택</td>
                <td style="width: 150px;">주문번호</td>
                <td style="width: 450px;">상품</td>
                <td style="width: 100px;">수량</td>
                <td style="width: 100px;">상품금액</td>
                <td style="width: 100px;">배송정보</td>
                <td style="width: 150px;">주문취소</td>
            </tr>
            <c:forEach items="${cart}" var="cart">
                <tr>
                    <td class="allCk"><input name="ckbx" type="checkbox"></td>
                    <td>주문번호 들어올곳</td>
                    <td>${cart.book_title} <br>
                    <td>1</td>
                    <td>${cart.book_price}</td>
                    <td>오늘</td>
                    <td>
                        <input class="btn-outline-success1 oder_bt my-2" type="button" value="주문취소" onclick="location.href='delete?book_id=${cart.book_id}'">
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="Information">
        <table border="1" class="Info_table" style="width: 1100px;">
            <tr class="Info_td1">
                <td><p>총 상품금액 <br> 19800원</p></td>
                <td><p>총 추가금액</p></td>
                <td><p>총 할인금액</p></td>
                <td><p>최종 결제금액</p></td>
            </tr>
        </table>
    </div>
</main>
</body>
</html>
