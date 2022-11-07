<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- jQuery 선언부 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <%--
        jquey ajax 로 아이디를 입력하면 keyup 이벤트를 처리해서,
        아이디 사용가능 여부를 <span id="checkIdView">에 제공한다.
        아이디가 사용 가능할 때만 회원가입이 되도록 javascript에서 처리한다.
     --%>
    <script type="text/javascript">

        $(document).ready(function() {

            var checkId="";

            $("#memberId").keyup(function() {
                checkId="";//keyup시에 초기화해주기
                var mId = $(this).val();

                // jquery ajax
                // -> 사용가능한 아이디면 blue로 사용가능
                // -> 사용 불가능한 아이디면 red로 중복된 아이디- 사용불가
                $.ajax({
                    type: "GET",
                    url: "checkId.do",
                    data: "id=" + mId,
                    success:function(result){
                        if (result == "ok"){
                            $("#checkIdView").html("사용가능").css("color", "blue");
                            checkId = mId;
                        } else {
                            $("#checkIdView").html("사용불가 - 중복된 아이디").css("color", "red");
                        }
                    }//success
                });//ajax
            });//keyup

            //회원가입하기 전에 아이디 중복 확인 체크 (사용 가능 여부 확인)
            $("#registerForm").submit(function(){
                if (checkId === ""){
                    alert("아이디 중복을 확인하세요!");
                    return false;
                }
            });//submit

        });//ready

    </script>
</head>
<body>
<!-- 6. 회원가입 및 아이디 중복확인 -->
<h4>회원가입 form</h4>
<form action="register-member.do" method="POST" id="registerForm">
    아이디 <input type="text" name="id" id="memberId" required="required">
    <span id="checkIdView"></span><br>
    패스워드 <input type="password" name="password" required="required"><br>
    이름 <input type="text" name="name" required="required"><br>
    주소 <input type="text" name="address" required="required"><br>
    <input type="submit" value="가입하기">
</form>
</body>
</html>