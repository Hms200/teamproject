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

	<c:import url="../header.jsp"></c:import>

	<div
		class="container-sm container-fluid col-11  d-flex flex-column  align-items-center bg-white border border-dark-50 rounded"
		style="top: 60px; left: 10px; max-width: 520px;; height: 430px;">
		<!-- 아이콘 -->
		<div class="d-flex w-100 flex-row justify-content-end pt-2 ">
			<img src="/img/icon/cross.png" alt="취소"
				style="width: 30px; height: 30px; cursor: pointer;"
				onclick="location.href='memberlist'">
		</div>
		<!-- main -->
		<div
			class="w-100 d-flex flex-column jusfity-content-center align-items-center px-3 mb-2">
			<div class="w-auto text-center font-weight-bold text-dark mt-1 mb-4"
				style="font-size: 16px;">고객님의 리뷰가 큰 힘이 됩니다!</div>
		</div>
		<form action="reviewWriteAction" name="reviewWriteForm" method="post" enctype="mutipart/form-data">
			<!-- 파일선택 -->
			<div class="custom-flie flex-row p-2 "
				style="float: left; font-size: 14px;">
				<input type="file" class="custom-flie-input" name="file">
			</div>
			<!-- 셀렉트 -->
			<div>
				<div class="d-flex justify-content-end">
					<select class="form-select form-control rounded text-dark"
						style="font-size: 14px; height: 35px; width: 110px;"
						aria-label="별점" name="review_star">
						<option value="" disabled selected>별점선택</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
				<!-- 리뷰내용 -->
				<div style="font-size: 14px;" class="container w-100">
					<textarea name="review_contents" id="review" cols="50" rows="10"
						class="form-control form-control-lg border border-color col-12"
						style="font-size: 14px; height: 150px;" placeholder="리뷰를 입력해 주세요"></textarea>
				</div>
			</div>
			<!-- 버튼 -->
			<div class="mt-5 align-items-center text-center">
				<button type="submit" class="btn btn-dark text-light form-control"
					style="width: 140px;">작성</button>
			</div>
		</form>
		<!-- 팝업창 div -->
	</div>
	<c:import url="../footer.jsp"></c:import>
	<c:import url="../nav.jsp"></c:import>
	<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
	<script src="/js/main.js"></script>
</body>
</html>