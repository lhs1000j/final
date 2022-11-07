<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<meta charset="UTF-8">
		<title>write_view</title>
		<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript">
			function fn_submit() {
				var formData = $("#frm").serialize(); // serialize() 메서드는 폼 요소 자체

				$.ajax({
					// 리턴타입은 생략하면 자동으로 가게 된다.
					type : "post" // 전송방식 설정
					, data : formData // 갖고오는 데이터 위에 변수로 설정했음
					, url : "write" // 찾아가는 값 (/write) 로 가게 된다.
					, success : function (data) { // 성공시
						alert("저장완료")
						location.href="list";
					}
					, error : function (data) { // 실패시
						alert("오류 발생");
					}
				});
			}
		</script>
	</head>
	<body class="container-sm">
	<jsp:include page="../header.jsp" />
			<form  id="frm">
				<div>
					<h1 class="h3 mb-3 fw-normal" style="padding-top: 50px;">Q&A 글쓰기</h1>
				</div>
				<div class="container-fluid px-4">
					<div class="card mb-4">
						<div class="card-body">
							<table class="table table-hover table-striped row g-3">
								<div class="col-md-12">
									<label class="form-label">제목</label>
									<input type="text" name="qna_title" class="form-control">
								</div>
								<div class="col-md-12">
									<label class="form-label">이름</label>
									<c:if test="${not empty sessionScope.member_id}">
										<input type="text" name="qna_name" class="form-control" value="${sessionScope.member_id}" readonly/>
									</c:if>
									<c:if test="${empty sessionScope.member_id}">
										<input type="text" name="qna_name" class="form-control">
									</c:if>
								</div>
								<div class="form-group mb-3">
									<label class="form-label"> 내용 </label>
									<textarea class="form-control" name="qna_content" placeholder="내용을 입력하세요" style="height: 250px;"></textarea>
								</div>
								<div style="text-align: center; padding-top: 30px;">
									<input type="button" class="btn btn-outline-success m-2" onclick="fn_submit()" value="완료"/>
									<input type="reset" class="btn btn-outline-success m-2" value="초기화"/>
									<a href="list" role="button" class="btn btn-outline-success m-2">목록보기</a>
								</div>
							</table>
						</div>
					</div>
				</div>
			</form>
	<jsp:include page="../footer.jsp" />
	</body>
</html>