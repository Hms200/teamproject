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
    <style>
      .line{
          width: 100%;
          height: 3px;
          background-color: gray;
          border-radius: 50%;
      }
  </style>
</head>
<body>

<c:import url="header.jsp"></c:import>

    <!-- All container -->
<div class="container-sm container-fluid d-flex flex-column postion-relative pl-0 pr-0" style="max-width: 520px;">

        <!-- Title container-->
        <div class="container-sm container-fluid d-flex flex-row mb-0 " style="height: 60px;">
            <!-- Title back btn -->
            <div class="col-1 my-3" onclick="location.href='main'" style="cursor: pointer;">
                <img src="/img/icon/뒤로가기 (2).png" alt="뒤로가기">
            </div>
            <!-- Title -->
            <div class="col-11 my-3 py-1 text-center font-weight-bold" style="margin-left: -1rem;">
                사이트맵
            </div>
        </div>
       
    <!-- 분류 컨테이너 -->
    <div class="container-sm container-fluid mt-0" style="max-width: 520px; font-size: 14px;">

        <!-- 메인 타이틀 -->
        <p class="text-start ml-3 my-3 font-weight-bold">메인</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-2 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <a href="main">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">메인</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="notice">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">공지사항</button>
                    </a>
                </div>
            </div>
        </div><div class="line"></div>
       
        <!-- 로그인 타이틀 -->
        <p class="text-start ml-3 my-3 font-weight-bold">로그인</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">로그인</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;">회원가입</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;">회원탈퇴</button>
                </div>
            </div>
        </div><div class="line"></div>

        <!-- 마이페이지 타이틀-->
        <p class="text-start ml-3 my-3 font-weight-bold">마이페이지</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">마이<br>페이지</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;">회원정보조회</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;">구매내역보기</button>
                </div>
            </div>
        </div><div class="line"></div>

        <!-- 회사소개 타이틀-->
        <p class="text-start ml-3 my-3 font-weight-bold">회사소개</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">회사소개</button>
                </div>
            </div>
        </div><div class="line"></div>

        <!-- 고객센터 타이틀-->
        <p class="text-start ml-3 my-3 font-weight-bold">고객센터</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">FAQ</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;">1:1문의</button>
                </div>
            </div>
        </div><div class="line"></div>

        <!-- 상품 타이틀-->
        <p class="text-start ml-3 my-3 font-weight-bold">상품</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-3 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">상품목록</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;">장바구니</button>
                </div>
                <div class="col-3">
                    <button class="btn btn-primary " style="width: 70px; height: 70px; padding:0;">내<br>문의내역</button>
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