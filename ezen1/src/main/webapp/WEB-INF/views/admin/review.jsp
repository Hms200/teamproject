<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin/review</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative" style="max-width: 520px; margin-top: 60px;">
   <!-- titleDiv -->
    <div class="container-sm container-fluid d-flex flex-row mb-0 border-bottom">
        <div class="col-1 my-3 py-1 pl-0">
            <img src="/img/icon/left.png" class="mx-auto d-block" alt="" width="27px" height="27px">
        </div>
        <div class="col-11 my-3 py-1 text-center text-bold">리뷰관리</div>  
    </div>
    <!-- mainDiv -->
    <div class=" container-fluid col-12 d-flex px-0 mt-3 mb-5 align-items-center flex-wrap" style="justify-content: space-evenly;">     
        <c:forEach var="review" items="${ reviewlist }">
        <div class="col-5 inline-block mx-1 my-2 px-0 border rounded">
        	<c:forEach var="review_img" items="${ reviewImgList }">
        		<c:if test="${ review.review_idx == review_img.review_idx }">
        			<c:set var="img" value="${ review_img.review_img }" />
          			<img src="${ img }" class="card-img-top img-fluid" alt="임시이미지사용">
          		</c:if>
          		<c:if test="${ img == null }">
          			<div class="col-4 d-flex flex-column border rounded text-center my-2 justify-content-center">
			      		<p class="cart-text">등록된<br>이미지가<br>없습니다.</p>
			      	</div>
          		</c:if>
          		<c:remove var="img"/>
          	</c:forEach>
          <div class="card-body py-2 pl-3 pr-3"> 
            <p class="card-text d-flex text-black-50 justify-content-between" style="font-size: 10px;"><span>★ ${ review.review_star }</span><span class="text-right">${ review.review_date }</span></p>
            	<c:forEach var="goods" items="${ goodslist }">
                		<c:if test="${ review.goods_idx == goods.goods_idx }">
                		<c:set var="name" value="${ goods.goods_name }" />
                		</c:if>
            	</c:forEach>
            <h5 class="card-title font-weight-bold" style="font-size: 14px;">${ name }</h5>
            <c:remove var="name"/>
            <p class="card-text" style="font-size:12px; width: 118px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${ review.review_contents }</p>
            <div class="text-center">
                  <span class="btn btn-primary" onclick="popupHideAndShow(target='reviewReplyWriteForm​');" style="cursor: pointer; font-size: 12px;">답글달기</span>
              </div>
          </div>
        </div>
     	</c:forEach>
	<div class="col-5 inline-block mx-1 my-2 px-0 border rounded">
        <img src="/img/goods/candle/Candle01_01.jpeg" class="card-img-top" alt="임시이미지사용">
        <div class="card-body py-2 pl-3 pr-3"> 
           <p class="card-text d-flex text-black-50 justify-content-between" style="font-size: 10px;"><span>평점(4.9)</span><span class="text-right">2022-00-00</span></p>
           <h5 class="card-title font-weight-bold" style="font-size: 14px;">네이처 소이캔들</h5>
           <p class="card-text" style="font-size:12px; width: 118px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">리뷰내용리뷰내용리뷰내용리뷰내용</p>
           <div class="text-center">
                <span class="btn btn-primary" onclick="popupHideAndShow(target='reviewReplyWriteForm​');" style="cursor: pointer; font-size: 12px;">답글달기</span>
            </div>
        </div>
      </div>
      <div class="col-5 inline-block mx-1 my-2 px-0 border rounded">
        <img src="/img/goods/candle/Candle01_01.jpeg" class="card-img-top" alt="임시이미지사용">
        <div class="card-body py-2 pl-3 pr-3"> 
           <p class="card-text d-flex text-black-50 justify-content-between" style="font-size: 10px;"><span>평점(4.9)</span><span class="text-right">2022-00-00</span></p>
           <h5 class="card-title font-weight-bold" style="font-size: 14px;">네이처 소이캔들</h5>
           <p class="card-text" style="font-size:12px; width: 118px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">리뷰내용리뷰내용리뷰내용리뷰내용</p>
           <div class="text-center">
                <span class="btn btn-primary" onclick="popupHideAndShow(target='reviewReplyWriteForm​');" style="cursor: pointer; font-size: 12px;">답글달기</span>
            </div>
        </div>
      </div>
      <div class="col-5 inline-block mx-1 my-2 px-0 border rounded">
        <img src="/img/goods/candle/Candle01_01.jpeg" class="card-img-top" alt="임시이미지사용">
        <div class="card-body py-2 pl-3 pr-3"> 
           <p class="card-text d-flex text-black-50 justify-content-between" style="font-size: 10px;"><span>평점(4.9)</span><span class="text-right">2022-00-00</span></p>
           <h5 class="card-title font-weight-bold" style="font-size: 14px;">네이처 소이캔들</h5>
           <p class="card-text" style="font-size:12px; width: 118px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">리뷰내용리뷰내용리뷰내용리뷰내용</p>
           <div class="text-center">
                <span class="btn btn-primary" onclick="popupHideAndShow(target='reviewReplyWriteForm​');" style="cursor: pointer; font-size: 12px;">답글달기</span>
            </div>
        </div>
      </div>
      <div class="col-5 inline-block mx-1 my-2 px-0 border rounded">
        <img src="/img/goods/candle/Candle01_01.jpeg" class="card-img-top" alt="임시이미지사용">
        <div class="card-body py-2 pl-3 pr-3"> 
           <p class="card-text d-flex text-black-50 justify-content-between" style="font-size: 10px;"><span>평점(4.9)</span><span class="text-right">2022-00-00</span></p>
           <h5 class="card-title font-weight-bold" style="font-size: 14px;">네이처 소이캔들</h5>
           <p class="card-text" style="font-size:12px; width: 118px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">리뷰내용리뷰내용리뷰내용리뷰내용</p>
           <div class="text-center">
                <span class="btn btn-primary" onclick="popupHideAndShow(target='reviewReplyWriteForm​');" style="cursor: pointer; font-size: 12px;">답글달기</span>
            </div>
        </div>
      </div>
      <div class="col-5 inline-block mx-1 my-2 px-0 border rounded">
        <img src="/img/goods/candle/Candle01_01.jpeg" class="card-img-top" alt="임시이미지사용">
        <div class="card-body py-2 pl-3 pr-3"> 
           <p class="card-text d-flex text-black-50 justify-content-between" style="font-size: 10px;"><span>평점(4.9)</span><span class="text-right">2022-00-00</span></p>
           <h5 class="card-title font-weight-bold" style="font-size: 14px;">네이처 소이캔들</h5>
           <p class="card-text" style="font-size:12px; width: 118px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">리뷰내용리뷰내용리뷰내용리뷰내용</p>
           <div class="text-center">
                <span class="btn btn-primary" onclick="popupHideAndShow(target='reviewReplyWriteForm​');" style="cursor: pointer; font-size: 12px;">답글달기</span>
            </div>
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