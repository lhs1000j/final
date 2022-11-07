<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-25
  Time: 오후 3:30
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Green Book</title>
    <link rel="stylesheet" href="css/productDetail.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <style>

    </style>
</head>
<body>
<jsp:include page="../header.jsp" />
<div class="wrapper">
    <div class="wrap">
        <div class="content_area">
            <div class="line">
                <div class="content_top">
                    <div class="ct_left_area">
                        <div class="image_wrap">
                            <img src="upload/${bookImg.storedThumbnail}" style="width: 200px;" />
<%--                        <img src="img/임의 폴더 / ${cart.book_id}.jpg">--%>
                    </div>
                </div>
                <div class="ct_right_area">
                    <div class="title">
                        <h1>
                            ${bookDetail.book_title}
                        </h1>
                    </div>
                    <div class="line"></div>
                    <div class="author">
                                <span>
                                    ${bookDetail.book_author} 지음
                                </span>
                        <span>|</span>
                        <span>
                            ${bookDetail.book_publisher}
                        </span>
                        <span>|</span>
                        <span class="publeyear">
                            ${bookDetail.publication_date}
                        </span>
                    </div>
                    <div class="line"></div>
                    <div class="price">
                        <div class="sale_price">정가 :
                            <fmt:formatNumber value="${bookDetail.book_price}" pattern="#,### 원"/></div>
                        <div>
                            적립 포인트 :
                            <span class="point_span"></span>원
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="button">
                        <div class="button_quantity">
                            주문수량
                            <input type="text" class="quantity_input" value="1">
                            <span>
                                        <button class="plus_btn">+</button>
                                        <button class="minus_btn">-</button>
                                    </span>
                        </div>
                        <div class="button_set">
                            <a class="btn_cart" href="cartAdd?book_id=${book_id}">장바구니 담기</a>
                            <a class="btn_buy" href="">바로구매</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="line"></div>
            <div class="content_middle">
                <div class="book_content">
                    ${bookDetail.book_description }
                </div>
            </div>
            <div class="line"></div>
        </div>
        <div class="content_bottom">
            <div class="reply_subject">
                <h2>한줄평 (${review_count})</h2>
                <p>매주 10건의 우수리뷰를 선정하여 포인트를 드립니다.</p>
            </div>

            <div class="sum_wrap">
                <p><b class="count">${review_count}</b> 명의 회원이 평가한 평균 별점 </p>
                <div class="avg">
                    <c:choose>
                        <c:when test="${review_count ==0}">
                            <div>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                            </div>
                        </c:when>
                        <c:when test="${avg >= 1 && avg <1.5}">
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                            </div>
                        </c:when>
                        <c:when test="${avg >= 1.5 && avg < 2}">
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                            </div>
                        </c:when>
                        <c:when test="${avg >= 2 && avg < 2.5}">
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                            </div>
                        </c:when>
                        <c:when test="${avg >= 2.5 && avg < 3}">
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                            </div>
                        </c:when>
                        <c:when test="${avg >= 3 && avg < 3.5}">
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star"></i>
                                <i class="bi bi-star"></i>
                            </div>
                        </c:when>
                        <c:when test="${avg >= 3.5 && avg < 4}">
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                                <i class="bi bi-star"></i>
                            </div>
                        </c:when>
                        <c:when test="${avg >= 4 && avg < 4.5}">
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star"></i>
                            </div>
                        </c:when>
                        <c:when test="${avg >= 4.5 && avg < 5}">
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                            </div>
                        </c:when>
                        <c:when test="${avg == 5}">
                            <div>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                            </div>
                        </c:when>

                    </c:choose>

                    <p class="avg_score"><b>${avg}</b> / 5</p>
                </div>
            </div>

            <c:if test="${empty member_id}">
                    <p class="log_txt">비회원입니다. 리뷰 작성을 원하시면 로그인 해주세요.</p>
                <div class="log">
                    <a href="/login" class="loginArea">로그인</a>
                    <a href="/signUp" class="loginArea">회원가입</a>
                </div>
            </c:if>

            <c:if test="${not empty member_id}">
                <div class="review_wrap">
                    <form action="review_write?bookId=${bookDetail.book_id}&userId=${member_id}" method="post">
                        <div class="review">
                            <p class="reviewstar">평점</p>
                            <div class="star-rating">
                                <input type="radio" id="5-stars" name="review_score" value="5" />
                                <label for="5-stars" class="star">&#9733;</label>
                                <input type="radio" id="4-stars" name="review_score" value="4" />
                                <label for="4-stars" class="star">&#9733;</label>
                                <input type="radio" id="3-stars" name="review_score" value="3" />
                                <label for="3-stars" class="star">&#9733;</label>
                                <input type="radio" id="2-stars" name="review_score" value="2" />
                                <label for="2-stars" class="star">&#9733;</label>
                                <input type="radio" id="1-star" name="review_score" value="1" />
                                <label for="1-star" class="star">&#9733;</label>
                            </div>
                        </div>
                        <input type="text" name="review_text" class="review_text">
                        <input type="submit" value="입력" class="inputBtn">
                    </form>
                </c:if>


                <c:if test="${empty review}">
                    <div class="review_empty">
                        <h3>현재 등록된 한줄평이 없습니다.</h3>
                    </div>
                </c:if>

                <c:if test="${not empty review}">
                    <div class="review_list">
                        <table width="100%" border="0" style="text-align: center; font-size: 18px;"class="review_table">
                            <tr>
                                <td style="width: 15%; font-weight: bold; height: 60px">레이팅</td>
                                <td style="width: 10%; font-weight: bold;height: 60px">유저</td>
                                <td style="width: 55%; font-weight: bold;height: 60px">한줄평</td>
                                <td style="width: 20%; font-weight: bold;height: 60px">날짜</td>
                            </tr>
                            <c:forEach items="${review}" var="dto">
                                <tr>
                                    <td style="height: 45px; font-size: 20px;">
                                        <c:choose>
                                            <c:when test="${dto.review_score eq '1'}">
                                                <p class="review_star">★☆☆☆☆</p>
                                            </c:when>
                                            <c:when test="${dto.review_score eq '2'}">
                                                <p class="review_star">★★☆☆☆</p>
                                            </c:when>
                                            <c:when test="${dto.review_score eq '3'}">
                                                <p class="review_star">★★★☆☆</p>
                                            </c:when>
                                            <c:when test="${dto.review_score eq '4'}">
                                                <p class="review_star">★★★★☆</p>
                                            </c:when>
                                            <c:when test="${dto.review_score eq '5'}">
                                                <p class="review_star">★★★★★</p>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td style="height: 45px; font-size: 16px;">${dto.member_id}</td>
                                    <td style="height: 45px; font-size: 16px;">${dto.review_text}</td>
                                    <td style="height: 45px; font-size: 16px;">
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${dto.review_date}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->
<jsp:include page="../footer.jsp" />
<script>

    $(document).ready(function () {

        /* publeyear */
        const year = "${bookDetail.publication_date}";

        let tempYear = year.substr(0, 10);

        let yearArray = tempYear.split("-")
        let publeYear = yearArray[0] + "년 " + yearArray[1] + "월 " + yearArray[2] + "일";

        $(".publeyear").html(publeYear);


        /* 포인트 삽입 */
        let salePrice = "${bookDetail.book_price}"
        let point = salePrice * 0.05;
        point = Math.floor(point);
        $(".point_span").text(point);

    }); //$(document).ready(function(){
    // 수량 버튼 조작
    let quantity = $(".quantity_input").val();
    $(".plus_btn").on("click", function () {
        $(".quantity_input").val(++quantity);
    });
    $(".minus_btn").on("click", function () {
        if (quantity > 1) {
            $(".quantity_input").val(--quantity);
        }
    });
    // 서버로 전송할 데이터
    const form = {
        memberId: '${member.memberId}',
        bookId: '${goodsInfo.bookId}',
        bookCount: ''
    }
    // 장바구니 추가 버튼

    function cartAlert(result) {
        if (result == '0') {
            alert("장바구니에 추가를 하지 못하였습니다.");
        } else if (result == '1') {
            alert("장바구니에 추가되었습니다.");
        } else if (result == '2') {
            alert("장바구니에 이미 추가되어져 있습니다.");
        } else if (result == '5') {
            alert("로그인이 필요합니다.");
        }
    }
    /* 바로구매 버튼 */
    $(".btn_buy").on("click", function () {
        let bookCount = $(".quantity_input").val();
        $(".order_form")
            .find("input[name='orders[0].bookCount']")
            .val(bookCount);
        $(".order_form").submit();
    });

</script>
</body>
</html>

