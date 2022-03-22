<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >


<c:import url="../header.jsp"></c:import>

<!-- container -->
  <div
    class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative mb-2" id="mainContainer"
    style="max-width: 520px; margin-top: 70px;">
    
    
    
    <div class="d-flex flex-column bg-white rounded col-12 pt-4 my-5" style="height: auto;">
      <form action="productRegisterAction" class="w-100 mb-3" id="productRegisterForm" name="productRegisterForm" method="post">
      <p class="text-center font-weight-bold text-dark mb-5">
        상품등록
      </p>
      <div class="d-flex felx-row justify-content-around mb-3 form-group">
        <span class="font-weight-bold text-dark font-primary pt-2" >상품이름</span>
        <input type="text" id="goods_name" name="goods_name" class="nullcheck form-control col-7 font-primary" placeholder="상품이름을 입력해주세요" >
        
      </div>
      <div class="d-flex felx-row justify-content-around mb-3 form-group">
        <span class="font-weight-bold text-dark font-primary pt-2" >정품가격</span>
        <input type="text" id="goods_price" name="goods_price" class="nullcheck form-control col-7 font-primary" placeholder="상품가격을 입력해주세요" >
      </div>
      <div class="d-flex felx-row justify-content-around mb-4 form-group">
        <span class="font-weight-bold text-dark font-primary pt-2" >판매수량</span>
        <input type="text" id="goods_stock" name="goods_stock" class="nullcheck form-control col-7 font-primary" placeholder="상품수량을 입력해주세요" >
      </div>
      <div class="d-flex felx-row justify-content-between form-group mx-4 mb-4">
        <span class="font-weight-bold font-primary pt-2" >카테고리 선택</span>
        <select class="text-dark form-control col-6 font-primary" name="goods_cat" id="goods_cat" >
          <option selected>카테고리 선택</option>
          <option value="candle">캔들</option>
          <option value="warmer">캔들워머</option>
          <option value="diffuser">디퓨저</option>
          <option value="soap">비누</option>
        </select>
      </div>
      <div class="d-none">
      <input type="hidden" id="goods_thumb" name="goods_thumb" value="">
      <input type="hidden" id="goods_detail" name="goods_detail" value="">
      <input type="hidden" id="goods_onsale" name="goods_onsale" value="1">
      </div>
      </form>
      
      
      <!-- 파일등록폼과 분리 -->
      <div class="d-flex felx-row justify-content-start ml-3 mb-3">
        <span class="font-weight-bold text-dark font-primary" >이미지등록</span>
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2 font-primary" >
        <span>썸네일</span>
        <input type="file" id="thumbimg" name="uploadthumb" accept="image/*" style="display: none" oninput="uploadThumbnail();"/>
        <label for="thumbimg" class="btn btn-primary border pb-4 font-secondary"
          style="width: 76px; height: 27px;">파일선택</label>
      </div>
      
      
      <form name="goodsimgs" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
      <div class="d-none">
   		<input type="hidden" name="goods_idx" value="">
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2 font-primary" >
        <span>1번파일</span>
        <input type="file" name="img1" id="img1" accept="image/*" style="display:none;" />
        <label for="img1" class="btn btn-primary border pb-4 font-secondary"
          style="width: 76px; height: 27px;">파일선택</label>
      </div>
      
      <div class="d-flex flex-row justify-content-between mx-4 mb-2 font-primary" >
        <span>2번파일</span>
        <input type="file" name="img2" id="img2"accept="image/*" style="display:none;" />
        <label for="img2" class="btn btn-primary border pb-4 font-secondary"
          style="width: 76px; height: 27px;">파일선택</label>
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2 font-primary" >
        <span>3번파일</span>
        <input type="file" name="img3" id="img3" accept="image/*" style="display:none;" />
        <label for="img3" class="btn btn-primary border pb-4 font-secondary"
          style="width: 76px; height: 27px;">파일선택</label>
      </div>
      </form>
      
      
      <div class="d-flex flex-row justify-content-between mx-4 mb-3 font-primary" >
        <span>상세파일</span>
        <input type="file" id="detailimg" name="uploadGoodsDetail"style="display:none;" accept="image/*"  oninput="uploadDetail();" />
        <label for="detailimg" class="btn btn-primary border pb-4 font-secondary"
          style="width: 76px; height: 27px;">파일선택</label>
      </div>
      <div class="d-flex flex-row justify-content-between my-3">
          <button type="button" class="btn btn-dark text-light ml-3 col-5" style="height: 40px; border-radius: 6px;" onclick="location.href='main'">취소</button>
          <button type="button" class="btn btn-primary text-light mr-3 col-5" style="height: 40px; border-radius: 6px;" onclick="registerGoods();">확인</button>
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