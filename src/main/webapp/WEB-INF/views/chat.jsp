<%--
  Created by IntelliJ IDEA.
  User: 황우성
  Date: 2022-10-27
  Time: PM 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Book Chatting</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <style>
        .notice { height: 100px; width: 100%; position: absolute; top: 0; text-align: center; }
        .noticeContent { width: 100%; display: flex; text-align: center; background-color: #2aab1d; vertical-align: center; }
        .noticeContent strong { line-height: 64px; }
        .noticeClose {display:inline-block;*display:inline; margin-left: 80px; cursor: pointer;}
        .noticeClose:after {display: inline-block;content: "\00d7"; font-size:30pt;}
        #chatarea { overflow:auto; height: 520px; }
        #chatarea div { height: 60px; margin-top: 10px; text-align: center; }
    </style>
</head>
<body>
  <%-- session으로 로그인한 아이디와 회원등급을 불러와서 입력 --%>
  <input type="hidden" id="id"
         value="<c:choose>
                    <c:when test="${not empty sessionScope.member_id}">
                        ${sessionScope.member_id}
                    </c:when>
                    <c:otherwise>비회원</c:otherwise>
                </c:choose>">
  <input type="hidden" id="member"
         value="<c:if test="${not empty sessionScope.member_class}">
                    <c:choose>
                        <c:when test="${sessionScope.member_class eq 0}">
                            [일반회원]
                        </c:when>
                        <c:when test="${sessionScope.member_class eq 1}">
                            [판매자회원]
                        </c:when>
                        <c:when test="${sessionScope.member_class eq 2}">
                            [관리자]
                        </c:when>
                        <c:otherwise>
                            [비회원]
                        </c:otherwise>
                    </c:choose>
                </c:if>">
  <div class="notice">
    <div class="noticeContent">
        <strong>대화방에 전화번호와 계좌번호를 남기면 범죄에 사용될 수 있습니다.</strong>
        <div class="noticeClose"></div>
    </div>
  </div>
  <div>
    <div id="chatarea" class="form-control"></div>
      <div class="input-group">
        <%-- enter키의 아스키 코드값이 13번이여서 엔터키가 눌리면 보내기가 되도록 스크립트 설정 --%>
        <input type="text" class="form-control"  id="message" onKeypress="javascript:if(event.keyCode==13) {document.getElementById('send').click()}" />
        <input type="button" class="btn btn-outline-secondary" id="send" value="보내기" />
        <input type="button" class="btn btn-outline-secondary" id="exit" value="나가기" />
      </div>
  </div>

  <script type="text/javascript">
    let websocket;
    connect();
    function connect(){
        /* 상대 경로와 상대 포트 주소를 사용해 어디서 접속하든 사용할 수 있게 설정 */
      websocket = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}/chat-ws");
      //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
      websocket.onopen = onOpen;
      websocket.onmessage = onMessage;
    }

    function onOpen(){
      id = document.getElementById("id").value;
      member = document.getElementById("member").value;
      websocket.send(id+member+"님 입장하셨습니다.");
    }

    document.getElementById("send").addEventListener("click", function() {
      send();
    });

    function send(){
      id = document.getElementById("id").value;
      msg = document.getElementById("message").value;
      websocket.send(id + ":"+ msg);
      document.getElementById("message").value = "";
    }

    function onMessage(evt){
      data= evt.data;
      chatarea = document.getElementById("chatarea");
      chatarea.innerHTML = chatarea.innerHTML + "<br/>" + data
    }

    document.getElementById("exit").addEventListener("click", function() {
      disconnect();
    });

    function disconnect(){
      id = document.getElementById("id").value;
      websocket.send(id+"님이 퇴장하셨습니다");
      websocket.close();
    }
  </script>
  <script>
    document.querySelector(".noticeClose").addEventListener("click", function () {
      this.closest(".notice").style.display = "none";
    });
  </script>
</body>
</html>
