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
	<!-- container -->
	<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >
	<c:import url="../header.jsp"></c:import>
		<!-- 박스 -->
		<div class="col-10 shadow border rounded my-4">
			<div class="d-flex flex-column">
				<div
					class="w-100 text-center font-weight-bold d-flex justify-content-center align-items-center"
					style="height: 92px;">
					<div>고객님의 방문을 환영합니다.</div>
				</div>
				<!-- 회원정보 보기 링크 -->
				<div class="border-top w-100 container-fluid">
					<a href="./memberInfo?user_id=${user_id}" class="text-dark"
						style="text-decoration: none;">
						<div
							class="col-10 text-left pl-2 ml-0 mr-0 align-items-center pt-2"
							style="height: 40px; float: left;">회원정보보기</div>
						<div style="float: left;">
							<img src="/img/icon/right.png" alt=""
								style="width: 25px; height: 25px;" class="mx-auto d-block pt-2">
						</div>
					</a>
				</div>
				<!-- box div -->
			</div>
		</div>

		<!-- 쇼핑 -->
		<div class="w-100 ml-0 mr-0 border p-2">
			<div class="text-black-50" style="font-size: 12px;">쇼핑</div>
			<a href="./purchaseList?user_id=${user_id}" style="font-size: 16px;"
				class="text-dark"> 구매내역보기</a>
		</div>
		<!-- 고객센터 -->
		<div class="w-100 ml-0 mr-0 border p-2">
			<div class="text-black-50" style="font-size: 12px;">고객센터</div>
			<a href="/customer/ask?" style="font-size: 16px;"
				class="text-dark"> 1:1 문의 </a> <br> 
				<a href="/customer/myAsk"style="font-size: 16px;" class="text-dark">상품문의보기</a> <br>
				<a href="/customer/faq" style="font-size: 16px;" class="text-dark">FAQ</a>
		</div>
		<!-- 로그아웃 -->
		<div class="w-100 ml-0 mr-0 border p-2">

			<a href="/login/logoutAction" style="font-size: 16px;" class="text-dark"> 로그아웃</a>
		</div>
		<!-- 회원탈퇴 -->
		<div class="w-100 ml-0 mr-0 border p-2" class="text-dark">
			<a href="/login/quit" style="font-size: 16px;" class="text-dark">
				회원탈퇴</a>
		</div>
		<!-- 목업 div -->
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