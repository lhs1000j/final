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
        .btn-warning {
            display: block;
            margin: 5px auto;
            padding: 2px;
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
<div class="boxes" style="width: 95%;">
    <h3>상품현황</h3>
    <table class="table table-bordered">
        <tr>
            <td class="table-warning">판매중인 상품</td>
            <td class="table-light"><span>${param.selling}</span> 건</td>
            <td class="table-light" rowspan="3" style="text-align: center;">
                <div style="display: flex; flex-direction: column; justify-content: space-around; flex-wrap: nowrap; height: 100%">
                    <input class="btn btn-warning" type="button" value="상품 등록 >" onclick="location.href='product_upload'">
                    <input class="btn btn-warning" type="button" value="상품 관리 >" onclick="location.href='product_manager'">
                    <input class="btn btn-warning" type="button" value="반품 처리 >" onclick="location.href='product_manager?'">
<%--                    <input class="btn btn-warning" type="button" value="판매 연장 >" onclick="window.open('product_extended_period','test','width=450px,height=450px')">--%>
                </div>
            </td>
        </tr>
        <tr>
            <td class="table-warning">판매완료된 상품</td>
            <td class="table-light"><span>${param.stockOut}</span> 건</td>
        </tr>
        <tr>
            <td class="table-warning">반품접수된 상품</td>
            <td class="table-light"><span>${param.refunded}</span> 건</td>
        </tr>
    </table>
</div>
</body>
</html>
