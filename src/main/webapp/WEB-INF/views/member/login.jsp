<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/login.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
</head>
<body class="text-center">

<main class="form-signin w-100 m-auto">
    <form method="post" action="loginCheck">
        <img class="mb-4" src="img/logo.png" alt="" width="72" height="72">
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <div class="form-floating">
            <input type="text" class="form-control" name="member_id" id="floatingInput" placeholder="아이디" autofocus>
            <label for="floatingInput">아이디</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" name="member_pwd" id="floatingPassword" placeholder="비밀번호">
            <label for="floatingPassword">비밀번호</label>
        </div>

        <div class="checkbox mb-3">
            <label>
                
            </label>
        </div>
        <button class="w-100 btn btn-lg btn-success" type="submit">로그인</button>
        <p class="mt-5 mb-3 text-muted">&copy; GREENBOOK</p>
        <a href="signUp">가입</a>
    </form>
</main>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery.js"></script>
</body>
</html>