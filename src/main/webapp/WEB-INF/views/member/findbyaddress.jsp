<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Ajax 선언부 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <title>주소로 회원 검색</title>
    <script type="text/javascript">

        $(document).ready(function() {
            $("#addressList").on('change', function() {
                //alert($("#addressList").val());
                var addr = $(this).val();
                if (addr === ""){ //주소가 없을 경우에는 서버에 요청하지 않도록 처리한다.
                    $("#memberInfo").empty(); //tbody를 초기화
                    return; //함수 실행을 중단한다.
                }
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/findMemberListbyAddressAjax.do",
                    dataType: "json",
                    data: "address="+addr,
                    success:function(memberList){
                        //tbody id=memberInfo 에 정보를 넣어준다
                        var tag="";
                        for (var i = 0; i < memberList.length; i++) {
                            tag += "<tr><td>";
                            tag += memberList[i].id;
                            tag += "</td><td>";
                            tag += memberList[i].name;
                            tag += "</td></tr>";
                        }
                        $("#memberInfo").html(tag);
                    }
                });//ajax
            });//findbyaddrBtn

        });//ready

    </script>
</head>
<body>
<!-- 3_2. 주소에 해당하는 회원정보 조회 -->
<h4>주소로 회원검색</h4>
주소를 선택해주세요!<br>
<select id="addressList">
    <option value="">--주소--</option>
    <c:forEach items="${requestScope.addressList}" var="address">
        <option value="${address}">${address}</option>
    </c:forEach>
</select>

<br><br>
<table border="1">
    <thead>
    <tr>
        <th>아이디</th>
        <th>이름</th>
    </tr>
    </thead>
    <tbody id="memberInfo">
    <tr>
        <td></td>
        <td></td>
    </tr>
    </tbody>
</table>
</body>
</html>