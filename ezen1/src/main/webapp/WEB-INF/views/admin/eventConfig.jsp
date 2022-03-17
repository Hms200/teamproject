<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>event Config</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >


<c:import url="../header.jsp"></c:import>

<!-- container -->
   <!--  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative px-0" id="mainContainer" style="max-width: 520px;">-->
    <!-- main container -->
        <div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">


         <!-- title container -->
         <div class="container-fluid d-flex flex-row mb-4 border-bottom border-dark-50" style="height: 60px; margin-top: 60px;">
            <!-- title back btn -->
                <div class="col-1 my-3" onclick="location.href='main'" style="cursor: pointer;">
                    <img src="/img/icon/뒤로가기 (2).png" alt="뒤로가기">
                </div>
            <!-- title -->
                <div class="col-11 my-3 py-1 text-center font-weight-bold" style="font-size: 16px;">
                    이벤트등록
                </div>
          </div>
    
            <!-- 검색 바 -->
            <div class="container-fluid form-group col-11">
                <form class="w-100 d-flex flex-row position-relative" name="adminStockForm" method="get" action="adminStockSearchAction">
                    <select class="custom-select custom-select-lg col-3" name="search_cat">
                        <option value="goods_name">이름</option>
                        <option value="goods_onsale=1">판매중</option>
                        <option value="goods_onsale=0">품절/판매중지</option>
                        <option value="goods_cat">카테고리</option>
                        <option value="goods_onevent">진행중이벤트</option>
                    </select>
                    <input type="hidden" name="page" value="onevent">
                    <input class="form-control form-control-lg col-9" name="searchText" type="text" placeholder="검색어를 입력해주세요.">
                    <img class="position-absolute" src="/img/icon/search.png" alt="검색버튼" width="40px" height="40px" style="right: 10px; top:5px; cursor: pointer;" onclick="submit()">
                </form>
            </div>

           
              <!-- 버튼 그룹. 멀티 서밋 버튼 -->
              <!-- 품절처리, 발주, 삭제 버튼 그룹-->
              <!-- 하단 상품리스트 카드의 체크박스와 연결하여 form submit으로 바꿀것. -->
             <div class="col-12 d-flex flex-row justify-content-around text-center mt-3 mb-3" style="line-height: 30px;">
                 <button class="btn btn-primary text-white col-3 " style="background-color: rgb(52, 152, 219); font-size: 12px; " onclick="multiSubmit(formName = 'productManagementForm', formAction = 'discountProductAction')">
                     할인상품<br> 등록하기
                 </button>
                 <button class="btn btn-primary col-3" style="font-size: 12px;" onclick="multiSubmit(formName = 'productManagementForm', formAction = 'eventProductAction')">
                     이벤트상품<br> 등록하기
                 </button>
                 <button class="btn btn-primary col-3" style="font-size: 12px;" onclick="multiSubmit(formName = 'productManagementForm', formAction = 'recommendProductAction')">
                     추천상품<br> 등록하기
                 </button>
             </div>
             <!-- 상품리스트 카드 영역 -->
            <form name="productManagementForm" method="post">
                <c:import url="../card/entireItem.Card.jsp"></c:import>
			</form>


		</div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>

</div>

<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>