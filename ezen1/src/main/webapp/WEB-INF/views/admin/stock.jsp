<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin/stock</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

   <!-- container -->
   <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative pl-0 pr-0" style="max-width: 520px;">
   
        <!-- title container -->
        <div class="container-fluid d-flex flex-row mb-4 border-bottom border-dark-50" style="height: 60px;">
        <!-- title back btn -->
            <div class="col-1 my-3" onclick="location.href='admin/main'" style="cursor: pointer;">
                <img src="/img/icon/뒤로가기 (2).png" alt="뒤로가기">
            </div>
        <!-- title -->
            <div class="col-11 my-3 py-1 text-center font-weight-bold" style="font-size: 16px;">
                재고관리
            </div>
        </div>

        <!-- 검색 바 -->
        <div class="container-fluid form-group col-11">
            <form class="w-100 d-flex flex-row position-relative" name="adminStockForm" method="get" action="adminStockSearchAction">
                <select class="custom-select custom-select-lg col-3" name="stock_cat">
                    <option value="goods_name">이름</option>
                    <option value="goods_onsale=1">판매중</option>
                    <option value="goods_onsale=0">품절/판매중지</option>
                    <option value="goods_cat">카테고리</option>
                </select>
                <input class="form-control form-control-lg col-9" name="searchText" type="text" placeholder="검색어를 입력해주세요.">
                <img class="position-absolute" src="/img/icon/search.png" alt="검색버튼" width="40px" height="40px" style="right: 10px; top:5px; cursor: pointer;" onclick="submit();">
            </form>
        </div>

        <!-- 품절처리, 발주, 삭제 버튼 그룹-->
        
        <div class="col-12 d-flex flex-row justify-content-around text-center align-middle">
            <button class="btn text-white col-3 " style="background-color: rgb(52, 152, 219); font-size: 12px; height: 30px;"
            onclick="makeGoodsSoldOut();">
                품절 처리하기
            </button>
            <button class="btn btn-primary col-3" style="font-size: 12px;height: 30px;">
                발주
            </button>
            <button class="btn btn-dark col-3" style="font-size: 12px;height: 30px;"
            onclick="multiSubmit(formName = 'inventoryUpdateForm', formAction = 'inventoryDeleteAction')">
                리스트 삭제
            </button>
        </div> 

        <!-- 상품목록 카드영역 -->
            <form name="inventoryUpdateForm" method="post">
            	<c:import url="../card/entireItem.Card.jsp"></c:import>
            </form>
    </div>


    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>