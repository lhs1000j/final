<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="styleSheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <link rel="styleSheet" href="css/buyOk.css">
    <link rel="stylesheet" href="js/jquery.min.js">
</head>
<body>

<main>
    <jsp:include page="../header.jsp"></jsp:include>
    <div class="content">
        <h4 class="title">주문내역</h4>
        <table border="1" class="content_tb">
            <tr class="content_tb_top">
                <td style="width: 150px;">주문번호</td>
                <td style="width: 450px;">상품</td>
                <td style="width: 100px;">수량</td>
                <td style="width: 100px;">상품금액</td>
                <td style="width: 100px;">배송정보</td>
                <td style="width: 150px;">주문취소</td>
            </tr>
            <script>
                let i = 0;
                let price = [];
            </script>

            <c:forEach items="${orderList}" var="orderList1">
                <tr>
                    <input type="hidden" class="book_order_number_input" name="book_order_number" value="${orderList1.book_order_number}">
                    <input type="hidden" name="order_date" value="${order_date}">
                    <td>${orderList1.book_order_number}</td>
                    <td>${orderList1.book_title}<br>
                    <td>${orderList1.book_count}권</td>
                    <td>${orderList1.book_price*orderList1.book_count}원</td>
                    <td>오늘</td>
                    <td>
                        <input class="btn-outline-success1 oder_bt my-2" type="button" value="주문취소" onclick="location.href='orderDelete?book_order_number=${orderList1.book_order_number}'">
                    </td>
                </tr>
                <script>
                    price[i] = ${orderList1.book_price*orderList1.book_count};
                    console.log(price[i]);

                    i++;
                    console.log(i);
                </script>
            </c:forEach>

        </table>
    </div>
    <div class="Information">
        <table border="1" class="Info_table" style="width: 1100px;">
            <tr class="Info_td1">
                <td>총 상품금액 <br>
                    <script>
                        let j = 0;
                        let totalMoney = 0;
                        for(j; j<i; j++) {
                            totalMoney += price[j];
                        }
                        document.write(totalMoney);
                    </script>원
                </td>
                <!--<td><p>총 추가금액</p></td>
                <td><p>총 할인금액</p></td>
                <td><p>최종 결제금액</p></td>-->
            </tr>
        </table>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
</main>

</body>
</html>
