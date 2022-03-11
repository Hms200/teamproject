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

<c:import url="../header.jsp"></c:import>

<!-- container -->
  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative" style="max-width: 520px;">
    <!-- 타이틀 -->
    <div class="container-sm container-fluid d-flex flex-row mb-0 pl-2 mt-1 border-bottom" style="height: 60px; font-size: 16px;">
      <!-- 뒤로가기 버튼 -->
      <div class="col-1 my-3">
          <img src="/img/icon/left.png" alt="뒤로가기" onclick="location.href='/customer'" width="30px" height="30px" style="cursor: pointer;">
      </div>
      <div class="col-11 my-3 py-1 text-center font-weight-bold">
        문의하기
      </div>
    </div>
    <!-- 폼 시작 -->
    <form action="qnaQuestionAction" method="post" name="qnaQuestionForm" onsubmit="return nullChecker();">
      <div class="container-sm contaier-fluid d-flex flex-wrap justify-content-center my-5" style="font-size: 14px;">
          <span class="col-12 font-weight-bold mb-2 pl-5" style="font-size: 16px;">
            [${user_id}]님
          </span>
          
            <!-- 히든 input -->
            <!-- <input type="hidden" name="onetoone_idx" value="onetoone_idx"> -->
            <input type="hidden" name="user_idx" value="${user_idx}">
            <!-- <input type="hidden" name="onetoone_date" value="onetoone_date"> -->
            <!-- 제목 -->
            <span>
              <input type="text" name="onetoone_title" class="nullcheck" placeholder="제목을 입력해주세요" style="width: 200px; height: 40px;">
            </span>
            <!-- 카테고리 -->
            <select name="onetoone_cat" style="width: 100px;height: 40px;">
              <option selected hidden>문의 종류</option>
              <option value="상품문의">상품문의</option>
              <option value="배송문의">배송문의</option>
              <option value="결제문의">결제문의</option>
            </select>
            <!-- 내용 -->
            <span>
              <textarea name="onetoone_contents" class="nullcheck mt-2" placeholder="내용을 입력해주세요" cols="30" rows="20" style="width: 300px; height: 300px; resize: none;"></textarea>
            </span>
        </div>
            <div class="container-sm container-fluid d-flex flex-row justify-content-center" style="height: 40px;">
                <!-- 취소버튼 -->
                <button type="button" class="btn btn-secondary mx-2" style="width: 100px; cursor: pointer;" onclick="location.href='/customer'">취소</button>
                <!-- 작성버튼 -->
                <button type="submit" class="btn btn-dark mx-2" style="width: 190px; cursor: pointer;">문의하기</button>
            </div>
        </div>
      </form>
  </div>
    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>