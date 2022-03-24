<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


   <header style="width: 100%;">
        <!-- header container -->
        <div class="container-sm container-fluid w-100 px-3 py-2 d-flex flex-row justify-content-between align-items-center border-bottom border-dark-50 bg-white" style="max-width: 520px; height: 60px;position:fixed;top: 0;z-index:1500;">
            <!-- header logo img -->
            <div >
                <a href="../main">
                <img width="100px" src="/img/logo.png" alt="사이트로고">
                </a>
            </div>
            <!-- header search bar (hide & show) -->
            <div class="form-group my-auto d-none" id="searchbar">
                <form method="get" action="mainsearchAction" >
                    <div class="form-control border-0 px-0">
                        <input class="border rounded border-dark-50" type="text" name="searchtext" placeholder="검색어를 입력해주세요" style="width: 150px !important;">
                    </div>
                </form>
            </div>
            <!-- header right-side icons -->
            <div class="bg-transparent">
                <!-- 검색아이콘 -->
                <img id="search-icon" src="/img/icon/search.png" alt="검색아이콘" width="25px" height="25px" style="cursor: pointer;" onclick="popupHideAndShow(target = 'searchbar');">  
                <!-- 장바구니아이콘-->
                <a href="../goodsList/cart" class="pl-1">  
                    <img src="/img/icon/bag.png" alt="장바구니아이콘" width="25px" height="25px">
                </a>
            </div>
            <!-- 장바구니 뱃지 -->
            <div class="position-absolute rounded-circle bg-danger text-light d-block" id="bedge" width="20px" height="10px" style="font-size: 10px;right:5px; top:5px;">
                <span class="p-1" id="bedgeNumber">${ cart }</span>
            </div> 
        </div>
    </header>
 
