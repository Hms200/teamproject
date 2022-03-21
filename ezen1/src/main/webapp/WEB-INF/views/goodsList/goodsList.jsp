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

<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"   style="max-width: 520px;max-height: 100vh; overflow: auto;" >

<c:import url="../header.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center pl-0 pr-0" id="mainContainer"
    style="max-width: 520px; margin-top: 60px;">
    <!-- 상품 종류 네브 바 -->
    <nav class="w-100">
      <div
        class="goodsList w-100 d-flex flex-row justify-content-around font-weight-bold text-black-50 text-center mt-5 mb-4"
        style="font-size: 15px;">
        <div class="col-3 candle " onclick="setGoodsList('candle')">캔들</div>
        <div class="col-3 warmer" onclick="setGoodsList('warmer')">캔들워머</div>
        <div class="col-3 diffuser" onclick="setGoodsList('diffuser')">디퓨저</div>
        <div class="col-3 soap" onclick="setGoodsList('soap')">수제비누</div>
      </div>
    </nav>
    <!-- 상품전체 리스트 -->
    <%String catname = request.getParameter("catval"); %>
    <main class="<%=catname%>">
      <div class="dep container-fluid px-auto mt-3 mb-5 col-12 d-flex flex-wrap justify-content-start text-center">
      <c:forEach var="dto" items="${ list }">
          <div class="col-5 inline-block mx-auto my-2 px-0 border rounded val${ dto.goods_cat } position-relative">
            <a href="goodsDetail?goods_idx=${dto.goods_idx}">
            <img src="${dto.goods_thumb}" alt="" class="card-img-top img-fluid"></a>
            <div class="card-body py-2 px-2 text-dark text-decoration-none" >
	            <h5 class="card-title font-weight-bold mt-1 font-primary">${dto.goods_name}</h5>
	            <p class="card-text mb-1 font-secondary">${dto.goods_cat}</p>
	            <p class="card-text mb-2 font-secondary">￦${dto.goods_price }</p>
       	  	</div>
       	  
     		</div>
      </c:forEach>
      </div>
    </main>
  </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>

</div>
<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
  <script>
  $(function(){
      var cat = $('main').attr('class');
      if(cat == 'candle'){
          $('.valcandle').css('display','block');
          $('.valwarmer,.valsoap,.valdiffuser').css('display','none');
        }else if(cat=='warmer'){
        	$('.valwarmer').css('display','block');
        	$('.valcandle,.valsoap,.valdiffuser').css('display','none');
        }else if(cat=='soap'){
        	$('.valsoap').css('display','block');
        	$('.valcandle,.valwarmer,.valdiffuser').css('display','none');
        }else if(cat=='diffuser'){
        	$('.valdiffuser').css('display','block');
        	$('.valcandle,.valwarmer,.valsoap').css('display','none');
        }
  })
  </script>
</body>
</html>