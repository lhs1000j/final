<%--
  Created by IntelliJ IDEA.
  User: 황우성
  Date: 2022-10-20
  Time: 오후 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Book</title>
    <script src="js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
    <header>
        <div class="topBanner">
            <div class="bannerContent">
                <div class="bannerText">
                    <strong>Reminder:</strong> 지금 회원가입하면 10% 할인 쿠폰을 드립니다.
                </div>
                <button class="bannerClose" type="button">
                    <span class="material-icons">
                        <img src="img/close_FILL0_wght200_GRAD-25_opsz24.png" alt="">
                    </span>
                </button>
            </div>
        </div>
        <div class="logo">
            <a href="/"><img src="img/logo.png" alt="logo"></a>
            <h1>Green Book</h1>
        </div>
        <div>
            <nav class="nav nav-tabs">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=국내도서">국내도서</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=외국도서">외국도서</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=eBook">eBook</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=웹소설/코믹">웹소설/코믹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="book_list?largeCategory=중고샵">중고샵</a>
                    </li>
                </ul>
                <ul class="nav">
                    <li class="nav-item">
                    <c:choose>
                        <c:when test="${empty sessionScope.member_id}">
                            <a class="nav-link" aria-current="page" href="/login">로그인</a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" aria-current="page" href="/logout">로그아웃</a>
                        </c:otherwise>
                    </c:choose>
                    </li>
                    <li class="nav-item">
                        <c:if test="${not empty sessionScope.member_id}">
                            <a class="nav-link" aria-current="page" href="/mypage">마이페이지</a>
                        </c:if>
                    </li>
                    <li class="nav-item">
                        <c:if test="${sessionScope.member_class ne 0 and not empty sessionScope.member_class}">
                            <a class="nav-link" aria-current="page" href="/product">상품등록</a>
                        </c:if>
                    </li>
                    <li class="nav-item">
                        <c:if test="${sessionScope.member_class ne 2 and not empty sessionScope.member_class}">
                            <a class="nav-link" aria-current="page" href="/cart">장바구니</a>
                        </c:if>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/list">고객센터</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <section id="mainWrapper">
        <div class="container">
            <ul class="tabs">
                <li class="nav-item current" data-tab="tab-1">국내도서</li>
                <li class="nav-item" data-tab="tab-2">외국도서</li>
                <li class="nav-item" data-tab="tab-3">eBook</li>
                <li class="nav-item" data-tab="tab-4">웹소설/코믹</li>
                <li class="nav-item" data-tab="tab-5">중고샵</li>
            </ul>
            <div id="tab-1" class="tab-content current">
                <ul class="mainView">
                    <c:forEach var="view" items="${bookView1}" begin="0" end="3" varStatus="status">
                        <c:set var="thumbnail" value="thumbnail${status.index}" />
                        <c:set var="bookId" value="bookId${status.index}" />
                        <c:set var="title" value="title${status.index}" />
                        <c:set var="price" value="price${status.index}" />
                        <li>
                            <a href="/review?bookId=${bookView1.get(bookId)}">
                                <img src="upload/${bookView1.get(thumbnail)}" />
                                <p>${bookView1.get(title)}</p>
                                <span>${bookView1.get(price)}</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div id="tab-2" class="tab-content">
                <ul class="mainView">
                    <c:forEach var="view" items="${bookView2}" begin="0" end="3" varStatus="status">
                        <c:set var="thumbnail" value="thumbnail${status.index}" />
                        <c:set var="bookId" value="bookId${status.index}" />
                        <c:set var="title" value="title${status.index}" />
                        <c:set var="price" value="price${status.index}" />
                        <li>
                            <a href="/review?bookId=${bookView2.get(bookId)}">
                                <img src="upload/${bookView2.get(thumbnail)}" />
                                <p>${bookView2.get(title)}</p>
                                <span>${bookView2.get(price)}</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div id="tab-3" class="tab-content">
                <ul class="mainView">
                    <c:forEach var="view" items="${bookView3}" begin="0" end="3" varStatus="status">
                        <c:set var="thumbnail" value="thumbnail${status.index}" />
                        <c:set var="bookId" value="bookId${status.index}" />
                        <c:set var="title" value="title${status.index}" />
                        <c:set var="price" value="price${status.index}" />
                        <li>
                            <a href="/review?bookId=${bookView3.get(bookId)}">
                                <img src="upload/${bookView3.get(thumbnail)}" />
                                <p>${bookView3.get(title)}</p>
                                <span>${bookView3.get(price)}</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div id="tab-4" class="tab-content">
                <ul class="mainView">
                    <c:forEach var="view" items="${bookView4}" begin="0" end="3" varStatus="status">
                        <c:set var="thumbnail" value="thumbnail${status.index}" />
                        <c:set var="bookId" value="bookId${status.index}" />
                        <c:set var="title" value="title${status.index}" />
                        <c:set var="price" value="price${status.index}" />
                        <li>
                            <a href="/review?bookId=${bookView4.get(bookId)}">
                                <img src="upload/${bookView4.get(thumbnail)}" />
                                <p>${bookView4.get(title)}</p>
                                <span>${bookView4.get(price)}</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div id="tab-5" class="tab-content">
                <ul class="mainView">
                    <c:forEach var="view" items="${bookView5}" begin="0" end="3" varStatus="status">
                        <c:set var="thumbnail" value="thumbnail${status.index}" />
                        <c:set var="bookId" value="bookId${status.index}" />
                        <c:set var="title" value="title${status.index}" />
                        <c:set var="price" value="price${status.index}" />
                        <li>
                            <a href="/review?bookId=${bookView5.get(bookId)}">
                                <img src="upload/${bookView5.get(thumbnail)}" />
                                <p>${bookView5.get(title)}</p>
                                <span>${bookView5.get(price)}</span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </section>
    <section id="mainContent">
        <%-- 전체 책 중에서 랜덤한 책 2개를 book ID로 구해서 출력 --%>
        <div class="todayBook">
            <span>오늘의 책</span>
            <div class="todayFirst">
                <a href="/review?bookId=${todayInfo1.bookId}">
                    <img src="upload/${todayImg1.storedThumbnail}" />
                    <div>
                        <p><c:out value="${todayInfo1.bookTitle}" />-<c:out value="${todayInfo1.bookAuthor}" /></p>
                        <span><c:out value="${todayInfo1.bookDescription}" /></span>
                    </div>
                </a>
            </div>
            <div class="todaySecond">
                <a href="/review?bookId=${todayInfo2.bookId}">
                    <img src="upload/${todayImg2.storedThumbnail}" />
                    <div>
                        <p><c:out value="${todayInfo2.bookTitle}" />-<c:out value="${todayInfo2.bookAuthor}" /></p>
                        <span><c:out value="${todayInfo2.bookDescription}" /></span>
                    </div>
                </a>
            </div>
        </div>
        <div class="bestSeller">
            <span>Best Seller</span>
            <ul class="slider">
                 <c:forEach items="${best}" begin="0" end="9" varStatus="status">
                    <c:set var="book_thumbnail" value="thumbnail${status.index}" />
                    <c:set var="book_id" value="bookId${status.index}" />
                    <c:set var="book_title" value="title${status.index}" />
                    <c:set var="book_description" value="description${status.index}" />
                    <a href="/review?bookId=${best.get(book_id)}">
                    <li>
                        <img src="upload/${best.get(book_thumbnail)}" />
                            <p>${best.get(book_title)}</p>
                        <div class="description">
                            ${best.get(book_description)}
                        </div>
                    </li>
                    </a>
                </c:forEach>
            </ul>
        </div>
    </section>
    <section id="banner">
        <div>
            <a href="#">
                <img src="img/banner1.jpg" alt="">
            </a>
        </div>
    </section>
    <div class="chatting">
        <label for="chat">
            <img src="img/1380370.png" alt=""><br />
            <span>오픈채팅</span>
        </label>
        <input type="button" id="chat" onclick="openPop()" hidden/>
        <%--<a href="" target="_blank" onclick="openPop()">오픈채팅</a>--%>
    </div>
    <jsp:include page="footer.jsp" />

    <script>
        document.querySelector(".bannerClose").addEventListener("click", function () {
            this.closest(".topBanner").style.display = "none";
        });
    </script>
    <script>
        $(document).ready(function(){
            $('.slider').bxSlider({
                pager: false,        // 현재 위치 페이징 표시 여부
                moveSlides: 1,      // 슬라이드가 몇개 움직일 지
                slideMargin : 10,   // 슬라이드의 여백이 몇인지
                maxSlides : 4,      // 한 페이지에 몇개의 슬라이드가 보일지
                slideWidth : 290    // 슬라이드의 너비
            });
        });
    </script>
    <script>
        $(document).ready(function(){

            $('.nav-link').click(function(){
                var tab_id = $(this).attr('aria-controls');
                $('.bxslider').removeClass('show');

                $("."+tab_id).addClass('show');
            })

        })
        $(document).ready(function(){

            $('ul.tabs li').click(function(){
                var tab_id = $(this).attr('data-tab');

                $('ul.tabs li').removeClass('current');
                $('.tab-content').removeClass('current');

                $(this).addClass('current');
                $("#"+tab_id).addClass('current');
            })

        })
    </script>
    <script type="text/javascript">
        function openPop(){
            var popup = window.open('/chat', '1:1대화', 'width=600px,height=600px,scrollbars=no');
        }
    </script>
</body>
</html>
