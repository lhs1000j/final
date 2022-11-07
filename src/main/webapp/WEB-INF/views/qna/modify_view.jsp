<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Document</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script type="text/javascript">
			function fn_submit() {
				var formData = $("#frm").serialize(); // serialize() 메서드는 폼 요소 자체
				$.ajax({
					// 리턴타입은 생략하면 자동으로 가게 된다.
					type : "post" // 전송방식 설정
					, data : formData // 갖고오는 데이터 위에 변수로 설정했음
					, url : "modify" // 찾아가는 값 (/write) 로 가게 된다.
					, success : function (data) { // 성공시
						alert("수정완료")
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
			<form  method="post" action="modify">
				<input type="hidden" name="qna_id" value="${content_view.qna_id}">
				<div>
					<h1 class="h3 mb-3 fw-normal" style="padding-top: 50px;">Q&A 수정</h1>
				</div>
				<div class="container-fluid px-4">
					<div class="card mb-4">
						<div class="card-body">
							<table class="table table-hover table-striped">
								<form class="container-center">
									<div class="mb-3">
										<label class="form-label text-left" >제목</label>
										<input name="qna_title" type="text" class="form-control" placeholder="${content_view.qna_title}">
									</div>
									<fieldset disabled aria-label="Disabled fieldset example">
										<div class="mb-3">
											<label class="form-label">작성자</label>
											<input name="qna_name" type="text" class="form-control" placeholder="${content_view.qna_name}">
											<label class="form-label">조회수</label>
											<input name="qna_hit" type="text" class="form-control" placeholder="${content_view.qna_hit}">
										</div>
									</fieldset>
									<div class="form-group mb-3">
										<label class="form-label"> 내용 </label>
										<textarea class="form-control" name="qna_content" style="height: 250px;">${content_view.qna_content}</textarea>
									</div>
									<div style="text-align: center; padding-top: 30px;">
										<input type="submit" class="btn btn-outline-success m-2" onclick="fn_submit()" value="수정"/>
										<input type="reset" class="btn btn-outline-success m-2" value="초기화"/>
										<a href="list" role="button" class="btn btn-outline-success m-2">목록보기</a>
									</div>
								</form>
							</table>
						</div>
					</div>
				</div>
			</form>
	<jsp:include page="../footer.jsp" />
	</body>
</html>