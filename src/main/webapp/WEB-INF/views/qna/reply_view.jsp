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
	</head>
	<body class="container-sm">
	<jsp:include page="../header.jsp" />
			<form  method="post" action="modify">
				<input type="hidden" name="qna_id" value="${content_view.qna_id}">
				<div>
					<h1 class="h3 mb-3 fw-normal" style="padding-top: 50px;">Q&A 댓글</h1>
				</div>
				<div class="container-fluid px-4">
					<div class="card mb-4">
						<div class="card-body">
							<table class="table table-hover table-striped">
								<form class="container-center">
									<fieldset disabled aria-label="Disabled fieldset example">
										<div class="mb-3">
											<label class="form-label text-left" >제목</label>
											<input name="qna_title" type="text" class="form-control" value="${content_view.qna_title}" style="margin-bottom: 10px;" readonly/>
											<label class="form-label">작성자</label>
											<input name="qna_name" type="text" class="form-control" value="${content_view.qna_name}" style="margin-bottom: 10px;" readonly />
											<label class="form-label">조회수</label>
											<input name="qna_hit" type="text" class="form-control" value="${content_view.qna_hit}" style="margin-bottom: 10px;" readonly/>
											<label class="form-label">내용</label>
											<input class="form-control" name="qna_content" style="height: 250px;" value="${content_view.qna_content}" style="margin-bottom: 10px;" readonly/>
										</div>
									</fieldset>
									<div class="card-header bg-light">
										<i class="fa fa-comment fa"></i> 댓글
									</div>
									<div class="card-body">
										<ul class="list-group list-group-flush">
											<li class="list-group-item">
												<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
												<button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">post reply</button>
											</li>
										</ul>
									</div>
								</form>
							</table>
							<div style="text-align: center; padding-top: 30px;">
								<a href="list" role="button" class="btn btn-outline-success m-2">목록보기</a>
							</div>
						</div>
					</div>
				</div>
			</form>
	<jsp:include page="../footer.jsp" />
	</body>
</html>