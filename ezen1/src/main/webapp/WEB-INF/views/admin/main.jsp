<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title</title>
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

<c:import url="../header.jsp"></c:import>

<!-- All container -->
<div class="container-sm container-fluid d-flex flex-column postion-relative pl-0 pr-0" style="max-width: 520px;">

        

        <!-- 회원관리 타이틀 -->
        <p class="text-start ml-3 my-3 font-weight-bold">회원관리</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-2 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <a href="admin/memberList">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">회원목록</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="admin/qnaList">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">QnA</button>
                    </a>
                </div>
               
            </div>
        </div><div class="line"></div>
       
        <!-- 상품관리 타이틀 -->
        <p class="text-start ml-3 my-3 font-weight-bold">상품관리</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-2 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <a href="admin/goods">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">상품등록</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="admin/stock">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">재고관리</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="admin/review">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">리뷰관리</button>
                    </a>
                </div>
                <div class="col-3"></div>

                <!-- 줄바꿈 -->
                <div class="col-3">
                    <a href="admin/transaction">
                    <button class="btn btn-primary mt-4" style="width: 70px; height: 70px; padding:0;">거래내역</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="admin/eventConfig">
                    <button class="btn btn-primary mt-4" style="width: 70px; height: 70px; padding:0; font-size: 12px;">할인/추천<br>이벤트관리</button>
                    </a>
                </div>
            </div>
        </div><div class="line"></div>

        <!-- 쇼핑몰관리 타이틀-->
        <p class="text-start ml-3 my-3 font-weight-bold">쇼핑몰관리</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-2 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <a href="admin/notice">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">공지사항 관리</button>
                    </a>
                </div>
                <div class="col-3">
                    <a href="admin/faq">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">FAQ관리</button>
                    </a>
                </div>
            </div>
        </div><div class="line"></div>

        <!-- 매출조회 타이틀-->
        <p class="text-start ml-3 my-3 font-weight-bold">매출조회</p>
        <!-- 분류 버튼 -->
        <div class="container-sm container-fluid my-2 text-center">
            <div class="row my-2">
                <div class="col-3">
                    <a href="admin/sales">
                    <button class="btn btn-primary" style="width: 70px; height: 70px; padding:0;">매출조회</button>
                    </a>
                </div>
                
            </div>
        </div>  
</div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>