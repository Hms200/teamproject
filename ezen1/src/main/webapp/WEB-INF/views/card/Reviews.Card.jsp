<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <div class="container-fluid my-2 col-12 d-flex flex-column justify-content-center border rounded px-0" style="max-width:520px;">
        <!-- title -->
        <div class="d-block font-weight-bold font-italic  pl-1" style="font-size: 16px;">Best Review</div>

        <div class="container-fluid px-0 mt-2 mb-2 col-12 d-flex justify-content-start" style="white-space:nowrap; overflow-x: auto;">           
               
      <c:forEach var="review" items="${ reviewlist }">
        <div class="col-5 card ] inline-block mx-1 my-2 px-0 border rounded" onclick="location.href = '../goodsList/goodsDetail?goods_idx=${ review.goods_idx }'" style="cursor: pointer">
          <div class="row no-gutters my-0">
        	<c:forEach var="review_img" items="${ reviewimgslist }">
        		
        		<c:if test="${ review.review_idx == review_img.review_idx }">
        			<c:set var="img" value="${ review_img.review_img }" />
          			<div class="col-4">
          			<img src="${ img }" class="img-fluid" alt="${ goodsnamelist.get(review.goods_idx) }">
          			</div>
          			<c:remove var="img"/>
          		</c:if>
          		
          	</c:forEach>
	          <div class="card-body col-8 py-2 pl-3 pr-3"> 
	            <p class="card-text d-flex text-black-50" style="font-size: 10px;"><span>★ ${ review.review_star }</span><span class="text-right" style="float: right;">${ review.review_date }</span></p>
			    <h5 class="card-title font-weight-bold" style="font-size: 14px;">${ goodsnamelist.get(review.goods_idx) }</h5>
	            <c:remove var="name"/>
	            <p class="card-text" style="font-size:12px; width: 118px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${ review.review_contents }</p>
	          
	          </div>
          </div>
        </div>
     </c:forEach>
            
        </div>
    </div>
