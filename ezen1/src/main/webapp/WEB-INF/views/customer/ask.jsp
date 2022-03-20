<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의하기</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<c:import url="../pcMain.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column align-items-center px-0" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">
<c:import url="../header.jsp"></c:import>

<!-- container -->
  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative mb-5" id="mainContainer" style="max-width: 520px;">

  <!-- 네브바 -->
    <div class="container-sm container-fluid d-flex flex-row justify-content-around align-items-center text-decoration-none text-center border-bottom font-weight-bold" style="height: 90px;">
      <nav>
        <span>
          <a href="/customer/faq" class="text-black-50 col-4">FAQ</a>
        </span>
        <span>
          <a href="myAsk" class="text-black-50 col-4">내 문의내역</a>
        </span>
        <span>
          <a href="" class="text-primary col-4">문의하기</a>
        </span>
      </nav>
    </div>
    
  <div class="mt-3" style="max-width: 340px;">         
    <!-- 폼 시작 -->
    <form action="qnaQuestionAction" method="post" name="qnaQuestionForm" onsubmit="return nullChecker();" style="margin-bottom:30px;">
      <div class="container-sm contaier-fluid d-flex flex-wrap justify-content-center my-3 font-primary ">
          <span class="col-12 font-weight-bold mb-2" style="padding-left:5px">
            [${user_id}] 님
          </span>
          
            <!-- 히든 input -->
            <!-- <input type="hidden" name="onetoone_idx" value="onetoone_idx"> -->
            <input type="hidden" name="user_idx" value="${user_idx}">
            <!-- <input type="hidden" name="onetoone_date" value="onetoone_date"> -->
            <!-- 제목 -->
              <input type="text" name="onetoone_title" class="nullcheck pl-2 pr-0 col-7 mr-4" placeholder="제목을 입력해주세요" style="height: 38px;">     
            <!-- 카테고리 -->
            <select name="onetoone_cat" class="col-4 rounded" style="height: 38px; padding: 5px;">
              <option selected hidden>문의 종류</option>
              <option value="상품문의">상품문의</option>
              <option value="배송문의">배송문의</option>
              <option value="결제문의">결제문의</option>
            </select>
            <!-- 내용 -->
              <textarea name="onetoone_contents" class="nullcheck mt-2 px-2 py-2 col-12 rounded" placeholder="내용을 입력해주세요" cols="30" rows="20" style="height: 300px; resize: none;"></textarea>
        </div>
            <div class="container-sm container-fluid d-flex flex-row justify-content-center" style="height: 40px;">
                <!-- 취소버튼 -->
                <button type="button" class="btn btn-secondary mx-2" style="width: 100px; cursor: pointer;" onclick="location.href='/customer'">취소</button>
                <!-- 작성버튼 -->
                <button type="submit" class="btn btn-dark mx-2" style="width: 100px; cursor: pointer;">작성하기</button>
            </div>
        </form>
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