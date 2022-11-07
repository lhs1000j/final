<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-21
  Time: 오후 6:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Green Book</title>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<footer>
    <div class="margin_con">
        <hr>
        <div id="layout_footer" class="layout_footer">
            <div class="footer_a">
                <div class="resp_wrap">
                    <ul class="menu1">
                        <li class="foot_menu_d1">
                            <h4 class="title">
                                <a href="">CS CENTER</a>
                            </h4>
                            <ul class="list v4">
                                <li class="compay_phone">
                                    <a href="tel:051-912-1000">
                                        <img src="img/call_FILL0_wght400_GRAD0_opsz48.png" class="img_call" alt="" />
                                        051-912-1000
                                    </a>
                                </li>
                                <li>
                                    <p>
                                        OPEN : AM 09:30 - PM 06:30
                                        <br />
                                        SAT, SUN, HOLIDAY OFF
                                    </p>
                                    <p>
                                        영업시간외 문의는 카카오톡 채널로
                                        <br />
                                        부탁드립니다
                                    </p>
                                </li>
                            </ul>
                            <ul class="sns">
                                <li>
                                    <a class="slink" href="#"><img class="simg" src="img/2.png"></a>
                                </li>
                                <li>
                                    <a class="slink" href="#"><img class="simg" src="img/4.png"></a>
                                </li>
                                <li>
                                    <a class="slink" href="#"><img class="simg" src="img/5.png"></a>
                                </li>
                            </ul>
                            <!-- //고객센터 -->
                        </li>
                        <li class="foot_menu_d2">
                            <h4 class="title">
                                    <span>
                                        BANK INFO
                                    </span>
                            </h4>
                            <ul class="list v3 gray_03">
                                <li>
                                    <p>신한 110-450-551224</p>
                                    <p>
                                            <span class="gray_06">
                                                예금주 :
                                            </span>
                                        그린샵
                                    </p>
                                </li>
                            </ul>
                            <!-- //무통장 입금계좌 -->
                        </li>
                        <li class="foot_menu_d3">
                            <h4 class="title">
                                    <span>
                                        SHOP MENU
                                    </span>
                            </h4>
                            <ul class="menuList">
                                <li>
                                    <a href="/mypage"><img src="img/2-1.png" alt="">
                                        <p class="desc">
                                            마이페이지
                                        </p>
                                    </a>
                                </li>
                                <c:if test="${not empty sessionScope.member_id and sessionScope.member_class ne 2}">
                                <li>
                                    <a href="/cart"><img src="img/2-2.png" alt="">
                                        <p class="desc">
                                            CART
                                        </p>
                                    </a>
                                </li>
                                </c:if>
                                <li>
                                    <a href="/list"><img src="img/2-3.png" alt="">
                                        <p class="desc">
                                            CS CENTER
                                        </p>
                                    </a>
                                </li>
                            </ul>
                            <!-- //게시판 -->
                        </li>
                        <li class="foot_menu_d4">
                            <h4 class="title">
                                    <span>
                                        DELIVERY INFO
                                    </span>
                            </h4>
                            <ul class="list v5">
                                <li>
                                        <span>
                                            반품주소 :
                                        </span>
                                    부산광역시 부산진구 중앙대로 688 한준빌딩
                                </li>
                                <li style="text-indent:0; padding-left:0;">
                                        <span>
                                            배송조회 : 로젠택배 1588-9988
                                        </span>&nbsp;
                                    <a href="https://www.ilogen.com/web/personal/tkSearch"
                                       target="_blank"
                                       title="새창"
                                       class="btn_resp"
                                       alt="택배사 배송추적 주소를 입력하세요.">
                                        배송추적
                                    </a>
                                </li>
                            </ul>
                            <!-- //배송 정보 -->
                        </li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="footer_b">
                <div class="resp_wrap">
                    <ul class="menu2">
                        <li>
                            <span>
                                회사명 :
                            </span>
                            <span class="pcolor">
                                    그린샵(주)
                            </span>
                        </li>
                        <li>
                            <span>
                                대표자 :
                            </span>
                            <span class="pcolor">
                                    이홍섭
                            </span>
                        </li>
                        <li>
                            <span>
                                주소 :
                            </span>
                            <span class="pcolor">
                                    부산광역시 부산진구 중앙대로 688 한준빌딩
                            </span>
                        </li>
                        <li>
                            <span>
                                전화 :
                            </span>
                            <a href="tel:051-912-1000" class="pcolor">
                                051-912-1000
                            </a>
                        </li>
                        <li>
                            <span>
                                개인정보보호책임자 :
                            </span>
                            이홍섭
                        </li>
                        <li>
                            <span>
                                회사 이메일 :
                            </span>
                            <span class="pcolor">
                                    <a class="pcolor" href="mailto:green@greenshop.co.kr">
                                        green@greenshop.co.kr
                                    </a>
                            </span>
                        </li>
                    </ul>
                    <p class="copyright">
                        COPYRIGHT (c)
                        <span class="pcolor">그린샵(주)</span>
                        ALL RIGHTS RESERVED.</p>
                    <div class="escrow"></div>
                    <!-- //회사 정보 -->
                </div>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
