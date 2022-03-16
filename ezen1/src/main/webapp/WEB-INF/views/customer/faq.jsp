<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주묻는질문</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<c:import url="pcMain.jsp"></c:import>

<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >
<c:import url="../header.jsp"></c:import>

<!-- container -->
  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative" style="max-width: 520px; margin-top: 60px;">
    <!-- 타이틀 -->
    <div class="container-sm container-fluid d-flex flex-row mb-0 pl-2 mt-1 border-bottom" style="height: 60px; font-size: 16px;">
      <!-- 뒤로가기 버튼 -->
      <div class="col-1 my-3">
          <img src="/img/icon/left.png" onclick="window.history.back()" alt="뒤로가기" width="30px" height="30px" style="cursor: pointer;">
      </div>
      <div class="col-11 my-3 py-1 text-center font-weight-bold">
        고객센터
      </div>
    </div>
    <!-- 네브바 -->
    <div class="container-sm container-fluid d-flex flex-row justify-content-around align-items-center text-decoration-none text-center border-bottom font-weight-bold" style="font-size: 16px; height: 90px;">
      <nav>
        <span>
          <a href="" class="text-primary col-4">FAQ</a>
        </span>
        <span>
          <a href="myAsk" class="text-black-50 col-4">내 문의내역</a>
        </span>
        <span>
          <a href="ask" class="text-black-50 col-4">문의하기</a>
        </span>
      </nav>
    </div>
    <!-- 문의종류 -->
    <div class="container-sm container-fluid d-flex justify-content-end mt-2 mb-2">
      <form name="faqCatForm" method="get" action="faqCatAction">
      <span>
        <select name="faq_cat" onchange="this.form.submit()" style="width: 100px; height: 50px; font-size: 14px;">
          <option value="전체문의">전체문의</option>
          <option value="상품문의">상품문의</option>
          <option value="배송문의">배송문의</option>
          <option value="결제문의">결제문의</option>
        </select>
      </span>
      </form>
    </div>
    <!-- faq아코디언 -->
  
    <div class="accordion container-sm container-fluid" id="accordion" style="font-size: 16px;">
      <c:forEach var="dto" items="${ getFaqList }">
      <div class="card my-1">
          <button class="container-sm container-fluid btn btn-outline-dark" type="button" data-toggle="collapse" data-target="#collapse_${dto.faq_idx}" aria-expanded="false" aria-controls="collapse" style="height: 50px;">
            <div class="d-flex justify-content-between">
              <span>
                ${dto.faq_title}
              </span>
              <span>
                <img src="/img/icon/down.png" alt="펼치기 아이콘" width="30px" height="30px">
              </span>
            </div>
          </button>
          <!-- 답변 -->
          <div class="collapse" id="collapse_${dto.faq_idx}" data-parent="#accordion">
            <div class="card-body">
              <span >
                ${dto.faq_contents}
              </span>
              <!-- 삭제버튼(관리자) -->
              <div class="d-flex justify-content-end">
              <c:if test="${ user_id eq 'admin' }">
              	<a href="faqDeleteAction?faq_idx=${ dto.faq_idx }">
                	<button class="btn btn-secondary" style="width: 60px; height: 30px; cursor: pointer;">삭제</button>
                </a>
       		  </c:if>
              </div>
            </div>
          </div>
      </div>
      </c:forEach>
    </div>
    <!-- 등록 버튼(관리자) -->
    <div class="container-sm container-fluid d-flex justify-content-end">
    <c:if test="${ user_id eq 'admin' }">
      <button class="btn btn-secondary mt-5" style="width: 100px; height: 40px; cursor: pointer;" onclick="popupHideAndShow(target = 'faq_write_popup')">등록</button>
      </c:if>
    </div>

    <!-- faq작성 팝업(관리자) -->
    <div class="position-absolute d-none bg-white border border-dark-50 rouned w-100" id="faq_write_popup" style="top: 60px; left: 10px; z-index: 1100; max-width: 520px;">
      <!-- 닫기 버튼 -->
      <div class="d-flex justify-content-end">
        <img src="/img/icon/cross.png" alt="닫기 버튼" width="30px" height="30px" style="cursor: pointer;" onclick="popupHideAndShow(target ='faq_write_popup')">
      </div>
      <div style="margin: 0 20px 30px">
        <!-- 타이틀 -->
        <div class="text-center font-weight-bold text-dark" style="height: 25px; margin-bottom: 20px; font-size: 16px;">
          FAQ문의
        </div>
        <div class="d-flex justify-content-center">
        <!-- 작성폼 시작 -->
         <form action="faqWriteAction" method="post" name="faqWriteForm" onsubmit="return nullChecker();">
          <!-- 히든 input -->
          <!-- <input type="hidden" name="faq_idx" value="faq_idx"> -->
          <div class="d-flex">
            <!-- 제목 -->
            <div>
              <input type="text" name="faq_title" placeholder="제목을 입력해주세요" class="text-dark nullcheck" style="width: 200px; height: 40px; margin-bottom: 5px; padding: 2px 15px; font-size: 14px;">
            </div>
              <!-- 카테고리 -->
            <div>
              <select name="faq_cat" style="width: 100px; height: 40px; font-size: 14px;">
                <option selected hidden>문의 종류</option>
                <option value="상품문의">상품문의</option>
                <option value="배송문의">배송문의</option>
                <option value="결제문의">결제문의</option>
              </select>
            </div>
          </div>
    <!-- 내용 -->
          <div>
            <textarea name="faq_contents" placeholder="내용을 입력해주세요" cols="30" rows="10" class="text-dark nullcheck" style="width: 300px; height: 100px; font-size: 14px; margin-bottom: 30px;resize: none;"></textarea>
          </div>
      <!-- 확인 버튼 -->
          <div class="d-flex align-items-center justify-content-center">
            <input type="submit" value="확인" class="btn btn-dark text-light form-control" style="width: 185px; margin: 20px 80px 0; font-size: 14px; cursor: pointer;">
          </div>
          </form>
        </div>
          
      </div>
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