<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Book</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/form-validation.css">
    <link rel="stylesheet" href="css/sale.css">
    <script src="js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <!-- 카카오 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>
</head>

<body style="width: 1200px;">
    <jsp:include page="../header.jsp"></jsp:include>
    <div class="container">
        <div class="content">
            <table class="content_tb" style="width: 940px;">
                <tr class="content_tb_top">
                    <td style="width: 150px;">이미지</td>
                    <td style="width: 450px;">상품정보</td>
                    <td style="width: 100px;">상품금액</td>
                    <td style="width: 100px;">배송정보</td>
                </tr>
                <c:forEach items="${cartInfo}" var="cart" varStatus="status">
                    <c:set var="thumbnail" value="thumbnail${status.index}" />
                    <input type="hidden" class="book_id_input" name="book_id" value="${cart.book_id}"><br>
                    <input type="hidden" class="book_price_input" name="book_price" value="${cart.book_price}">
                    <input type="hidden" class="individual_bookCount_input" name="book_count" value="${cart.book_count}">
                    <input type="hidden" class="individual_totalPrice_input" name="book_count" value="${cart.book_price * cart.book_count}">
                    <tr style="margin-bottom:15px;">

                        <td><img src="upload/${cartImg.get(thumbnail)}" alt="" width="150" height="180"></td>
                        <td>${cart.book_title}<br>
                                ${cart.book_author} 저 | ${cart.book_publisher} <br> ${cart.book_description}
                        </td>
                        <td><input type="number" id="oqty" name="price" value="${cart.book_price * cart.book_count}" readonly style="width: 100px; "></td>
                        <td>주문일로부터 2일</td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <div class="row" style="margin-bottom: 100px;">
            <div class="col-md-4 order-md-2 mb-4">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-muted">결제품목</span>
                </h4>
                <script> let i = 1;</script>
                <ul class="list-group mb-3">
                    <c:forEach var="cart" items="${cartInfo}" varStatus="status">
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">
                               <script>document.write(i); i++;</script>. ${cart.book_title} x ${cart.book_count}개
                            </h6>
                        </div>
                        <span class="text-muted">${cart.book_price*cart.book_count}원</span>
                    </li>
                    </c:forEach>
                    <li class="list-group-item" style="text-align:center;">
                        <span>합계</span>
                        <strong>${totalMoney}원</strong>
                    </li>
                </ul>
            </div>
            <div class="col-md-8">
                <h4 class="mb-3">주문정보</h4>
                <div class="row">
                <c:forEach var="info" items="${memberInfo}">
                    <div class="col-md-6 mb-3 test">
                        <label>이름</label>
                        <input type="text" class="form-control" id="name" name="member_name" value="${info.member_name}" required>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>연락처</label>
                        <input type="text" class="form-control" id="phone" name="member_phone" placeholder="" value="${info.member_phone}" required>
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="email">이메일</label>
                    <input type="email" class="form-control" name="member_email" id="email" value="${info.member_email}">
                    <div class="invalid-feedback">
                        Please enter a valid email address for shipping updates.
                    </div>
                </div>

                <div class="mb-3">
                    <p>주소</p>
                    <input class="adressAPI" type="text" id="sample4_postcode" name="member_postcode" value="${info.member_postcode}" readonly>
                    <input class="adressAPI_bt" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                    <input class="adress" type="text" id="sample4_roadAddress" name="member_address" value="${info.member_address}" readonly><br>
                    <span class="adress" id="guide" style="color:#999;display:none" readonly></span>
                    <input class="adress" type="text" id="sample4_extraAddress" name="member_detailAddress" value="${info.member_detailAddress}" readonly>
                    <input class="adress" type="text" id="sample4_jibunAddress" name="member_extraAddress" value="${info.member_extraAddress}"><br>
                </div>
                </c:forEach>
                <h4 class="mb-3">결제수단</h4>

                <input type="button" value="결제하기" id="kakao" hidden>
                <label for="kakao"><img src="img/bookimg/payment_icon_yellow_medium.png"></label>

            </div>
        </div>

        <jsp:include page="../footer.jsp"></jsp:include>
    </div>
    <script>
        $("#kakao").click(function (){
            location.href = 'kakaoPay?totalMoney='+${totalMoney};
        })
    </script>

</body>
</html>


