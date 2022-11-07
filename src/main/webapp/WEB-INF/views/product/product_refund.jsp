<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-11-01
  Time: 오후 2:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
        td {
            background-color: white;
        }
        span {
            color: red;
            font-weight: bold;
        }
        .boxes {
            background-color: rgba(150, 200, 255, 0.3);
            padding: 10px;
            margin: 10px;
            border-radius: 1em;
        }
    </style>
</head>
<body>
<h3>환불 요청</h3>
<div class="boxes" style="width: 95%;">
    <table class="table table-bordered">
        <tr class="table-info">
            <td>환불 번호</td>
            <td>주문 번호</td>
            <td>수량</td>
            <td>환불 이유</td>
            <td>이미지</td>
            <td>주문자</td>
            <td>반  품</td>
        </tr>
        <c:forEach items="${refundList}" var="refund" varStatus="status">
            <tr class="table-light">
                <td>
                    ${refund.refund_reason}
                </td>
                <td>
                    ${refund.book_order_number}
                </td>
                <td>
                    ${refund.book_stock}
                </td>
                <td>
                    ${refund.refund_reason}
                </td>
                <td>
                    ${refund.refund_img}
                </td>
                <td>
                    ${refund.member_id}
                </td>
                <td>
                    <input type="button" onclick="location.href='product_refund'" value="환불처리">
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
