<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 수정</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/signup.css" rel="stylesheet">
    <script type="text/javascript" src="js/member.js" charset="UTF-8"></script>
</head>
<body class="bg-light">
<div class="container">
    <main>
        <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="img/logo.png" alt="" width="72" height="72">
            <h2>회원정보 수정</h2>
        </div>
        <c:forEach var="info" items="${memberInfo}">
            <div class="row g-5">
                <div class="col-md-12 col-lg-12">
                    <form name="modifyForm" class="needs-validation" novalidate action="memberModifyUpdate" method="post">
                        <div class="row g-3">
                            <h4>기본 정보</h4>
                            <div class="col-sm-12">
                                <label for="member_id" class="form-label">아이디</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control" name="member_id" id="member_id" placeholder="${info.member_id}" readonly required minlength="4">
                                    <div class="invalid-feedback">
                                        부적절한 아이디입니다.
                                    </div>
                                </div>
                            </div>


                            <div class="col-sm-6">
                                <label for="member_pwd" class="form-label">비밀번호</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control" name="member_pwd" id="member_pwd" placeholder="비밀번호를 적어주세요." required>
                                    <div class="invalid-feedback">
                                        부적합한 비밀번호입니다.
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <label for="member_pwd_cnf" class="form-label">비밀번호 확인</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control" name="member_pwd_cnf" id="member_pwd_cnf" placeholder="비밀번호를 적어주세요." required>
                                    <div class="invalid-feedback">
                                        비밀번호가 동일하지 않습니다.
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <label for="member_name" class="form-label">이름</label>
                                <div class="input-group has-validation">
                                    <input type="text" class="form-control" name="member_name" id="member_name" value="${info.member_name}" required>
                                    <div class="invalid-feedback">
                                        부적절한 이름입니다.
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="member_phone" class="form-label">전화번호</label>
                                <div class="input-group has-validation">
                                    <input type="tel" class="form-control" maxlength="12" name="member_phone" id="member_phone" required value="${info.member_phone}">
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="member_email" class="form-label">이메일</label>
                                <input type="email" class="form-control" name="member_email" id="member_email" value="${info.member_email}" required>
                                <div class="invalid-feedback">
                                    이메일을 형식에 맞게 적어주세요.
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label for="member_postcode" class="form-label">우편번호</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="member_postcode" id="member_postcode" value="${info.member_postcode}" readonly>
                                    <input type="button" class="btn btn-secondary" onclick="execDaumPostcode()" value="우편번호 찾기"></input>
                                </div>
                                <div class="invalid-feedback">
                                    우편번호는 필수입니다.
                                </div>
                            </div>

                            <div id="wrap" style="display:none;border:1px solid;width:100%;height:400px;margin:5px 0;position:relative">
                                <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                            </div>

                            <div class="col-md-12">
                                <label for="member_address" class="form-label">주소</label>
                                <input type="text" class="form-control" name="member_address" id="member_address" value="${info.member_address}" readonly required>
                                <div class="invalid-feedback">
                                    올바른 주소를 입력하세요.
                                </div>
                            </div>

                            <div class="col-md-6">
                                <input type="text" class="form-control" name="member_extraAddress" id="member_extraAddress"  value="${info.member_extraAddress}">
                            </div>

                            <div class="col-md-6">
                                <input type="text" class="form-control" name="member_detailAddress" id="member_detailAddress" value="${info.member_detailAddress}">
                            </div>
                            <hr class="my-4">

                            <input class="w-100 btn btn-success btn-lg mb-3" type="button" onclick="modifyCheck()" value="수정하기">
                            <input class="w-100 btn btn-outline-danger btn-lg" type="reset" value="돌아가기">

                        </div>
                    </form>
                </div>
            </div>
        </c:forEach>
    </main>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
    function execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("member_extraAddress").value = extraAddr;
                } else {
                    document.getElementById("member_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('member_postcode').value = data.zonecode;
                document.getElementById("member_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("member_detailAddress").focus();
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<script>

</script>
<script src="/js/bootstrap.bundle.min.js"></script>
</body>
</html>