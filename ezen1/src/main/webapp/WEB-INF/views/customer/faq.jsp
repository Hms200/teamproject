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
<c:import url="../pcMain.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top: 60px;">
<c:import url="../header.jsp"></c:import>

<!-- container -->
  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative mb-5" id="mainContainer" style="max-width: 520px; margin-top:0;">
    <!-- 네브바 -->
    <div class="container-sm container-fluid d-flex flex-row justify-content-around align-items-center text-decoration-none text-center border-bottom font-weight-bold" style="height: 90px;">
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
    <div class="container-sm container-fluid d-flex justify-content-end my-3">
      <form name="faqCatForm" method="get" action="faqCatAction">
      <span>
        <select name="faq_cat" onchange="this.form.submit()" class="font-primary rounded px-1 py-1" style="width: 100px; height: 38px;">
          <option hidden>문의종류</option>
          <option value="전체문의" <c:if test="${ faq_cat == '전체문의'}"> selected </c:if> >전체문의</option>
          <option value="상품문의" <c:if test="${ faq_cat == '상품문의'}"> selected </c:if> >상품문의</option>
          <option value="배송문의" <c:if test="${ faq_cat == '배송문의'}"> selected </c:if> >배송문의</option>
          <option value="결제문의" <c:if test="${ faq_cat == '결제문의'}"> selected </c:if> >결제문의</option>
        </select>
      </span>
      </form>
    </div>
    <!-- faq아코디언 -->
    <div class="accordion container-sm container-fluid" id="accordion">
      <c:forEach var="dto" items="${ getFaqList }">
      <div class="card my-1">
          <button class="container-sm container-fluid btn btn-outline-dark" type="button" data-toggle="collapse" data-target="#collapse_${dto.faq_idx}" aria-expanded="false" aria-controls="collapse" style="height: 60px;">
            <div class="d-flex justify-content-between">
              <span>
                ${dto.faq_title}
              </span>
              <span>
                <img src="/img/icon/down.png" alt="펼치기 아이콘" width="25px" height="25px">
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
                	<button class="btn btn-secondary w-5 mt-1 font-primary" style="height: 30px; cursor: pointer;">삭제</button>
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


 <!--팝업창 수정   -->
    <div class="container-sm container-fluid col-12 position-fixed d-none flex-column justify-content-center bg-white border border-dark-50 rounded" style="top:40%; left: 50%; transform:translate(-50%, -50%); max-width:340px;" id="faq_write_popup">
      <!-- 이모티콘  -->
      <div class="d-100 d-flex flex-row justify-content-end">
        <img src="/img/icon/cross.png" alt="" width="30px" height="30px" onclick="popupHideAndShow(target ='faq_write_popup');">
      </div>
      
      <div class="w-100 d-flex flex-column justify-content-center align-items-center mb-4" >
          <!-- pwFindText -->
          <div class="w-auto text-center font-weight-bold text-dark mt-1 mb-4" style="height: 30px;"> FAQ문의</div>          
          <div class="col-12 d-flex flex-column justify-content-center align-items-center mb-4">
            <form action="faqWriteAction" method="post" name="faqWriteForm" onsubmit="return nullChecker();" class="form-control form-control-lg mb-1 col-12 d-flex flex-column align-items-center border-0 font-primary">
              
	          <!-- 히든 input -->
	          <!-- <input type="hidden" name="faq_idx" value="faq_idx"> -->
	          <div class="d-flex">
	            <!-- 제목 -->
	            <div>
	              <input type="text" name="faq_title" placeholder="제목을 입력해주세요" class="text-dark nullcheck font-primary" style="width: 200px; height: 40px; margin-bottom: 5px; padding: 2px 15px;">
	            </div>
	              <!-- 카테고리 -->
	            <div>
	              <select name="faq_cat" class="font-primary" style="width: 100px; height: 38px;">
	                <option selected hidden>문의 종류</option>
	                <option value="상품문의">상품문의</option>
	                <option value="배송문의">배송문의</option>
	                <option value="결제문의">결제문의</option>
	              </select>
	            </div>
	          </div>
	   		 <!-- 내용 -->
	            <textarea name="faq_contents" placeholder="내용을 입력해주세요" cols="30" rows="10" class="text-dark nullcheck mb-2 font-primary" style="width: 300px; height: 100px; resize: none;"></textarea>
	     	 <!-- 확인 버튼 -->
	          <div class="d-flex align-items-center justify-content-center">
	            <input type="submit" value="확인" class="btn btn-dark text-light form-control font-primary" style="width: 185px; margin: 20px 80px 0; cursor: pointer;">
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