<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid px-0 mt-1 mb-2 col-12 d-flex flex-column justify-content-center border rounded" style="max-width:520px;">
        <!-- 타이틀 -->
        <p class="d-block font-weight-bold font-italic my-2 pl-1" style="font-size: 16px;">Hot&Best</p>
        <!-- 상품박스 -->
    <div class="container-fluid px-0 mt-2 mb-1 col-12 d-flex justify-content-start text-center" style="white-space:nowrap; overflow-x: auto;">
        <!-- 단일상품 -->
        <c:forEach var="list" items="${ best }">
        <div class="col-5 inline-block mx-1 my-2 px-0 border rounded ">
            <a href="">
            	<img src="${ list.goods_thumb }" class="card-img-top" alt="goods_idx:${ list.goods_idx }_img">
	            <div class="card-body py-2 pl-3 pr-3 text-dark text-decoration-none"> 
	            	<h5 class="card-title font-weight-bold" style="font-size: 14px;">${ list.goods_name }</h5>
	            	<p class="card-text" style="font-size:12px;">${ list.goods_price }원</p>              
	            </div>
            </a>
        </div>
        </c:forEach>   

    </div>
 </div>