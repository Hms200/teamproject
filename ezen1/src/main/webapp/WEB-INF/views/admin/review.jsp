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

<c:import url="../header.jsp"></c:import>

<div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative" style="max-width: 520px; margin-top: 60px;">
   <!-- titleDiv -->
    <div class="container-sm container-fluid d-flex flex-row mb-0 border-bottom">
        <div class="col-1 my-3 py-1 pl-0">
            <img src="/img/icon/left.png" class="mx-auto d-block" alt="" width="27px" height="27px">
        </div>
        <div class="col-11 my-3 py-1 text-center text-bold">리뷰관리</div>  
    </div>
    <!-- mainDiv -->
    <div class=" container-fluid col-12 d-flex px-0 mt-3 mb-5 align-items-center flex-wrap" style="justify-content: space-evenly;">     
        
        
        <c:forEach var="review" items="${ reviewlist }">
        <div class="col-5 inline-block mx-1 my-2 px-0 border rounded">
        	<c:forEach var="review_img" items="${ reviewimglist }">
        		<c:set var="img" value="" />
        		<c:if test="${ review.review_idx == review_img.review_idx }">
        			<c:set var="img" value="${ review_img.review_img }" />
          			<img src="${ img }" class="card-img-top img-fluid" alt="임시이미지사용">
          		</c:if>
          		<c:remove var="img"/>
          	</c:forEach>
          <div class="card-body py-2 pl-3 pr-3"> 
            <p class="card-text d-flex text-black-50 justify-content-between" style="font-size: 10px;"><span>★ ${ review.review_star }</span><span class="text-right">${ review.review_date }</span></p>
		    <h5 class="card-title font-weight-bold" style="font-size: 14px;">${ goodsnamelist.get(review.goods_idx) }</h5>
            <c:remove var="name"/>
            <p class="card-text" style="font-size:12px; width: 118px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${ review.review_contents }</p>
            <div class="text-center">
                  <span class="btn btn-primary" id="${ review.review_idx }" onclick="popupHideAndShowForReview(event);" style="cursor: pointer; font-size: 12px;">답글달기</span>
              </div>
          </div>
        </div>
     	</c:forEach>
    </div>
    
    <!-- 답글달기 팝업창 -->
    <div class="d-none position-absolute" id="reviewReplyWriteForm" style="bottom: 30px">
      <div class="d-flex flex-column border rounded bg-white mx-auto">
        <!--X아이콘-->
        <div class="d-flex justify-content-end">
          <img src="/img/icon/cross.png" alt=""
            onclick="popupHideAndShow('reviewReplyWriteForm')" style="width:30px; height: 30px; cursor: pointer;">
        </div>
        <div class="mr-3 mb-4 ml-3">
          <div class="text-center font-weight-bold text-dark mb-2" style="font-size: 16px;">
            답글달기
          </div>
          	<input type="hidden" id="targetIdx" value="">
            <div class="d-block">
              <textarea cols="50" rows="5" class="border rounded w-100 text-dark py-1 px-3 mb-4"
                name="review_reply"
                style="font-size: 14px; resize: none;"></textarea>
            </div>
            <button type="button" class="btn btn-secondary text-dark col-3" onclick="popupHideAndShow('reviewReplyWriteForm')">취소 </button>
            <input type="submit" class="btn btn-dark text-light ml-2 col-6" onclick="registReviewReply();" value="답글달기">
        </div>
      </div>
    </div>
    
    
  </div>


    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


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