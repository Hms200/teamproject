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

<c:import url="header.jsp"></c:import>

  <!-- container -->
  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative" style="max-width: 520px;">
    <!-- 타이틀 -->
    <div class="container-sm container-fluid d-flex flex-row mb-0 pl-2 mt-1 border-bottom" style="height: 60px; font-size: 16px;">
      <!-- 뒤로가기 버튼 -->
      <div class="col-1 my-3">
          <img src="/img/icon/left.png" onclick="location.href='/customer'" alt="" width="30px" height="30px" style="cursor: pointer;">
      </div>
      <div class="col-11 my-3 py-1 text-center font-weight-bold">
        고객센터
      </div>
    </div>
    <!-- 네브바 -->
    <div class="container-sm container-fluid d-flex flex-row justify-content-around align-items-center text-decoration-none text-center border-bottom font-weight-bold" style="font-size: 16px; height: 90px;">
      <nav>
        <span>
          <a href="/customer/faq" class="text-black-50 col-4">FAQ</a>
        </span>
        <span>
          <a href="/customer/myAsk" class="text-primary col-4">내 문의내역</a>
        </span>
        <span>
          <a href="/customer/ask" class="text-black-50 col-4">문의하기</a>
        </span>
      </nav>
    </div>
    <!-- 문의종류 -->
    <div class="container-sm container-fluid d-flex justify-content-end mt-2 mb-2">
      <form name="myAskCatForm" method="post" action="myAskCatAction">
      <span>
        <select name="myAskCat" onchange="submit();" style="width: 100px; height: 50px; font-size: 14px;">
          <option selected>문의 종류</option>
          <option value="1">상품 문의</option>
          <option value="2">배송 문의</option>
          <option value="3">결제 문의</option>
        </select>
      </span>
    </form>
    </div>
    <!-- faq아코디언 -->
    <div class="accordion container-sm container-fluid" id="accordion" style="font-size: 14px;">
      <!-- 1번 -->
      <div class="card">
          <button class="container-sm container-fluid btn btn-outline-dark" type="button" data-toggle="collapse" data-target="#collapse1" aria-expanded="false" aria-controls="collapse" style="height: 50px;">
            <div class="d-flex flex-wrap justify-content-between">
              <span>
                상품문의 제목 입니다.
              </span>
              <span style="font-size: 12px;">
                2022-02-21
              </span>
              <span>
                문의 내용 입니다.
              </span>
              <span>
                <img src="/img/icon/down.png" alt="펼치기 아이콘" width="30px" height="30px">
              </span>
            </div>
          </button>
          <!-- 1번 답변 -->
          <div class="collapse" id="collapse1" data-parent="#accordion">
            <div class="card-body">
              <span >
                답변입니다.
              </span>
            </div>
          </div>
      </div>
      <!-- 2번 -->
      <div class="card">
        <button class="container-sm container-fluid btn btn-outline-dark" type="button" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse" style="height: 50px;">
          <div class="d-flex flex-wrap justify-content-between">
            <span>
              상품문의 제목 입니다.
            </span>
            <span style="font-size: 12px;">
              2022-02-21
            </span>
            <span>
              문의 내용 입니다.
            </span>
            <span>
              <img src="/img/icon/down.png" alt="펼치기 아이콘" width="30px" height="30px">
            </span>
        </button>
        <!-- 2번 답변 -->
        <div class="collapse" id="collapse2" data-parent="#accordion">
          <div class="card-body">
            <span >
              답변입니다.
            </span>
          </div>
        </div>
    </div>
    <!-- 3번 -->
    <div class="card">
      <button class="container-sm container-fluid btn btn-outline-dark" type="button" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse" style="height: 50px;">
        <div class="d-flex flex-wrap justify-content-between">
          <span>
            상품문의 제목 입니다.
          </span>
          <span style="font-size: 12px;">
            2022-02-21
          </span>
          <span>
            문의 내용 입니다.
          </span>
          <span>
            <img src="/img/icon/down.png" alt="펼치기 아이콘" width="30px" height="30px">
          </span>
        </div>
      </button>
      <!-- 3번 답변 -->
      <div class="collapse" id="collapse3" data-parent="#accordion">
        <div class="card-body">
          <span >
            답변입니다.
          </span>
        </div>
      </div>
      </div>
    </div>
  </div>
    
<c:import url="footer.jsp"></c:import>
<c:import url="nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>