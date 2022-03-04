<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>goodsList</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center pl-0 pr-0"
    style="max-width: 520px; margin-top: 60px;">
    <!-- 상품 종류 네브 바 -->
    <nav class="w-100">
      <div
        class="goodsList w-100 d-flex flex-row justify-content-around font-weight-bold text-black-50 text-center my-5"
        style="font-size: 15px;">
        <div class="col-3 candle on" onclick="setGoodsList('candle')">캔들</div>
        <div class="col-3 warmer" onclick="setGoodsList('warmer')">캔들워머</div>
        <div class="col-3 diffuser" onclick="setGoodsList('diffuser')">디퓨저</div>
        <div class="col-3 soap" onclick="setGoodsList('soap')">수제비누</div>
      </div>
    </nav>
    <!-- 상품전체 리스트 -->
    <main class="candle">
      <div class="dep d-flex flex-row flex-wrap justify-content-between my-5 mx-3" style="width:310px">
      <c:forEach var="dto" items="${ list }">
          <div class="border pt-3 my-3" id="val${dto.goods_cat}">
            <a href="goodsList/goodsDetail?name="><img src="${dto.goods_thumb}" alt=""
                class="img-fluid" width="150px" height="150px"></a>
            <div class="font-weight-bold px-1" style="font-size: 14px;">${dto.goods_name}</div>
            <div class="font-weight-bold px-1 text-black-50" style="font-size: 10px;">${dto.goods_cat}</div>
            <div class="font-weight-bold px-1" style="font-size: 12px;">￦${dto.goods_price }</div>
       	  </div>
       	  </c:forEach>
      </div>
    </main>
  </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
  <script>
  $(function(){
      $('#valcandle,#valwarmer,#valsoap,#valdiffuser').css('display','none');
      var cat = $('main').attr('class');
      if(cat == 'candle'){
          $('#valcandle').css('display','block');
        }
    })
  </script>
</body>
</html>