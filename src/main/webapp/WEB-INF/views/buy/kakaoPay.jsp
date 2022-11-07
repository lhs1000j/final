<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-25
  Time: 오후 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
<form method="post" action="orderAdd" id="buyOk">
        <c:forEach var="cart1" items="${cart}" varStatus="status">
            <input type="hidden" name="book_id" value="${cart1.book_id}">
            <input type="hidden" name="book_price" value="${cart1.book_price}">
            <input type="hidden" name="book_title" value="${cart1.book_title}">
            <input type="hidden" name="book_count" value="${cart1.book_count}">
            <input type="hidden" name="book_order_number" value="${cart1.book_id+cart1.book_count*cart1.book_price}">
            <c:forEach var="info" items="${memberInfo}">
                <input type="hidden" name="member_id" value="${info.member_id}">
                <input type="hidden" name="member_name" value="${info.member_name}">
                <input type="hidden" name="member_phone" value="${info.member_phone}">
                <input type="hidden" name="member_email" value="${info.member_email}">
                <input type="hidden" name="member_address" value="${info.member_address}">
                <input type="hidden" name="member_detailAddress" value="${info.member_detailAddress}">
                <input type="hidden" name="member_extraAddress" value="${info.member_extraAddress}">
            </c:forEach>
        </c:forEach>
</form>
</body>
<script>
    function getParameter(name) {
        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    }

    let totalMoney = getParameter('totalMoney');

    $(function(){

    var IMP = window.IMP; // 생략가능
    IMP.init('imp72880127'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
    var msg;
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        <c:forEach var="cart1" items="${cart}">
        name : '${cart1.book_title}',
        </c:forEach>
        amount : totalMoney,
        <c:forEach var="info" items="${memberInfo}">
        buyer_email : '${info.member_email}',
        buyer_name : '${info.member_name}',
        buyer_tel : '${info.member_phone}',
        buyer_addr : '${info.member_address}',
        buyer_postcode : '${info.member_postcode}',
        //m_redirect_url : 'http://www.naver.com'
        </c:forEach>
    },function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            jQuery.ajax({
                url: "/buy/", //cross-domain error가 발생하지 않도록 주의해주세요
                method: "POST",
                headers: { "Content-Type": "application/json" },
                data: {
                    imp_uid : rsp.imp_uid,
                    merchant_uid: rsp.merchant_uid,
                    amount : rsp.paid_amount,
                    //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function(data) {
                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                if ( everythings_fine ) {
                    msg = '결제가 완료되었습니다.';
                    msg += '\n고유ID : ' + rsp.imp_uid;
                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                    msg += '\n결제 금액 : ' + rsp.paid_amount;
                    msg += '카드 승인번호 : ' + rsp.apply_num;

                    alert(msg);
                } else {
                    //[3] 아직 제대로 결제가 되지 않았습니다.
                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                }
            });
            //성공시 이동할 페이지
            //document.getElementById("paySuccess").submit;
            $("#buyOk").submit();
            //location.href='orderAdd';
        } else {
            msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            //실패시 이동할 페이지
            alert(msg);
            location.href="cart";

            //$("#product").submit();
            }
    });

});
</script>
</html>
