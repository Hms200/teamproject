<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>myPage</title>
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

	<!-- 페이지 전체 div -->

	<div
		class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center mb-5 mt-1"
		style="max-width: 520px; margin-top: 60px;">
		
		<!-- main container -->
    <!--  <div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">-->
		
	<div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 mb-3" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">

		<!-- 박스 -->

		<div class="container-fluid container-sm shadow border rounded my-5 mx-2" style="width:320px;">
			<div class="d-flex flex-column">
				<div
					class="w-100 text-center font-weight-bold d-flex justify-content-center align-items-center"
					style="height: 100px;">
					<div>${user_id}님의 방문을 환영합니다.</div>
			</div>
				<!-- 회원정보 보기 링크 -->
				<div class="border-top w-100 container-fluid" style="height:40px;">
					<a href="./memberInfo" class="text-dark"
						style="text-decoration: none;">
						<div class="col-10 text-left pl-2 ml-0 mr-0  d-flex  align-items-center pt-2 font-primary" style="float: left; ">회원정보보기</div>
						<div style="float: left;">
							<img src="/img/icon/right.png" alt=""
								style="width: 30px; height: 30px;" class="mx-auto d-block pt-2">
						</div>
					</a>
				</div>
				</div>
				<!-- box div -->
			</div>
		

		<!-- 쇼핑 -->
		<div class="w-100 ml-0 mr-0 border p-2 mt-2">
			<div class="text-black-50 font-secondary" >쇼핑</div>
			<a href="./purchaseList" 
				class="text-dark font-primary"> 구매내역보기</a>
		</div>
		<!-- 고객센터 -->
		<div class="w-100 ml-0 mr-0 border p-2">
			<div class="text-black-50 font-secondary" >고객센터</div>
			<a href="/customer/ask?" 
				class="text-dark font-primary"> 1:1 문의 </a> <br> 
				<a href="/customer/myAsk" class="text-dark font-primary">상품문의보기</a> <br>
				<a href="/customer/faq" class="text-dark font-primary">FAQ</a>
		</div>
		<!-- 로그아웃 -->
		<div class="w-100 ml-0 mr-0 border p-2">

			<a href="/login/logoutAction" class="text-dark font-primary"> 로그아웃</a>
		</div>
		<!-- 회원탈퇴 -->
		<div class="w-100 ml-0 mr-0 border p-2" class="text-dark">
			<a href="/login/quit" class="text-dark font-primary">
				회원탈퇴</a>
		</div>
		<!-- 목업 div -->
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
</body>
</html>
