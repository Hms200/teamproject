<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-12 border rounded d-flex flex-column justify-content-center" style="max-width: 520px;">

    <div class="d-flex felx-row justify-content-between">
    <div class="mx-2 my-2 font-weight-bold">
    	<c:if test="${ searchResult == 1 }">검색결과</c:if>
    	<c:if test="${ searchResult != 1 }">전체상품보기</c:if>
    </div>
    <a href="goodsList" style="text-decoration: none;"><div style="font-size: 13px;">더보기<img src="/img/icon/right.png" alt="" style="width: 15px; height: 15px;"></div></a>
  </div>
  	
  	<!-- 평상시 메인에 노출되는경우  -->
  	<c:if test="${ searchResult != 1 }">
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
    
    </c:if>
    
    <!-- 검색결과로 노출되는 경우 -->
    <c:if test="${ searchResult == 1 }">
    <div class="d-flex flex-row px-0">
    
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
      </c:if> 
        
    </div>
    
    
    
	<c:if test="${ searchResult != 1 }">
    <!-- 페이지 표시기 jsp변환시 링크수정! -->
    <div class="container row my-3 mx-auto">
      <nav class="mx-auto">
        <ul class="pagination justify-content-center ">

          <li class="page-item ">
            <a class="page-link" href="main?currentPage=${ beginPagenation - 1}">&lang;</a>
          </li>

          <li class="page-item active">
            <a class="page-link" href="main?currentPage=${ page }">1</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="main?currentPage=${ page }">2</a>
          </li>
          <li class="page-item ">
            <a class="page-link" href="main?currentPage=${ page }">3</a>
          </li>
          <li class="page-item ">
            <a class="page-link" href="main?currentPage=${ page }">4</a>
          </li>
          <li class="page-item ">
            <a class="page-link" href="main?currentPage=${ page }">5</a>
          </li>

          <li class="page-item">
            <a class="page-link" href="main?curruntPage=${endPagenation+1}">&rang;</a>
          </li>
        </ul>
      </nav>
    </div>
    </c:if>
  </div>
  </div>