<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-21
  Time: 오후 5:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        td {
            background-color: white;
        }
        span {
            color: red;
            font-weight: bold;
        }
        .table {
            table-layout: fixed;
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
<div class="boxes" style="width: 95%; height: 95%">
    <h3>판매관리 현황</h3>
    <table class="table table-bordered">
        <tr class="table-info">
            <td>신규 주문</td>
            <td>발송처리 예정</td>
            <td>배송중</td>
        </tr>
        <tr class="table-light">
            <td><span>{}</span> 건</td>
            <td><span>{}</span> 건</td>
            <td><span>{}</span> 건</td>
        </tr>
        <tr class="table-info">
            <td>정상예정</td>
            <td>반품접수</td>
            <td>반품입고 처리</td>
        </tr>
        <tr class="table-light">
            <td><span>{}</span> 건</td>
            <td><span>{}</span> 건</td>
            <td><span>{}</span> 건</td>
        </tr>
    </table>
</div>
</body>
</html>
