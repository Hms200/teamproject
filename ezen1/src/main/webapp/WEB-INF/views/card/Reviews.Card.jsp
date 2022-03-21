<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <div class="container-fluid my-2 col-12 d-flex flex-column justify-content-center border rounded px-0" style="max-width:520px;">
        <!-- title -->
        <div class="d-block font-weight-bold font-italic  pl-1" style="font-size: 16px;">Best Review</div>
			
		<div class="container-fluid px-0 mt-2 mb-2 col-12 d-flex justify-content-start" style="white-space:nowrap; overflow-x: auto;">
       		
	      <c:forEach var="review" items="${ reviewlist }">
	      
	        <div class="col-5 card inline-block mx-1 my-2 px-0 border rounded" onclick="location.href = '../goodsList/goodsDetail?goods_idx=${ review.goods_idx }'" style="cursor: pointer">
	          <div class="column no-gutters my-0">
	          	<c:set var="isExistImg" value="0" />
	        	<c:forEach var="review_img" items="${ reviewimgslist }">
	        		<c:if test="${ review.review_idx == review_img.review_idx }">
	        			<c:set var="img" value="${ review_img.review_img }" />
	        			<c:set var="isExistImg" value="1" />
	          			<div class="col-12" style="position: relative; padding-bottom: 75%; height: 0;">
	          			<img src="${ img }" class="" alt="${ goodsnamelist.get(review.goods_idx) }" style="position: absolute; left: 0; top: 0; width: 100%; height: 100%;">
	          			</div>
	          			<c:remove var="img"/>
	          		</c:if>	
	          	</c:forEach>
	          		<c:if test="${ isExistImg == 0 }">
	          			<div class="col-12" style="position: relative; padding-bottom: 75%; height: 0;">
	          			<img src="/img/img_not_found.png" class="" alt="등록된 이미지가 없습니다." style="position: absolute; left: 0; top: 0; width: 100%; height: 100%;">
	          			</div>
	          		</c:if>
	          		<c:remove var="isExistImg"/>
	          	
		          <div class="card-body col-12 py-2 ml-1 d-flex flex-column align-items-start justify-content-center"> 
		            <p class="card-text d-block text-black-50 mb-1 w-100 pr-2" style="font-size: 10px;"><span>★ ${ review.review_star }</span><span class="text-right float-right">${ review.review_date }</span></p>
				    <h5 class="card-title font-weight-bold" style="font-size: 14px;">${ goodsnamelist.get(review.goods_idx) }</h5>
		            <c:remove var="name"/>
		            <p class="card-text w-100 pr-2" style="font-size:12px;overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${ review.review_contents }</p>          
		          </div>
	          
	        	</div>
	        </div>
	 	  </c:forEach>
	 	  
	 	</div>
</div>
 		 	
			
