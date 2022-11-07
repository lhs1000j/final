<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: G
  Date: 2022-10-21
  Time: 오후 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="js/jquery.min.js"></script>
    <script>
        function thumbNail(event){
            const reader = new FileReader();

            reader.onload = function (event) {
                //let img = document.createElement("img");
                let img = document.getElementById("preview_image");
                console.log(event.target.result);
                img.setAttribute("src",event.target.result);
                //img.setAttribute("class","preview_image")
                document.querySelector("div#image_container").appendChild(img);
            }
            reader.readAsDataURL(event.target.files[0]);
        }

    </script>
    <style>
        #preview_image{
            width: 100%;
        }
        input{border: 0;}
        textarea {border: 0; width: 100%;}
        input:focus, textarea:focus{outline-color: #999;}
        td{vertical-align: top;}
        :root{
            --bgColor: #3a3a3a;
            --hoverBg: #616161;
            --text: #bbb;
        }

        @media (any-hover: hover){
            .inner:hover{
                background-color: var(--hoverBg);
            }
        }

        .label--hover{
            background-color: var(--hoverBg);
        }

        .preview-title{
            font-size: 32px;
            margin-bottom: 8px;
        }

        .preview {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            padding: 16px;
            margin-bottom: 16px;
            border-radius: 8px;
            align-items: center;
            background-color: var(--bgColor);
        }

        .embed-img{
            width: 100%;
            height: 128px;
            object-position: center;
            object-fit: cover;
            border-radius: 8px;
        }

         div#editor {
             padding: 16px 24px;
             border: 1px solid #D6D6D6;
             border-radius: 4px;
         }
        button.active {
            background-color: purple;
            color: #FFF;
        }
        #editor img {
             max-width: 100%;
         }
        #img-selector {
            display: none;
        }
        body{
             max-width: 1200px;
             margin: 0 auto;
        }
    </style>
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
<div style="margin: 10px;">
    <h3>상품 등록</h3>
    <form method="post" action="product_uploadOk" enctype="multipart/form-data">
        <table class="table table-bordered" style="table-layout: fixed; background-color: #f7f7f7;">
            <tr>
                <td rowspan="8">
                    <input type="file" accept="image/*" name="imgfile" id="image" onchange="thumbNail(event)">
                    <div id="image_container">
                        <img src="https://via.placeholder.com/100x150" alt="" id="preview_image">
                    </div>
                </td>
                <td>상품명</td>
                <td colspan="3">
                    <input type="text" name="bookTitle" size="50" placeholder="상품명">
                    <input type="hidden" name="member_id" value="">
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
<%--                                <option value="">미선택</option>--%>
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
                <td><input type="text" name="bookAuthor"></td>
                <td>출판사/기획사/제조사</td>
                <td><input type="text" name="bookPublisher"></td>
            </tr>
            <tr>
                <td>가격 정보</td>
                <td colspan="1">
                    <input type="text" name="bookPrice" id="price" size="10"> 원
                </td>
                <td>책 상태</td>
                <td>
                    <select name="bookStatus">
                        <option value="1">아주 나쁨</option>
                        <option value="3">나쁨</option>
                        <option value="5">양호</option>
                        <option value="7">좋음</option>
                        <option value="9">아주 좋음</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>발행일</td>
                <td colspan="3">
                    <input type="text" name="publicationDate" placeholder="xxxx/xx/xx">
                </td>
            </tr>
            <tr>
                <td>책 내용 소개</td>
                <td colspan="3">
                    <textarea name="bookDescription" cols="30" rows="10"></textarea>
                </td>
            </tr>
        </table>
        <div style="text-align: center;">
            <input type="submit" name="" id="" value="등록" class="btn btn-secondary">
        </div>
    </form>
</div>

</body>
</html>
