<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>reviewpopup</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >

	<c:import url="../header.jsp"></c:import>


        <div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">

		<!-- 아이콘 -->
		<div class="d-flex w-100 flex-row justify-content-end pt-2  pr-2">
			<img src="/img/icon/cross.png" alt="취소" style="width: 30px; height: 30px; cursor: pointer;" onclick="history.back(-1);">
		</div>
		<!-- main -->
		<div
			class="w-100 d-flex flex-column justify-content-center align-items-center px-3 my-4">
			<div class="w-auto text-center font-weight-bold text-dark mt-1 mb-4">
				고객님의 리뷰가 큰 힘이 됩니다!</div>
		</div>
		
		  <div class=" w-100  d-flex flex-column justify-content-around justify-content-center align-items-center p-2">
		<form name="reviewImg" method="post" enctype="multipart/form-data"  accept-charset="UTF-8">
			

			<!-- 파일선택 -->
	     
			<div class="col-12 border rounded custom-flie d-flex flex-column justify-content-center align-items-center p-2 font-primary">
				<span class="mr-3">이미지 등록</span>
				<input type="file" class="custom-flie-input " name="reviewFile" id="reviewImg" accept="image/*">
				<input type="hidden" name="review_idx" value="">
				<div class="change_img"><img src="" class="mt-2"/></div>
			</div>
		</form>
			<!-- 셀렉트 -->
		<form action="reviewWriteAction" name="reviewWriteForm" method="post" id="reviewWriteForm">

				<div class="float-right mr-3">
					<select class="form-select form-control rounded text-dark my-2 font-secondary pl-1"
						style="width: 85px;"
						aria-label="별점" name="review_star" id="review_star">
						<option value="" disabled selected>별점</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
				
				<!-- 리뷰내용 -->
				<div class="container font-primary mb-5 mt-2">
					<textarea name="review_contents" id="review" cols="50" rows="10"
						class="form-control form-control-lg border border-color col-12 font-primary"
						style="height: 200px;" placeholder="리뷰를 입력해 주세요" id="review_content"></textarea>
					<input type="hidden" name="user_idx" id="user_idx" value="<%=request.getParameter("user_idx") %>">
					<input type="hidden" name="goods_idx" id="goods_idx" value="<%=request.getParameter("goods_idx") %>">
				</div>
			
			</form>
			
			
			<!-- 버튼 -->
			<div class="my-5 align-items-center text-center w-100">
				<button type="submit" class="btn btn-dark text-light form-control w-75 col-6"
					onclick = "reviewContentAction()">작성</button>
			</div>
		<!-- 팝업창 div -->
	</div>
</div>
	<c:import url="../footer.jsp"></c:import>
	<c:import url="../nav.jsp"></c:import>
	</div>
	<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
	<script src="/js/main.js"></script>
	<script>
	//이미지 보여지기
	  $("#reviewImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".change_img img").attr("src", data.target.result).width(100).height(50);        	
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
	 
 </script>
</body>
</html>