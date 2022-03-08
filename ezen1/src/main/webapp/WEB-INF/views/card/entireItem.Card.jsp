<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-12 border rounded d-flex flex-column justify-content-center mt-1 mb-2" style="max-width: 520px;">

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
  	
  	<!-- 평상시 메인에 노출되는경우  -->
  	<c:if test="${ entireItemCardMode == 0  }">
    <div class="d-flex flex-row flex-nowrap px-0" style="overflow: auto; white-space: nowrap;">
    	<c:forEach var="goods" items="${ goodsList }">
      <div class="d-flex flex-column mx-3 my-2 border rounded">
        <a href=""><img src="${ goods.goods_thumb }" alt="${ goods.goods_name }" style="width: 150px; height: 150px;"></a>
        <div class="text-center py-2">
          ${ goods.goods_name }
        </div>
        <div class="text-center py2">
          ${ goods.goods_price }
        </div>
      </div>
      </c:forEach>
    </div>
    </c:if>
    
    <!-- 검색결과로 노출되는 경우 -->
    <c:if test="${ entireItemCardMode eq 1 }">
    <div class="d-flex flex-row px-0 flex-nowrap" style="overflow: auto; white-space: nowrap;">
	    <c:if test="${ searched.isEmpty() == true }">
	    	검색 결과가 존재하지 않습니다.
	    </c:if>
    
      <c:forEach var="goods" items="${ searched }">
      <div class="d-flex flex-column mx-3 my-2 border rounded">
        <a href=""><img src="${ goods.goods_thumb }" alt="${ goods.goods_name }" style="width: 150px; height: 150px;"></a>
        <div class="text-center py-2">
          ${ goods.goods_name }
        </div>
        <div class="text-center py2">
          ${ goods.goods_price }
        </div>
      </div>

      </c:forEach>
     </div> 
     </c:if> 
     
     <!-- admin/stock 에서 노출되는 경우 -->
     <c:if test="${ entireItemCardMode eq 2 }">
     
     <div class="d-flex flex-row flex-wrap justify-content-around px-0" >
    	<c:forEach var="goods" items="${ goodslist }">
      <div class="d-flex flex-column mx-3 my-2 border rounded">
        <a href=""><img src="${ goods.goods_thumb }" alt="${ goods.goods_name }" style="width: 150px; height: 150px;"></a>
        <div class="text-center py-2">
          ${ goods.goods_name }
        </div>
        <div class="text-center py2">
          ${ goods.goods_price }
        </div>
      </div>
      </c:forEach>
    </div>
     
     </c:if>
        

    </div>
    
    
    <!-- 메인화면용 페이지 표시기. 검색결과로 나올때는노출안됨 & 1페이지로 끝나는 경우에도 표시 안됨 -->
	<c:if test="${ entireItemCardMode == 0 } && ${ page.beginPagenation != page.endPagenation }">
   
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
    </c:if>
    
    <!-- admin/stock 용 페이지표시기 -->
    <c:if test="${ entireItemCardMode == 2 } && ${ page.beginPagenation != page.endPagenation }">
   
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
  </div>