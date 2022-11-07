<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Book</title>
    <link rel="styleSheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.min.js"></script>
    <link rel="styleSheet" href="../css/main.css">
</head>

<body>
<jsp:include page="../header.jsp"></jsp:include>
<main>

    <form method="post" action="cartCountUpdate?total_price=<:c:out></:c:out>">
    <div class="content">
        <h4 class="title">그린북 배송</h4>
        <table border="1" class="content_tb" style="width: 1200px;">
            <tr class="content_tb_top">
                <td style="width: 150px;">이미지</td>
                <td style="width: 450px;">상품정보</td>
                <td style="width: 100px;">수량</td>
                <td style="width: 100px;">상품금액</td>
                <td style="width: 100px;">배송정보</td>
                <td style="width: 150px;">삭제</td>
            </tr>

            <c:forEach items="${cart}" var="cart" varStatus="status">
                <c:set var="thumbnail" value="thumbnail${status.index}" />
                    <tr>
                        <td class="cart_info_td" style="display: none;">
                            <input type="hidden" class="book_id_input" name="book_id" value="${cart.book_id}">
                            <input type="hidden" class="book_price_input" name="book_price" value="${cart.book_price}">
                            <input type="hidden" class="individual_bookCount_input" name="book_count" value="${cart.book_count}">
                            <input type="hidden" class="individual_totalPrice_input" name="book_count" value="${cart.book_price * cart.book_count}">
                        </td>
                        <td><img src="upload/${cartImg.get(thumbnail)}" alt="" width="120" height="150"></td>
                        <td>${cart.book_title}<br>
                                ${cart.book_author} 저 | ${cart.book_publisher} <br> ${cart.book_description}
                        </td>
                        <td>
                            <input style="width: 30px;" type="number" name="count" value="${cart.book_count}">
                            <input style="width: 50px;" type="submit" value="변경" id="cartUpdate">
                        </td>
                        <td><input type="number" id="oqty" name="price" value="${cart.book_price * cart.book_count}" readonly style="width: 100px; "></td>
                        <td>오늘</td>
                        <td>
                            <input class="btn-outline-success1 oder_bt my-2" type="button" value="삭제" onclick="location.href='cancel?book_id=${cart.book_id}'" style="margin-bottom: 5px;">
                        </td>
                    </tr>
            </c:forEach>
            <!-- 총 가격을 구하는 스크립트 -->
        </table>
    </div>
    </form>
    <div class="Information">
        <table border="1" class="Info_table" style="width: 1200px;">
            <tr class="Info_td1">
                <td><p>총 상품금액 <br>
                    <script>
                        let i=0;
                        let book_price =0;
                        let book_count = 0;
                        let total = [];
                        let sum = 0;
                        <c:forEach items="${cart}" var="cart">
                        book_price = parseInt(${cart.book_price});
                        book_count = parseInt(${cart.book_count});
                        total[i] = book_price*book_count

                        if(i>0) {
                            sum = (parseInt(total[i])+parseInt(total[i-1]));
                        }else {
                            sum = parseInt(total[i]);
                        }

                        i++;
                        </c:forEach>
                        document.write(sum);
                    </script>원</p></td>
                <td><p>총 추가금액<br>
                    <script>
                        let ba = 0;
                        if(sum>=30000) {
                            document.write(ba);
                        }else {
                            ba = 3000;
                            document.write(ba);
                        }

                    </script>원
                </p></td>
                <td><p>총 할인금액 <br>0원</p></td>
                <td>
                    <p>최종 결제금액<br>
                    <script>
                        document.write(sum+ba);
                        let totalMoney = sum+ba;
                    </script>원
                    </p>
                </td>
            </tr>
        </table>
    </div>
    <div class="payment_event">
        <table border="1" style="width: 1200px;">
            <tr style="height: 150px;">
                <td style="width: 150px;"><b>결제 혜택</b></td>
                <td>
                    그린카드 결제시 <b>3%적립</b> <br><br>
                    삼성페이 결제시 <b>2%적립</b>
                </td>
            </tr>
        </table>
    </div>
    <div class="user_type">
        <label for="u_bt1"><img src="img/bookimg/b_orderMem.gif" alt=""></label>
        <input id="u_bt1" type="button" value="회원주문" hidden>
        <label for="u_bt2"><img src="img/bookimg/b_goshopping.gif" alt=""></label>
        <input id="u_bt2" type="button" value="쇼핑계속하기" onclick="location.href='/'" hidden>
    </div>

    <jsp:include page="../footer.jsp" />
    <script>
        $("#u_bt1").click(function (){
            let totalMoney = sum+ba;
            location.href='order?totalMoney='+totalMoney;
        });
    </script>
</main>
</body>
</html>