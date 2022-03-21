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

<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >


<c:import url="../header.jsp"></c:import>

   <!-- container -->
   <div class="container-sm container-fluid d-flex flex-column  align-items-center position-relative pl-0 pr-0 mb-5" id="mainContainer" style="max-width: 520px;">
   
         <!-- title container -->
         <div class="container-fluid d-flex flex-row mb-2" style="height: 60px; margin-top: 60px;">
           
            <div class="font-weight-bold pl-3 d-flex my-2 w-100 pb-2 pt-3 text-black-50">재고관리</div>
          
          </div>

        <!-- 검색 바 -->
        <div class="container-fluid form-group font-primary col-11" style="flex: none;">
            <form class="w-100 d-flex flex-row position-relative font-primary" name="adminStockForm" method="get" action="adminStockSearchAction">
                <select class="custom-select custom-select-lg col-3 font-primary" name="search_cat" style="height:38px;">
                    <option value="goods_name">이름</option>
                    <option value="goods_onsale=1">판매중</option>
                    <option value="goods_onsale=0">품절/판매중지</option>
                    <option value="goods_cat">카테고리</option>
                    <option value="goods_onevent">진행중이벤트</option>
                </select>
                <input type="hidden" name="page" value="stock">
                <input class="form-control form-control-lg col-9 pl-2 pr-5 font-primary" name="searchText" type="text" placeholder="검색어를 입력해주세요." style="height:38px">
                <img class="position-absolute" src="/img/icon/search.png" alt="검색버튼" width="25px" height="25px" style="right: 10px; top:5px; cursor: pointer;" onclick="submit();">
            </form>
        </div>

        <!-- 품절처리, 발주, 삭제 버튼 그룹-->
        
        <div class="col-12 d-flex flex-row justify-content-around my-3 " style="flex:none;">
            <button class="btn btn-outline-primary col-3 font-secondary" style="background-color: rgb(52, 152, 219);" onclick="makeGoodsSoldOut();">
                품절처리
            </button>
            <button class="btn btn-outline-primary col-3 font-secondary" onclick="orderGoods();">
                발주
            </button>
            <button class="btn btn-outline-primary col-3 font-secondary" onclick="multiSubmit(formName = 'inventoryUpdateForm', formAction = 'inventoryDeleteAction')">
                리스트<br> 삭제
            </button>
        </div> 

        <!-- 상품목록 카드영역 -->
            <form name="inventoryUpdateForm" method="post">
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