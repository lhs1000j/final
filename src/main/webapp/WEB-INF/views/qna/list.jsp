<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript">
		function fn_button() {
			var formData = $("#frm").serialize(); // serialize() 메서드는 폼 요소 자체
			$.ajax({
				// 리턴타입은 생략하면 자동으로 가게 된다.
				type : "post" // 전송방식 설정
				, data : formData // 갖고오는 데이터 위에 변수로 설정했음
				, url : "delete" // 찾아가는 값 (/write) 로 가게 된다.
				, success : function (data) { // 성공시
					alert("삭제완료")
					location.href="list";
				}
				, error : function (data) { // 실패시
					alert("오류 발생");
				}
			});
		}
	</script>
<body class="container-sm" >
	<jsp:include page="../header.jsp" />
		<form  method="post" action="modify">
			<input type="hidden" name="qna_id" value="${content_view.qna_id}">
			<div>
				<h1 class="h3 mb-3 fw-normal" style="padding-top: 50px;">Q&A 게시판</h1>
			</div>
			<div class="container-fluid px-4">
				<div class="card mb-4">
					<div class="card-body" style="text-align: center;">
						<table class="table table-hover table-striped">
							<thead>
							<tr class="">
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>Action</th>
							</tr>
							</thead>
							<%--저장된 데이터 불러오기--%>
							<tbody class="table-group-divider">
							<c:forEach items="${list}" var="dto">
								<tr>
									<!-- 여기서는 BDto.java에 있는 걸 적어야한다. -->
									<td>${dto.qna_id}</td>
									<td>${dto.qna_name}</td>
									<td>
										<a style="text-decoration: none; color: green;" href="content_view?qna_id=${dto.qna_id}">${dto.qna_title}</a>
									</td>
									<td>${dto.qna_date}</td>
									<td>${dto.qna_hit}</td>
									<td>
										<div class="btn-group btn-group-sm" role="group" aria-label="Small button group" >
											<button type="button" class="btn">
												<a href="modify_view?qna_id=${dto.qna_id}"  role="button" style="text-decoration: none; color: green;">수정</a>
											</button>
											<button type="button" class="btn" style="text-decoration: none; color: green;">
												<a href="reply_view?qna_id=${dto.qna_id}"  role="button" style="text-decoration: none; color: green;">댓글</a>
											</button>
											<button type="button" class="btn" >
												<a href="delete?qna_id=${dto.qna_id}"  role="button" onclick="fn_button()" style="text-decoration: none; color: green;">삭제</a>
											</button>
										</div>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<%--페이징처리--%>
						<nav aria-label="Page navigation example"  >
							<ul class="pagination" style="justify-content: center">
								<li class="page-item" style="margin: 0; <c:if test="${list2.startPage<6}">display: none;</c:if>"><a class="page-link" href="/list?currentPage=${list2.startPage-5}">Previous</a></li>
								<c:forEach var="pNo" begin="${list2.startPage}" end="${list2.endPage}" step="1" varStatus="status">
									<c:if test="${not empty list}">
										<li class="page-item" style="margin: 0;"><a class="page-link" href="/list?currentPage=${pNo}">${status.index+list2.startPage-1}</a></li>
									</c:if>
								</c:forEach>
								<li class="page-item" style="margin: 0; <c:if test="${list2.endPage>=list2.totalPages}">display: none;</c:if>"><a class="page-link" href="/list?currentPage=${list2.startPage+5}">Next</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</form>
			<%--검색기능--%>
			<div style="text-align: center;">
				<form autocapitalize="off" action="list" method="post">
					<select name="searchOption">
						<option selected value="">검색 내용 선택</option>
						<option value="qna_title">제목</option>
						<option value="qna_name">작성자</option>
					</select>
					<input type="text" name="searchText">
					<input type="submit" class="btn btn-outline-success m-2" value="검색">
					<a href="write_view" class="btn btn-outline-success m-3" role="button">글작성</a>
				</form>
			</div>
	<jsp:include page="../footer.jsp" />
	</body>
</html>















