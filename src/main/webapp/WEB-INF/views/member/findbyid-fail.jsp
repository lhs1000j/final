<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script type="text/javascript">
    alert("아이디 ${param.id}에 해당하는 회원이 없습니다.");
    location.href = "${pageContext.request.contextPath}/home.do";
</script>