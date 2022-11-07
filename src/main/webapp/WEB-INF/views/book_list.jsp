<%--
  Created by IntelliJ IDEA.
  User: 황우성
  Date: 2022-10-24
  Time: 오후 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Book</title>
    <script src="js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/bookList.css">
</head>
<body>
    <header>
        <div class="logo">
            <a href="/"><img src="img/logo.png" alt="logo"></a>
            <form action="book_list" method="post" name="searchForm" onSubmit="return check()">
                <div class="input-group">
                    <!-- 검색 타입 선택 리스트 -->
                    <select name="searchType" class="form-select">
                        <option value="all" <c:if test="${searchType eq 'all'}">selected</c:if>>통합검색</option>
                        <option value="book_title" <c:if test="${searchType eq 'book_title'}">selected</c:if>>제목</option>
                        <option value="book_author" <c:if test="${searchType eq 'book_author'}">selected</c:if>>저자</option>
                        <option value="book_publisher" <c:if test="${searchType eq 'book_publisher'}">selected</c:if>>출판사</option>
                        <option value="book_description" <c:if test="${searchType eq 'book_description'}">selected</c:if>>상세내용</option>
                    </select>
                    <!-- 키워드 입력 부분 -->
                    <input type="text" class="form-control" name="searchName" value="<c:if test="${not empty searchName}">${searchName}</c:if>"/>
                    <input type="hidden" class="form-control" name="largeCategory" value="${largeCategory}"/>
                    <input type="submit" class="btn btn-outline-secondary" id="button-addon2" value="검색"/>
                </div>
            </form>
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
                            <a class="nav-link" aria-current="page" href="/logout">마이페이지</a>
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
    <div id="contentView">
        <div class="list_nav">
            <div>
                <ul class="list-group">
                    <c:if test="${sessionScope.member_class ne 0 and not empty sessionScope.member_id}">
                    <li class="list-group-item">
                        <a href="/product">내 가게에서 팔기</a>
                    </li>
                    </c:if>
                    <li class="list-group-item">
                        <a href="">공지사항</a>
                    </li>
                    <li class="list-group-item">
                        <a href="">이용안내</a>
                    </li>
                </ul>
            </div>
            <div class="accordion" id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button
                                class="accordion-button collapsed"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseOne"
                                aria-expanded="true"
                                aria-controls="collapseOne">
                            국내도서
                        </button>
                    </h2>
                    <div
                            id="collapseOne"
                            class="accordion-collapse collapse"
                            aria-labelledby="headingOne"
                            data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <ul>
                                <li>
                                    <a href="book_list?largeCategory=국내도서&smallCategory=소설/시" class="nav-link">소설/시</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=국내도서&smallCategory=에세이" class="nav-link">에세이</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=국내도서&smallCategory=인문/역사" class="nav-link">인문/역사</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=국내도서&smallCategory=과학" class="nav-link">과학</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=국내도서&smallCategory=경제/경영" class="nav-link">경제/경영</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=국내도서&smallCategory=자기계발" class="nav-link">자기계발</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <h2 class="accordion-header" id="headingTwo">
                        <button
                                class="accordion-button collapsed"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo"
                                aria-expanded="ture"
                                aria-controls="collapseTwo">
                            외국도서
                        </button>
                    </h2>
                    <div
                            id="collapseTwo"
                            class="accordion-collapse collapse "
                            aria-labelledby="headingTwo"
                            data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <ul>
                                <li>
                                    <a href="book_list?largeCategory=외국도서&smallCategory=소설/시" class="nav-link">소설/시</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=외국도서&smallCategory=에세이" class="nav-link">에세이</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=외국도서&smallCategory=인문/역사" class="nav-link">인문/역사</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=외국도서&smallCategory=과학" class="nav-link">과학</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=외국도서&smallCategory=경제/경영" class="nav-link">경제/경영</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=외국도서&smallCategory=자기계발" class="nav-link">자기계발</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <h2 class="accordion-header" id="headingThree">
                        <button
                                class="accordion-button collapsed"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseThree"
                                aria-expanded="ture"
                                aria-controls="collapseThree">
                            eBook
                        </button>
                    </h2>
                    <div
                            id="collapseThree"
                            class="accordion-collapse collapse "
                            aria-labelledby="headingThree"
                            data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <ul>
                                <li>
                                    <a href="book_list?largeCategory=eBook&smallCategory=소설/시" class="nav-link">소설/시</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=eBook&smallCategory=에세이" class="nav-link">에세이</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=eBook&smallCategory=인문/역사" class="nav-link">인문/역사</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=eBook&smallCategory=과학" class="nav-link">과학</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=eBook&smallCategory=경제/경영" class="nav-link">경제/경영</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=eBook&smallCategory=자기계발" class="nav-link">자기계발</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <h2 class="accordion-header" id="headingFour">
                        <button
                                class="accordion-button collapsed"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseFour"
                                aria-expanded="ture"
                                aria-controls="collapseFour">
                            웹소설/코믹
                        </button>
                    </h2>
                    <div
                            id="collapseFour"
                            class="accordion-collapse collapse "
                            aria-labelledby="headingFour"
                            data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <ul>
                                <li>
                                    <a href="book_list?largeCategory=웹소설/코믹&smallCategory=판타지" class="nav-link">판타지</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=웹소설/코믹&smallCategory=무협" class="nav-link">무협</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=웹소설/코믹&smallCategory=로맨스" class="nav-link">로맨스</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=웹소설/코믹&smallCategory=라이트노벨" class="nav-link">라이트노벨</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <h2 class="accordion-header" id="headingFive">
                        <button
                                class="accordion-button collapsed"
                                type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#collapseFive"
                                aria-expanded="ture"
                                aria-controls="collapseFive">
                            중고샵
                        </button>
                    </h2>
                    <div
                            id="collapseFive"
                            class="accordion-collapse collapse "
                            aria-labelledby="headingFive"
                            data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <ul>
                                <li>
                                    <a href="book_list?largeCategory=중고샵&smallCategory=국내도서" class="nav-link">국내도서</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=중고샵&smallCategory=외국도서" class="nav-link">외국도서</a>
                                </li>
                                <li>
                                    <a href="book_list?largeCategory=중고샵&smallCategory=웹소설/코믹" class="nav-link">웹소설/코믹</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bookList">
            <!-- 파라미터 값으로 카테고리 불러와서 taglib으로 상위 카테고리, 하위 카테고리 입력 -->
            <div>
                <div class="category">
                    <h3>
                        <c:choose>
                            <c:when test="${largeCategory eq '국내도서'}">국내도서</c:when>
                            <c:when test="${largeCategory eq '외국도서'}">외국도서</c:when>
                            <c:when test="${largeCategory eq 'eBook'}">eBook</c:when>
                            <c:when test="${largeCategory eq '웹소설/코믹'}">웹소설/코믹</c:when>
                            <c:when test="${largeCategory eq '중고샵'}">중고샵</c:when>
                        </c:choose>
                    </h3>
                </div>
                <c:choose>
                    <c:when test="${largeCategory eq '국내도서'}">
                        <div class="nav">
                            <dl>
                                <a href="book_list?largeCategory=국내도서&smallCategory=소설/시" class="nav-link <c:if test="${smallCategory eq '소설/시'}" >selected</c:if>">소설/시</a>
                                <%-- 세부 카테고리 선택 시 강조하기 위해서 class를 추가하는데 조건문을 주었음 --%>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=국내도서&smallCategory=에세이" class="nav-link <c:if test="${smallCategory eq '에세이'}" >selected</c:if>">에세이</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=국내도서&smallCategory=인문/역사" class="nav-link <c:if test="${smallCategory eq '인문/역사'}" >selected</c:if>">인문/역사</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=국내도서&smallCategory=과학" class="nav-link <c:if test="${smallCategory eq '과학'}" >selected</c:if>">과학</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=국내도서&smallCategory=경제/경영" class="nav-link <c:if test="${smallCategory eq '경제/경영'}" >selected</c:if>">경제/경영</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=국내도서&smallCategory=자기계발" class="nav-link <c:if test="${smallCategory eq '자기계발'}" >selected</c:if>">자기계발</a>
                            </dl>
                        </div>
                    </c:when>
                    <c:when test="${largeCategory eq '외국도서'}">
                        <div class="nav">
                            <dl>
                                <a href="book_list?largeCategory=외국도서&smallCategory=소설/시" class="nav-link <c:if test="${smallCategory eq '소설/시'}" >selected</c:if>">소설/시</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=외국도서&smallCategory=에세이" class="nav-link <c:if test="${smallCategory eq '에세이'}" >selected</c:if>">에세이</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=외국도서&smallCategory=인문/역사" class="nav-link <c:if test="${smallCategory eq '인문/역사'}" >selected</c:if>">인문/역사</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=외국도서&smallCategory=과학" class="nav-link <c:if test="${smallCategory eq '과학'}" >selected</c:if>">과학</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=외국도서&smallCategory=경제/경영" class="nav-link <c:if test="${smallCategory eq '경제/경영'}" >selected</c:if>">경제/경영</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=외국도서&smallCategory=자기계발" class="nav-link <c:if test="${smallCategory eq '자기계발'}" >selected</c:if>">자기계발</a>
                            </dl>
                        </div>
                    </c:when>
                    <c:when test="${largeCategory eq 'eBook'}">
                        <div class="nav">
                            <dl>
                                <a href="book_list?largeCategory=eBook&smallCategory=소설/시" class="nav-link <c:if test="${smallCategory eq '소설/시'}">selected</c:if>">소설/시</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=eBook&smallCategory=에세이" class="nav-link <c:if test="${smallCategory eq '에세이'}">selected</c:if>">에세이</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=eBook&smallCategory=인문/역사" class="nav-link <c:if test="${smallCategory eq '인문/역사'}">selected</c:if>">인문/역사</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=eBook&smallCategory=과학" class="nav-link <c:if test="${smallCategory eq '과학'}">selected</c:if>">과학</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=eBook&smallCategory=경제/경영" class="nav-link <c:if test="${smallCategory eq '경제/경영'}">selected</c:if>">경제/경영</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=eBook&smallCategory=자기계발" class="nav-link <c:if test="${smallCategory eq '자기계발'}">selected</c:if>">자기계발</a>
                            </dl>
                        </div>
                    </c:when>
                    <c:when test="${largeCategory eq '웹소설/코믹'}">
                        <div class="nav">
                            <dl>
                                <a href="book_list?largeCategory=웹소설/코믹&smallCategory=판타지" class="nav-link <c:if test="${smallCategory eq '판타지'}">selected</c:if>">판타지</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=웹소설/코믹&smallCategory=무협" class="nav-link <c:if test="${smallCategory eq '무협'}">selected</c:if>">무협</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=웹소설/코믹&smallCategory=로맨스" class="nav-link <c:if test="${smallCategory eq '로맨스'}">selected</c:if>">로맨스</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=웹소설/코믹&smallCategory=라이트노벨" class="nav-link <c:if test="${smallCategory eq '라이트노벨'}">selected</c:if>">라이트노벨</a>
                            </dl>
                        </div>
                    </c:when>
                    <c:when test="${largeCategory eq '중고샵'}">
                        <div class="nav">
                            <dl>
                                <a href="book_list?largeCategory=중고샵&smallCategory=국내도서" class="nav-link <c:if test="${smallCategory eq '국내도서'}">selected</c:if>">국내도서</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=중고샵&smallCategory=외국도서" class="nav-link <c:if test="${smallCategory eq '외국도서'}">selected</c:if>">외국도서</a>
                            </dl>
                            <dl>
                                <a href="book_list?largeCategory=중고샵&smallCategory=웹소설/코믹" class="nav-link <c:if test="${smallCategory eq '웹소설/코믹'}">selected</c:if>">웹소설/코믹</a>
                            </dl>
                        </div>
                    </c:when>
                </c:choose>
                <!-- 아래의 옵션들은 쿼리스트링으로 옵션을 전달됨. paramSortTp : 순서 {기본순, 판매량, 발매일순, 최저가, 최고가, 상품명}
                usedTp : 보는 단위 {상품 단위, 모든 중고상품, 직배송, 판매자 배송} FetchSize : 페이징 단위, 한 페이지에 보여지는 제품
                수 -->
                <div class="array">
                    <%--<ul class="nav justify-content-center">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="ParamSortTp=01&usedTp={}&FetchSize={}">기본순</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ParamSortTp=01&usedTp={}&FetchSize={}">판매량</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ParamSortTp=01&usedTp={}&FetchSize={}">발매일순</a>
                        </li>
                        <c:if ~~~~ 중고샵일때만 작동 되게>
                        <li class="nav-item">
                            <a class="nav-link" href="ParamSortTp=01&usedTp={}&FetchSize={}">최저가</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ParamSortTp=01&usedTp={}&FetchSize={}">최고가</a>
                        </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="ParamSortTp=01&usedTp={}&FetchSize={}">상품명</a>
                        </li>
                    </ul>--%>
                    <!-- <div>
                        <select class="form-select" aria-label="Default select example" id="selectProductOptions">
                            <option value="ParamSortTp={}&usedTp={}&FetchSize=20">20개씩 보기</option>
                            <option value="ParamSortTp={}&usedTp={}&FetchSize=40">40개씩 보기</option>
                            <option value="ParamSortTp={}&usedTp={}&FetchSize=60">60개씩 보기</option>
                        </select>
                    </div> -->
                </div>
            </div>
            <%-- 제품 카테고리별로 조건문을 두어 리스트가 나오게 함 , 세부 카테고리 별로도 조건문 나눠야함.--%>
            <ul class="list-group">
            <c:choose>
                <c:when test="${largeCategory eq '국내도서'}">
                    <c:forEach var="bookList" items="${list}" varStatus="status">
                        <c:if test="${empty smallCategory and bookList.large_category eq largeCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="중고상품 모두보기" onclick="location.href='book_list?largeCategory=중고샵&title=${bookList.book_title}&author=${bookList.book_author}'"/>
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${bookList.large_category eq largeCategory and bookList.small_category eq smallCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="중고상품 모두보기" onclick="location.href='book_list?largeCategory=중고샵&title=${bookList.book_title}&author=${bookList.book_author}'"/>
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:when test="${largeCategory eq '외국도서'}">
                    <c:forEach var="bookList" items="${list}" varStatus="status">
                        <c:if test="${empty smallCategory and bookList.large_category eq largeCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="중고상품 모두보기" onclick="location.href='book_list?largeCategory=중고샵&title=${bookList.book_title}&author=${bookList.book_author}'"/>
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${bookList.large_category eq largeCategory and bookList.small_category eq smallCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="중고상품 모두보기" onclick="location.href='book_list?largeCategory=중고샵&title=${bookList.book_title}&author=${bookList.book_author}'"/>
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:when test="${largeCategory eq 'eBook'}">
                    <c:forEach var="bookList" items="${list}" varStatus="status">
                        <c:if test="${empty smallCategory and bookList.large_category eq largeCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="중고상품 모두보기" onclick="location.href='book_list?largeCategory=중고샵&title=${bookList.book_title}&author=${bookList.book_author}'"/>
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${bookList.large_category eq largeCategory and bookList.small_category eq smallCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="중고상품 모두보기" onclick="location.href='book_list?largeCategory=중고샵&title=${bookList.book_title}&author=${bookList.book_author}'"/>
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:when test="${largeCategory eq '웹소설/코믹'}">
                    <c:forEach var="bookList" items="${list}" varStatus="status">
                        <c:if test="${empty smallCategory and bookList.large_category eq largeCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="중고상품 모두보기" onclick="location.href='book_list?largeCategory=중고샵&title=${bookList.book_title}&author=${bookList.book_author}'"/>
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${bookList.large_category eq largeCategory and bookList.small_category eq smallCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="중고상품 모두보기" onclick="location.href='book_list?largeCategory=중고샵&title=${bookList.book_title}&author=${bookList.book_author}'"/>
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:when test="${largeCategory eq '중고샵'}">
                    <c:forEach var="bookList" items="${list}" varStatus="status">
                        <c:if test="${empty smallCategory and bookList.large_category eq largeCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${bookList.large_category eq largeCategory and bookList.small_category eq smallCategory}">
                            <c:set var="thumbnail" value="thumbnail${status.index}" />
                            <li class="list-group-item">
                                <div class="imgView">
                                    <div>
                                        <a href="review?bookId=${bookList.book_id}">
                                            <img src="upload/${imgList.get(thumbnail)}" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="bookContentView">
                                    <div>${bookList.book_title}</div>
                                    <div>
                                        <span>
                                            ${bookList.book_author} 저 | ${bookList.book_publisher} | ${bookList.publication_date}
                                        </span>
                                    </div>
                                    <div>재고량 ${bookList.book_stock}</div>
                                    <div>가격 ${bookList.book_price}</div>
                                    <div class="description">${bookList.book_description}</div>
                                </div>
                                <div class="button">
                                    <input type="button" class="btn btn-outline-success" value="책 상세보기" onclick="location.href='review?bookId=${bookList.book_id}'"/>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </c:when>
            </c:choose>
            </ul>
            <nav>
                <c:choose>
                    <%-- 검색했을 경우 페이징 --%>
                    <c:when test="${not empty searchType}">
                        <ul class="pagination">
                            <c:if test="${page ne 1 and not empty page and not empty list}">
                                <li class="page-item">
                                    <a class="page-link" href="book_list?largeCategory=${largeCategory}&page=${page-1}&searchType=${searchType}&searchName=${searchName}">이전</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pageNum}" var="page">
                                <li class="page-item">
                                    <a class="page-link" href="book_list?largeCategory=${largeCategory}&page=${page}&searchType=${searchType}&searchName=${searchName}">${page}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${page ne pageNum and not empty list}">
                                <li class="page-item">
                                    <a class="page-link" href="book_list?largeCategory=${largeCategory}&page=${page+1}&searchType=${searchType}&searchName=${searchName}">다음</a>
                                </li>
                            </c:if>
                        </ul>
                    </c:when>
                    <%-- 중고 상품 보기를 했을 경우 페이징 --%>
                    <c:when test="${not empty title}">
                        <ul class="pagination">
                            <c:if test="${page ne 1 and not empty page and not empty list}">
                                <li class="page-item">
                                    <a class="page-link" href="book_list?largeCategory=${largeCategory}&page=${page-1}&title=${title}&author=${author}">이전</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pageNum}" var="page">
                                <li class="page-item">
                                    <a class="page-link" href="book_list?largeCategory=${largeCategory}&page=${page}&title=${title}&author=${author}">${page}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${page ne pageNum and not empty list}">
                                <li class="page-item">
                                    <a class="page-link" href="book_list?largeCategory=${largeCategory}&page=${page+1}&title=${title}&author=${author}">다음</a>
                                </li>
                            </c:if>
                        </ul>
                    </c:when>
                    <%-- 세부 카테고리를 눌렀을 경우 페이징 --%>
                    <c:when test="${not empty smallCategory}">
                        <ul class="pagination">
                            <c:if test="${page ne 1 and not empty page and not empty list}">
                            <li class="page-item">
                                <a class="page-link" href="book_list?largeCategory=${largeCategory}&smallCategory=${smallCategory}&page=${page-1}">이전</a>
                            </li>
                            </c:if>
                            <c:forEach begin="1" end="${pageNum}" var="page">
                            <li class="page-item">
                                <a class="page-link" href="book_list?largeCategory=${largeCategory}&smallCategory=${smallCategory}&page=${page}">${page}</a>
                            </li>
                            </c:forEach>
                            <c:if test="${page ne pageNum and empty list and not empty list}">
                            <li class="page-item">
                                <a class="page-link" href="book_list?largeCategory=${largeCategory}&smallCategory=${smallCategory}&page=${page+1}">다음</a>
                            </li>
                            </c:if>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="pagination">
                            <c:if test="${page ne 1 and not empty page and not empty list}">
                                <li class="page-item">
                                    <a class="page-link" href="book_list?largeCategory=${largeCategory}&page=${page-1}">이전</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${pageNum}" var="page">
                                <li class="page-item">
                                    <a class="page-link" href="book_list?largeCategory=${largeCategory}&page=${page}">${page}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${page ne pageNum and not empty list}">
                                <li class="page-item">
                                    <a class="page-link" href="book_list?largeCategory=${largeCategory}&page=${page+1}">다음</a>
                                </li>
                            </c:if>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </nav>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script>
        function check() {
            if( searchForm.searchName.value == "" ) {
                searchForm.searchName.focus();
                alert("검색어를 입력해 주십시오.");

                return false;
            }
        }
    </script>

</body>
</html>
