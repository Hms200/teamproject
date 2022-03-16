<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav style="width: 100%">
 <!-- container -->
     <div class="container-sm container-fluid d-flex flex-row justify-content-around align-items-center border border-dark-50 bg-white" style="max-width: 520px; height: 60px;position:fixed; bottom: 0;">
     
    <!-- top scroll 버튼 -->
        <div class="mx-auto bg-white border border-dark-50 position-absolute rounded" onclick="scrollToTop()" style="right: 12px;bottom: 82px; cursor: pointer;z-index: 1500;">
            <img src="/img/icon/chevron.png" alt="위로가기" width="35px" height="35px">
        </div>
     <!-- icon container 4개 -->
         <div class="d-flex flex-column justify-content-center align-itmes-center text-center mb-1" onclick="location.href='../main'" style="cursor: pointer;">
             <img class="mx-auto" src="/img/icon/home.png" alt="홈으로" width="25px" height="25px" >
             <span class="text-dark"style="font-size: 11px;">홈</span>
         </div>
         
         <div class="d-flex flex-column justify-content-center align-itmes-center text-center mb-1" id="slide_toggle"  style="cursor: pointer;">
             <img class="mx-auto" src="/img/icon/information.png" alt="카테고리" width="25px" height="25px" >
             <span class="text-dark"style="font-size: 11px;">카테고리</span>
         </div>  

         <div class="d-flex flex-column justify-content-center align-itmes-center text-center mb-1" onclick="location.href='../siteMap'" style="cursor: pointer;">
             <img class="mx-auto" src="/img/icon/application.png" alt="사이트맵" width="25px" height="25px" >
             <span class="text-dark"style="font-size: 11px;">사이트맵</span>
         </div>  

         <div class="d-flex flex-column justify-content-center align-itmes-center text-center mb-1"
          <c:if test="${ user_id != 'admin' }">onclick="location.href='../myPage/myPage'"</c:if>
          <c:if test="${ user_id eq 'admin' }">onclick="location.href='../admin/main'"</c:if>
           style="cursor: pointer;">
             <img class="mx-auto" src="/img/icon/my.png" alt="마이페이지" width="25px" height="25px" >
             <span class="text-dark"style="font-size: 11px;">마이페이지</span>
         </div>  
     <!-- 카테고리버튼 슬라이드업 -->
         <div class="border border-dark-50 position-absolute bg-white" id="cat_slideup" style="width: 80px; left: 28%; bottom: 60px;display: none;cursor: pointer;">

             <div class="text-center border-bottom border-dark-50" style="height: 40px;line-height: 40px;" onclick="location.href='../goodsList/goodsList?catval=candle'">캔들</div>
             <div class="text-center border-bottom border-dark-50" style="height: 40px;line-height: 40px;" onclick="location.href='../goodsList/goodsList?catval=warmer'">캔들워머</div>
             <div class="text-center border-bottom border-dark-50" style="height: 40px;line-height: 40px;" onclick="location.href='../goodsList/goodsList?catval=diffuser'">디퓨저</div>
             <div class="text-center border-bottom border-dark-50"  style="height: 40px;line-height: 40px;" onclick="location.href='../goodsList/goodsList?catval=soap'">비누</div>

         </div>
     
     </div>
 </nav>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 <script>
    //  카테고리 슬라이드 업
$(function(){
    var hideContainer = $("#cat_slideup");
    $("#slide_toggle").click(function(){
            hideContainer.slideToggle(600);
        });
});
   
</script>