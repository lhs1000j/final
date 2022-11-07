<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-11-03
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
        .boxes {
            background-color: rgba(150, 200, 255, 0.3);
            padding: 10px;
            margin: 10px;
            border-radius: 1em;
        }
    </style>
</head>
<body>
    <jsp:include page="../header.jsp"></jsp:include>
    <div class="boxes">
        <h3>환불 신청</h3>
        <form method="post" action="product_uploadOk" enctype="multipart/form-data">
            <table class="table table-bordered" style="table-layout: fixed; background-color: #f7f7f7;">
                <tr>
                    <td rowspan="8">
                        <input type="file" accept="image/*" name="imgfile" id="image" onchange="thumbNail(event)">
                        <div id="image_container">
                            <img src="https://via.placeholder.com/100x150" alt="" id="preview_image">
                        </div>
                    </td>
                    <td rowspan="1">상품명</td>
                    <td colspan="3" rowspan="1">
                        <input type="text" name="bookTitle" size="50" placeholder="상품명" readonly>
                        <input type="hidden" name="member_id" value="" readonly>
                    </td>
                </tr>
                <tr>
                    <td rowspan="5">상품 상세 설명</td>
                    <td colspan="3" rowspan="5">
                        <textarea style="width: 100%; height: 100%;"></textarea>
                    </td>
                </tr>
            </table>
            <div style="text-align: center;">
                <input type="submit" name="" id="" value="등록" class="btn btn-secondary">
            </div>
        </form>
    </div>
</body>
</html>
