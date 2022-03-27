<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의내역</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<c:import url="../pcMain.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">
<c:import url="../header.jsp"></c:import>

  <!-- container -->
  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative mb-5" id="mainContainer" style="max-width: 520px; margin-top:0;">

    <!-- 네브바 -->
    <div class="container-sm container-fluid d-flex flex-row justify-content-around align-items-center text-decoration-none text-center border-bottom font-weight-bold" style="font-size: 16px; height: 90px;">
      <nav>
        <span>
          <a href="/customer/faq" class="text-black-50 col-4">FAQ</a>
        </span>
        <span>
          <a href="" class="text-primary col-4">내 문의내역</a>
        </span>
        <span>
          <a href="/customer/ask" class="text-black-50 col-4">문의하기</a>
        </span>
      </nav>
    </div>
    <!-- 문의종류 -->
    <div class="container-sm container-fluid d-flex justify-content-end my-3">
      <form name="myAskCatForm" method="get" action="myAskCatAction">
      <span>
        <select name="onetoone_cat" onchange="this.form.submit();" class="font-primary rounded px-1 py-1" style="width: 100px; height: 38px;">
          <option >문의종류</option>
          <option value="전체문의" <c:if test="${ onetoone_cat == '전체문의'}"> selected </c:if> >전체문의</option>
          <option value="상품문의" <c:if test="${ onetoone_cat == '상품문의'}"> selected </c:if> >상품문의</option>
          <option value="배송문의" <c:if test="${ onetoone_cat == '배송문의'}"> selected </c:if> >배송문의</option>
          <option value="결제문의" <c:if test="${ onetoone_cat == '결제문의'}"> selected </c:if> >결제문의</option>
         <%--  <option value="개별상품" <c:if test="${ onttoont_cat == '개별상품'}"> selected </c:if> >개별상품</option> --%>
        </select>
      </span>
    </form>
    </div>
    <!-- 문의내역 아코디언 -->
   
    <div class="accordion container-sm container-fluid my-2 font-secondary" id="accordion" >
     <c:forEach var="dto" items="${ getOneToOneList }">
      <div class="card my-2">
          <button class="container-sm container-fluid btn btn-outline-dark" type="button" data-toggle="collapse" data-target="#collapse_${dto.onetoone_idx}" aria-expanded="false" aria-controls="collapse">
            <div class="d-flex flex-wrap justify-content-between">
              <span class="col-8 text-left px-0 mb-1">
                ${dto.onetoone_title}
              </span>
              <span class="col-4 text-right px-0 font-secondary">
                ${dto.onetoone_date}
              </span>
              <span class="col-10 text-left font-primary px-0">
                ${dto.onetoone_contents}
              </span>
              <span class="col-2 text-right pr-0 pt-5">
                <img src="/img/icon/down.png" alt="펼치기 아이콘" width="25px" height="25px">
              </span>
            </div>
          </button>
          <!--답변 -->
          <div class="collapse" id="collapse_${dto.onetoone_idx}" data-parent="#accordion">
            <div class="card-body">
              <span >
                ${dto.onetoone_reply}
              </span>
            </div>
          </div>
      </div>
      </c:forEach>
      <%-- <c:if test="${ !onetoone_cat || onetoone_cat == '개별상품' }">
      <c:forEach var="question" items="${ questionList }">
      <div class="card my-2">
          <button class="container-sm container-fluid btn btn-outline-dark" type="button" data-toggle="collapse" data-target="#collapse_${question.question_idx}" aria-expanded="false" aria-controls="collapse">
            <div class="d-flex flex-wrap justify-content-between">
              <span class="col-8 text-left px-0 mb-1">
                ${question.question_title}
              </span>
              <span class="col-4 text-right px-0 font-secondary">
              <c:set var="idx" value="${ question.goods_idx }"  />
              	<c:forEach var="name" items="${ goodsnamelist }">
              		<c:if test="${ name.containsKey(idx) }">
              			${ name.get(idx) }에 등록된 질문입니다.&nbsp;
              		</c:if>
              	</c:forEach>
              	<c:remove var="idx"/>
                ${question.question_date}
              </span>
              <span class="col-10 text-left font-primary px-0">
                ${question.question_contents}
              </span>
              <span class="col-2 text-right pr-0 pt-5">
                <img src="/img/icon/down.png" alt="펼치기 아이콘" width="25px" height="25px">
              </span>
            </div>
          </button>
          <!--답변 -->
          <div class="collapse" id="collapse_${question.question_idx}" data-parent="#accordion">
            <div class="card-body">
              <span >
                ${question.question_reply}
              </span>
            </div>
          </div>
      </div>
      </c:forEach>
      </c:if> --%>
  </div>
  </div>
    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>
</div>

<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>