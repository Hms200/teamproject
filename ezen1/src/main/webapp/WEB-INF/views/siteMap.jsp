<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>site map</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">

  </style>
</head>
<body>
<c:import url="pcMain.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >

<c:import url="header.jsp"></c:import>

<!-- All container -->
<div class="container-sm container-fluid d-flex flex-column postion-relative pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top:60px;">

    <!-- 분류 컨테이너 -->
    <div class="container-sm container-fluid mt-0 font-primary" style="max-width: 520px;">

        <!-- 메인 타이틀 -->
        <p class="col-12 text-start my-3">메인</p>
        
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-2 pb-4 text-center border-bottom">
            <div class="row my-2">
                <div class="col-3">
                    <a href="main">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='main'">메인</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="notice">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='notice'">공지사항</button>
                    </a>
                </div>
            </div>
        </div>
       
        <!-- 로그인 타이틀 -->
        <p class="col-12 text-start my-3">로그인</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 pb-4 text-center border-bottom">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='login/login'">로그인</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='login/join'">회원가입</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='login/quit'">회원탈퇴</button>
                </div>
            </div>
        </div>

        <!-- 마이페이지 타이틀-->
        <p class="col-12 text-start my-3">마이페이지</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 pb-4 text-center border-bottom">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='myPage/myPage'">마이<br>페이지</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='myPage/memberInfo'">회원정보조회</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='myPage/purchaseList'">구매내역보기</button>
                </div>
            </div>
        </div>

        <!-- 회사소개 타이틀-->
        <p class="col-12 text-start my-3">회사소개</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 pb-4 text-center border-bottom">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='aboutUs'">회사소개</button>
                </div>
            </div>
        </div>

        <!-- 고객센터 타이틀-->
        <p class="col-12 text-start my-3">고객센터</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 pb-4 text-center border-bottom">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='customer/faq'">FAQ</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='customer/myAsk'">내 문의<br>내역</button>
                </div>
                 <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='customer/ask'">문의하기</button>
                </div>
            </div>
        </div>

        <!-- 상품 타이틀-->
        <p class="col-12 text-start my-3">상품</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 pb-4 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='goodsList/goodsList'">상품목록</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;cursor: pointer;" onclick="location.href='goodsList/cart'">장바구니</button>
                </div>
            </div>
        </div>        
    </div>
</div>

    
<c:import url="footer.jsp"></c:import>
<c:import url="nav.jsp"></c:import>

</div>

<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>