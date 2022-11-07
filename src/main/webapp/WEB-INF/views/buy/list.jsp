<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
	<table width="500" border="1">
		<tr>
			<td>카테고리</td>
			<td>제목</td>
			<td>작가</td>
			<td>가격</td>
		</tr>
		<!-- EL에는 모델에 있는 것을 적어야한다. -->
		<%--<c:forEach items="${booklist}" var="dto" varStatus="status">--%>
		<c:forEach items="${booklist}" var="booklist" >
			<tr>
				<!-- 여기서는 BDto.java에 있는 걸 적어야한다. -->
				<td>${booklist.category}</td>
				<td>
					<a href="content_view?title=${booklist.title}">${booklist.bTitle}</a>
				</td>
				<td>${booklist.author}</td>
				<td>${booklist.price}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<!-- write_view는 컨트롤러의 RequestMapping으로 지정한 곳으로 가게 된다. -->
				<a href="write_view">글작성</a>
			</td>
		</tr>
	</table>
</body>
</html>