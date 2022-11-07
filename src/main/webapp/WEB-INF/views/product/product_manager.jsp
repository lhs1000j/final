<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-26
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script>
    function thumbNail(event){
      const reader = new FileReader();

      reader.onload = function (event) {
        //let img = document.createElement("img");
        let img = document.getElementById("preview_image")
        img.setAttribute("src",event.target.result);
        //img.setAttribute("class","preview_image")
        document.querySelector("div#image_container").appendChild(img);
      }
      reader.readAsDataURL(event.target.files[0]);
    }
  </script>
  <style>
    .boxes{width: 95%;
      background-color: rgba(150, 200, 255, 0.3);
      padding: 10px;
      margin: 10px;
      border-radius: 1em;
      margin: 10px auto;
    }
  </style>
  <script src="js/jquery.min.js"></script>
  <script>
    const showValue = (target) => {
      const value = target.value;
      const text =  target.options[target.selectedIndex].text;
      if (value=='웹소설/코믹'){
        document.querySelector(".smallCategory").innerHTML = "<option value='판타지'>판타지</option>"+
                "<option value='무협'>무협</option>"+"<option value='로맨스'>로맨스</option>"+"<option value='라이트노벨'>라이트노벨</option>"
      } else {
        document.querySelector(".smallCategory").innerHTML = "<option value='소설/시'>소설/시</option>"+
                "<option value='에세이'>에세이</option>"+"<option value='인문/역사'>인문/역사</option>"+"<option value='과학'>과학</option>"+
                "<option value='경제/경영'>경제/경영</option>"+"<option value='자기계발'>자기계발</option>"
      }
    }
  </script>
</head>
<body>
  <div>
    <jsp:include page="product_header.jsp"></jsp:include>
  </div>

  <c:if test="${bookInfo2.bookId != null}">
    <div class="boxes">
      <form method="post"
              <c:if test="${sessionScope.get('member_class')== 1}">
                action = "product_upload"
              </c:if>
              <c:if test="${sessionScope.get('member_class')!=1}">
                action="product_update"
              </c:if>
            enctype="multipart/form-data">
        <table class="table table-bordered" style="table-layout: fixed; background-color: #f7f7f7;">
          <tr>
            <td rowspan="8">
              <input type="file" accept="image/*" name="imgfile" id="image" onchange="thumbNail(event)">
              <div id="image_container">
                <img src="/upload/${bookImg2.storedThumbnail}" alt="" id="preview_image" style="width: 100%;">
              </div>
            </td>
            <td>상품명</td>
            <td colspan="3">
              <input type="hidden" name="bookId" value="${bookInfo2.bookId}">
              <input type="text" name="bookTitle" size="50" placeholder="상품명" value="${bookInfo2.bookTitle}">
            </td>
          </tr>
          <tr>
            <td>분야</td>
            <td colspan="3">
              카테고리1 :
                <%--                    <input type="text" name="largeCategory" id="category1">--%>
              <c:choose>
                <c:when test="${sessionScope.member_class eq 2}">
                  <select name="largeCategory" onchange="showValue(this)">
<%--                    <option value="">미선택</option>--%>
                    <option value="국내도서" selected>국내도서</option>
                    <option value="외국도서">외국도서</option>
                    <option value="eBook">eBook</option>
                    <option value="웹소설/코믹">웹소설/코믹</option>
                  </select>
                </c:when>
                <c:otherwise>
                  <select name="largeCategory">
                    <option value="중고샵">중고샵</option>
                  </select>
                </c:otherwise>
              </c:choose>
              카테고리2 :
                <%--                    <input type="text" name="smallCategory" id="category2">--%>
              <c:choose>
                <c:when test="${sessionScope.member_class eq 2}">
                  <select name="smallCategory" class="smallCategory">
                      <option value='소설/시'>소설/시</option>
                      <option value='에세이'>에세이</option>
                      <option value='인문/역사'>인문/역사</option>
                      <option value='과학'>과학</option>
                      <option value='경제/경영'>경제/경영</option>
                      <option value='자기계발'>자기계발</option>
                  </select>
                </c:when>
                <c:otherwise>
                  <select name="smallCategory" class="smallCategory">
                    <option value="국내도서">국내도서</option>
                    <option value="외국도서">외국도서</option>
                    <option value="웹소설/코믹">웹소설/코믹</option>
                  </select>
                </c:otherwise>
              </c:choose>
            </td>
          </tr>
          <tr>
            <td>저자/아티스트</td>
            <td><input type="text" name="bookAuthor" value="${bookInfo2.bookAuthor}"></td>
            <td>출판사/기획사/제조사</td>
            <td><input type="text" name="bookPublisher" value="${bookInfo2.bookPublisher}"></td>
          </tr>
          <tr>
            <td>가격 정보</td>
            <td colspan="3">
              <input type="text" name="bookPrice" id="price" value="${bookInfo2.bookPrice}"> 원
            </td>
          </tr>
          <tr>
            <td>발행일</td>
            <td colspan="3">
              <input type="text" name="publicationDate" placeholder="xxxx/xx/xx" value="${bookInfo2.publicationDate}">
            </td>
          </tr>
          <tr>
            <td>책 내용 소개</td>
            <td colspan="3">
              <textarea name="bookDescription" cols="30" rows="10">${bookInfo2.bookDescription}</textarea>
            </td>
          </tr>
        </table>
        <div style="text-align: center;">
            <input type="submit" value="수정" class="btn btn-secondary">
            <input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='product_deleteOk?bookId=${bookInfo2.bookId}'">
        </div>
      </form>
    </div>
  </c:if>

  <div>
    <div class="boxes">
      <%--            <%@include file="product_stock_manager.jsp"%>--%>
      <h3>상품 관리</h3>
      <form action="product_manager">
        <div class="input-group mb-3" style="width: 700px; margin: 30px 0; background-color: white; flex-direction: row">
          <!-- <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">{Dropdown}</button> -->
          <select class="btn btn-outline-secondary dropdown-toggle" type="button"  aria-expanded="false" name="searchOption">
            <option value="bookTitle" <c:if test="${searchOption.equals('book_title')}"> selected </c:if> >
              <a class="dropdown-item" href="#">책 제목</a>
            </option>
            <option value="bookId"<c:if test="${searchOption.equals('book_id')}">selected</c:if> >
              <a class="dropdown-item" href="#">책 번호</a></option>
          </select>
          <input type="text" class="form-control" aria-label="Text input with segmented dropdown button" name="searchText" value="${searchText}">
          <input type="submit" class="btn btn-outline-secondary" id="button-addon2" value="검색">
        </div>
      </form>
      검색기능, 카테고리기능, 배송조회
      <table class="table table-bordered">
        <tr class="table-info">
          <td>이미지</td>
          <td>책 번호</td>
          <td>책 제목</td>
          <td>큰 카테고리</td>
          <td>작은 카테고리</td>
          <td>가격</td>
          <td>저자</td>
          <td>출판사</td>
          <td>출판일</td>
          <td>수정/삭제</td>
        </tr>
        <c:forEach items="${bookInfoList}" var="bookInfo" varStatus="status">
          <tr class="table-light">
            <td>
              <img src="upload/${bookImgList[status.index].storedThumbnail}" width="100px" height="150px">
            </td>
            <td>
                ${bookInfo.bookId}
            </td>
            <td>
                ${bookInfo.bookTitle}
            </td>
            <td>
                ${bookInfo.largeCategory}
            </td>
            <td>
                ${bookInfo.smallCategory}
            </td>
            <td>
                ${bookInfo.bookPrice}
            </td>
            <td>
                ${bookInfo.bookAuthor}
            </td>
            <td>
                ${bookInfo.bookPublisher}
            </td>
            <td>
                ${sdf.format(bookInfo.publicationDate)}
            </td>
            <td>
              <c:if test="${sessionScope.get('member_class')==1}">
                <input type="button" value="수정/삭제" onclick="location.href='product_manager?bookId=${bookInfo.bookId}'">
              </c:if>
              <input type="button" value="등록" onclick="location.href='product_manager?bookId=${bookInfo.bookId}'">
            </td>
          </tr>
        </c:forEach>
      </table>
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item" style="margin: 0; <c:if test="${list.startPage<4}">display: none;</c:if>"><a class="page-link" href="/product_manager?currentPage=${list.startPage-3}&searchOption=${searchOption}&searchText=${searchText}">Previous</a></li>
          <c:forEach var="pNo" begin="${list.startPage}" end="${list.endPage}" step="1" varStatus="status">
            <li class="page-item" style="margin: 0;"><a class="page-link" href="/product_manager?currentPage=${pNo}&searchOption=${searchOption}&searchText=${searchText}">${status.index}</a></li>
          </c:forEach>
          <li class="page-item" style="margin: 0; <c:if test="${list.endPage>=list.totalPages}">display: none;</c:if>"><a class="page-link" href="/product_manager?currentPage=${list.startPage+3}&searchOption=${searchOption}&searchText=${searchText}">Next</a></li>
        </ul>
      </nav>
    </div>
  </div>
<script>
  $(document).ready()
</script>
</body>
</html>
