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

<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center px-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >


<c:import url="../header.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative" id="mainContainer" style="max-width: 520px; margin-top: 60px;">
   <!-- titleDiv -->
   <div class="font-weight-bold pl-3 d-flex my-2 w-100 pb-2 pt-3 text-black-50">리뷰관리</div>
     
     <!-- 답글달기 팝업창 -->
    <div class="position-fixed d-none " id="reviewReplyWriteForm" style="top: 150px; z-index: 1100; max-width: 340px; height: 100vh;">
      <!-- 닫기 버튼 -->
   
      <div class="d-flex flex-column border rounded bg-white mx-auto">
        <!--X아이콘-->
        <div class="d-flex justify-content-end">
          <img src="/img/icon/cross.png" alt="" onclick="popupHideAndShow('reviewReplyWriteForm')" style="width:30px; height: 30px; cursor: pointer;">
        </div>
        <div class="mr-3 mb-4 ml-3">
          <div class="text-center font-weight-bold text-dark mb-2" >
            답글달기
          </div>
          	<input type="hidden" id="targetIdx" value="">
            <div class="d-block">
              <textarea cols="50" rows="5" class="border rounded w-100 text-dark py-1 px-3 mb-4 font-primary" name="review_reply" style="resize: none;"></textarea>
            </div>
            <button type="button" class="btn btn-secondary text-dark col-5 ml-3 mr-3" onclick="popupHideAndShow('reviewReplyWriteForm')">취소 </button>
            <input type="submit" class="btn btn-dark text-light mr-2 ml-1 col-5" onclick="registReviewReply();" value="답글달기">
        </div>
      </div>
    </div>
</div>
 
  
    <!-- mainDiv -->
    <div class=" container-fluid col-12 d-flex px-0 my-3 align-items-center flex-wrap" style="justify-content: space-evenly;">     
        
        
        <c:forEach var="review" items="${ reviewlist }">
	      
	        <div class="col-5 card inline-block mx-1 my-2 px-0 border rounded">
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
		            <p class="card-text w-100 pr-2" style="font-size:12px;">${ review.review_contents }</p>
		             <span class="btn btn-primary font-secondary align-self-center mr-2" id="${ review.review_idx }" onclick="popupHideAndShowForReview(event);" style="cursor: pointer;">답글달기</span> 
		             <c:if test="${ review.review_isreplied == 1 }"><span class="text-muted align-self-end mr-2"><small>답글 등록됨</small></span></c:if>         
		          </div>
	          
	        	</div>
	        </div>
	 	  </c:forEach>
    </div>

    
    <!-- 페이지 표시기 -->
			
		    <div class="container row mt-3 mb-5 mx-auto">
		      <nav class="mx-auto">
		        <ul class="pagination justify-content-center ">
					<!-- 현재 페이지가 페이지표시기의 페이지 표시 수 보다 작으면 뒤로가기버튼 disable -->
		          <li class="page-item <c:if test="${ pages.currentPage <= 5 }">disabled</c:if>">
		            <a class="page-link" href="review?currentPage=${ pages.beginPagenation - 1}">&lang;</a>
		          </li>
				  <c:forEach var="page" begin="${ pages.beginPagenation }" end="${ pages.endPagenation }" step="1">
		          <li class="page-item <c:if test="${ pages.currentPage == page }">active</c:if>">
		            <a class="page-link" href="review?currentPage=${ page }">${ page }</a>
		          </li>
		          </c:forEach>
		          <!-- 마지막페이지까지 표시되면 앞으로 가기 표시 안됨 -->
		          <li class="page-item <c:if test="${ pages.countOfPages eq pages.endPagenation }">disabled</c:if>">
		            <a class="page-link" href="review?currentPage=${ pages.endPagenation+1}">&rang;</a>
		          </li>
		        </ul>
		      </nav>
		    </div>
    
    



    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>

</div>

<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
<script>

//popup hide & show   for admin.review
function popupHideAndShowForReview(event) {
    const targetWindow = document.getElementById('reviewReplyWriteForm');
    if(targetWindow.classList.contains("d-none")){
        targetWindow.classList.add("d-block");
        targetWindow.classList.remove("d-none");
    }else if(targetWindow.classList.contains("d-block")){
        targetWindow.classList.add("d-none");
        targetWindow.classList.remove("d-block");
    }
    const targetReviewIdx = event.target.id;
    const reviewIdxInput = document.getElementById('targetIdx');
    reviewIdxInput.value = targetReviewIdx;
};



</script>
</body>
</html>