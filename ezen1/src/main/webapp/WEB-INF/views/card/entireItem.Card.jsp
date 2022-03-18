<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-12 border rounded d-flex flex-column justify-content-center mt-1 mb-2 px-0" style="max-width: 520px;">

	<!-- 타이틀 -->
    <div class="d-flex felx-row justify-content-between">
	    <div class="mx-2 my-2 font-weight-bold">
	    	<c:if test="${ entireItemCardMode == 1 }">검색결과</c:if>
	    	<c:if test="${ entireItemCardMode == 0 }">전체상품보기</c:if>
	    </div>
	    <c:if test="${ entireItemCardMode == 0 }">
	    	<a href="goodsList/goodsList" style="text-decoration: none;"><div style="font-size: 13px;">더보기<img src="/img/icon/right.png" alt="" style="width: 15px; height: 15px;"></div></a>
	    </c:if>
	    <c:if test="${ entireItemCardMode eq 1 }">
	    	<a href="main" class="text-dark text-decoration-none"><div style="font-size: 13px;">검색결과 닫기<img src="/img/icon/right.png" alt="" style="width: 15px; height: 15px;"></div></a>
	    </c:if>
  	</div>
  	
  	<!-- 상품리스트 -->
  	
  	<!-- 평상시 메인에 노출되는경우  -->
  	<c:if test="${ entireItemCardMode == 0  }">
  	
		<div class="container-fluid px-0 mt-2 mb-1 col-12 d-flex justify-content-start text-center" style="white-space:nowrap; overflow-x: auto;">
	        <!-- 단일상품 -->
	        <c:forEach var="list" items="${ goodsList }">
	        <div class="col-5 inline-block mx-1 my-2 px-0 border rounded ">
	            <a href="../goodsList/goodsDetail?goods_idx=${ list.goods_idx }">
	            	<img src="${ list.goods_thumb }" class="card-img-top" alt="goods_idx:${ list.goods_idx }_img">
		            <div class="card-body py-2 pl-3 pr-3 text-dark text-decoration-none"> 
		            	<h5 class="card-title font-weight-bold" style="font-size: 14px;">${ list.goods_name }</h5>
		            	<p class="card-text" style="font-size:12px;">${ list.goods_price }원</p>              
		            </div>
	            </a>
	        </div>
        	</c:forEach>   

    	</div>
   
    </c:if>
    
    <!-- 검색결과로 노출되는 경우 -->
    <c:if test="${ entireItemCardMode eq 1 }">
	   <div class="container-fluid px-0 mt-2 mb-1 col-12 d-flex justify-content-start text-center" style="white-space:nowrap; overflow-x: auto;">
        <!-- 단일상품 -->
        <c:if test="${ searched.isEmpty() == true }">
		    	검색 결과가 존재하지 않습니다.
	    </c:if>
        <c:forEach var="list" items="${ searched }">
        <div class="col-5 inline-block mx-1 my-2 px-0 border rounded ">
            <a href="../goodsList/goodsDetail?goods_idx=${ list.goods_idx }">
            	<img src="${ list.goods_thumb }" class="card-img-top" alt="goods_idx:${ list.goods_idx }_img">
	            <div class="card-body py-2 pl-3 pr-3 text-dark text-decoration-none"> 
	            	<h5 class="card-title font-weight-bold" style="font-size: 14px;">${ list.goods_name }</h5>
	            	<p class="card-text" style="font-size:12px;">${ list.goods_price }원</p>              
	            </div>
            </a>
        </div>
        </c:forEach>   

    </div>
     </c:if> 
     
     <!-- admin/stock & admin/onEvent에서 노출되는 경우 -->
     <c:if test="${ entireItemCardMode eq 2 }">
     
	        <div class="container-fluid px-0 mt-2 mb-1 col-12 d-flex justify-content-start text-center flex-wrap mx-auto">
		        <!-- 단일상품 -->
		        <c:forEach var="list" items="${ goodslist }">
		        <div class="col-5 inline-block mx-auto my-2 px-0 border rounded position-relative" style="cursor: pointer">
		            <input type="checkbox" class="position-absolute" name="${ list.goods_idx }" id=${ list.goods_idx } style="left: 0;top: 0; width: 15px;height: 15px;">
			        <label for="${ list.goods_idx }">
		            
		            	<img src="${ list.goods_thumb }" class="card-img-top" alt="goods_idx:${ list.goods_idx }_img">
	            	</label>
			         <a href="../goodsList/goodsDetail?goods_idx=${ list.goods_idx }">
			            <div class="card-body py-2 pl-3 pr-3 text-dark text-decoration-none"> 
			            	<h5 class="card-title font-weight-bold" style="font-size: 14px;">${ list.goods_name }</h5>
			            	<p class="card-text" style="font-size:12px;">${ list.goods_price }원</p>   
			            	<p class="card-text">
			            		<small>재고 : ${ list.goods_stock },
			            		  <c:if test="${ list.goods_onsale == 1 }">판매중</c:if>
			            		  <c:if test="${ list.goods_onsale == 0 }">판매중지 중</c:if>
			            		  <c:if test="${ list.goods_onevent == 1 }">/할인</c:if>
			            		  <c:if test="${ list.goods_onevent == 2 }">/추천</c:if>
			            		  <c:if test="${ list.goods_onevent == 3 }">/이벤트</c:if>
			            		  
			            		  </small></p>         
			            </div>
		            </a>
		        </div>
		        </c:forEach>   

   			 </div>
	    
     
     </c:if>
        
    
    
    <!-- 메인화면용 페이지 표시기. 검색결과로 나올때는노출안됨 & 1페이지로 끝나는 경우에도 표시 안됨 -->
	<%--  <c:if test="${ entireItemCardMode == 0 }">
   
	    <div class="container row my-3 mx-auto">
	      <nav class="mx-auto">
	        <ul class="pagination justify-content-center ">
				<!-- 현재 페이지가 페이지표시기의 페이지 표시 수 보다 작으면 뒤로가기버튼 disable -->
	          <li class="page-item <c:if test="${ page.currentPage <= 5 }">disabled</c:if>">
	            <a class="page-link" href="main?currentPage=${ page.beginPagenation - 1}">&lang;</a>
	          </li>
			  <c:forEach var="page" begin="${ page.beginPagenation }" end="${ page.endPagenation }" step="1">
		          <li class="page-item <c:if test="${ currentPage == page }">active</c:if>">
		            <a class="page-link" href="main?currentPage=${ page }">${ page }</a>
		          </li>
	          </c:forEach>
	          <!-- 마지막페이지까지 표시되면 앞으로 가기 표시 안됨 -->
	          <li class="page-item <c:if test="${ page.countOfPages eq page.endPagenation }">disabled</c:if>">
	            <a class="page-link" href="main?curruntPage=${ page.endPagenation+1}">&rang;</a>
	          </li>
	        </ul>
	      </nav>
	    </div>
    </c:if> --%>
    
    <!-- admin/stock & admin/eventConfig용 페이지표시기 -->
    <c:if test="${ entireItemCardMode == 2 }">
   
	    <div class="container row my-3 mx-auto">
	      <nav class="mx-auto">
	        <ul class="pagination justify-content-center ">
				<!-- 현재 페이지가 페이지표시기의 페이지 표시 수 보다 작으면 뒤로가기버튼 disable -->
	          <li class="page-item <c:if test="${ page.currentPage <= 5 }">disabled</c:if>">
	            <a class="page-link" href="stock?currentPage=${ beginPagenation - 1}">&lang;</a>
	          </li>
			  <c:forEach var="page" begin="${ page.beginPagenation }" end="${ page.endPagenation }" step="1">
		          <li class="page-item <c:if test="${ currentPage == page }">active</c:if>">
		            <a class="page-link" href="stock?currentPage=${ page }">${ page }</a>
		          </li>
	          </c:forEach>
	          <!-- 마지막페이지까지 표시되면 앞으로 가기 표시 안됨 -->
	          <li class="page-item <c:if test="${ page.countOfPages eq page.endPagenation }">disabled</c:if>">
	            <a class="page-link" href="stock?curruntPage=${ page.endPagenation+1}">&rang;</a>
	          </li>
	        </ul>
	      </nav>
	    </div>
    </c:if>

  </div>