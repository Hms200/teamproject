<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-12 border rounded d-flex flex-column justify-content-center" style="max-width: 520px;">

    <div class="d-flex felx-row justify-content-between">
    <div class="mx-2 my-2 font-weight-bold">전체상품보기</div>
    <a href="goodsList" style="text-decoration: none;"><div style="font-size: 13px;">더보기<img src="/img/icon/right.png" alt="" style="width: 15px; height: 15px;"></div></a>
  </div>
    <div class="d-flex flex-row justify-content-center">
      <div class="d-flex flex-column mx-3 my-2 border">
        <a href=""><img src="/img/goods/candle/Candle01_01.jpeg" alt="" style="width: 150px; height: 150px;"></a>
        <div class="text-center py-2">
          이름
        </div>
        <div class="text-center py2">
          가격
        </div>
      </div>

    
    <!-- 검색결과로 노출되는 경우 -->
    <c:if test="${ searchResult == 1 }">
    <div class="d-flex flex-row px-0">
    <c:if test="${ searched.isEmpty() == true }">
    	검색 결과가 존재하지 않습니다.
    </c:if>
    
      <c:forEach var="goods" items="${ searched }">
      <div class="d-flex flex-column mx-3 my-2 border rounded">
        <a href=""><img src="${ goods.goods_thumb }" alt="${ goods.goods_name }" style="width: 150px; height: 150px;"></a>

        <div class="text-center py-2">
          이름
        </div>
        <div class="text-center py2">
          가격
        </div>
      </div>

      </c:forEach>
      
      </c:if> 
        

    </div>

    <!-- 페이지 표시기 jsp변환시 링크수정! -->
    <div class="container row my-3 mx-auto">
      <nav class="mx-auto">
        <ul class="pagination justify-content-center ">

          <li class="page-item ">
            <a class="page-link" href="community01?currentPage=${ beginPagenation - 1}">&lang;</a>
          </li>

          <li class="page-item active">
            <a class="page-link" href="community01?currentPage=${ page }">1</a>
          </li>
          <li class="page-item">
            <a class="page-link" href="community01?currentPage=${ page }">2</a>
          </li>
          <li class="page-item ">
            <a class="page-link" href="community01?currentPage=${ page }">3</a>
          </li>
          <li class="page-item ">
            <a class="page-link" href="community01?currentPage=${ page }">4</a>
          </li>
          <li class="page-item ">
            <a class="page-link" href="community01?currentPage=${ page }">5</a>
          </li>

          <li class="page-item">
            <a class="page-link" href="community01?curruntPage=${endPagenation+1}">&rang;</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
  </div>