<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이트 관리</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
    <style>

  </style>
</head>
<body>
<c:import url="../pcMain.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >

<c:import url="../header.jsp"></c:import>

<!-- All container -->
<div class="container-sm container-fluid d-flex flex-column postion-relative pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top:60px;">

    <!-- 분류 컨테이너 -->
    <div class="container-sm container-fluid mt-0 font-primary" style="max-width: 520px;">        

        <!-- 회원관리 타이틀 -->
        <p class="col-12 text-start my-3">회원관리</p>
        
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-2 pb-4 text-center border-bottom">
            <div class="row my-2">
                <div class="col-3">
                    <a href="memberList">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">회원목록</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="qnaList">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">QnA</button>
                    </a>
                </div>
            </div>
        </div>
       
        <!-- 상품관리 타이틀 -->
        <p class="col-12 text-start my-3">상품관리</p>
        <!-- 분류 버튼 -->
         <div class="container-sm container-fluid my-3 pb-4 text-center border-bottom">
            <div class="row my-2">
                <div class="col-3">
                    <a href="goods">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">상품등록</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="stock">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">재고관리</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="review">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">리뷰관리</button>
                    </a>
                </div>
                <div class="col-3"></div>

                <!-- 줄바꿈 -->
                <div class="col-3">
                    <a href="transaction">
                    <button class="btn btn-primary mt-4" style="width: 70px; height: 70px; padding:0;">거래내역</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="eventConfig">
                    <button class="btn btn-primary mt-4 font-secondary" style="width: 70px; height: 70px; padding:0;">할인/추천<br>이벤트관리</button>
                    </a>
                </div>
            </div>
        </div>

        <!-- 쇼핑몰관리 타이틀-->
        <p class="col-12 text-start my-3">쇼핑몰관리</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 pb-4 text-center border-bottom">
            <div class="row my-2">
                <div class="col-3">
                    <a href="../notice">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">공지사항 관리</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="../customer/faq">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">FAQ관리</button>
                    </a>
                </div>
            </div>
        </div>

        <!-- 매출조회 타이틀-->
        <p class="col-12 text-start my-3">매출조회</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 pb-4 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <a href="https://admin.bootpay.co.kr/login" target="_blank">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">매출조회</button>
                    </a>
               </div>
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