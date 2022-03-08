<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>title</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/custom.css">
</head>
<body>

	<c:import url="../header.jsp"></c:import>

	<!-- container -->
	<div
		class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative"
		style="max-width: 520px;">

		<!-- 헤더 -->
		<div
			class="container-sm container-fluid d-flex flex-row mb-0 pl-2 mt-1 border-bottom"
			style="height: 60px; font-size: 16px;">
			<div class="col-1 my-3">
				<a href="/customer"> <img src="/img/icon/뒤로가기 (2).png"
					style="width: 30px; height: 30px;" alt="">
				</a>
			</div>
			<div class="col-11 my-3 py-1 text-center font-weight-bold">
				회원정보</div>
		</div>

		<form action="userUpdateAction" name="userUpdateForm"
			onsubmit="return nullChecker();">

			<!-- 이름, 아이디 -->
			<div class="col-12 my-3 d-flex flex-row justify-content-center">
				<div class="d-flex justify-content-around">
					<div style="height: 65px;"
						class="col font-weight-bold form-group text-dark pr-2">
						이름 <input type="text"
							class="form-control-plaintext col-12 rounded font-weight-normal border"
							style="font-size: 12px;" placeholder="홍길동" readonly>
					</div>
					<div style="height: 65px;"
						class="col font-weight-bold form-hroup text-dark">
						아이디 <input type="text"
							class="form-control-plaintext col-12 rounded font-weight-normal border"
							style="font-size: 12px;" placeholder="홍길동" readonly>
					</div>
				</div>
			</div>

			<!-- 비밀번호 -->
			<div class="d-flex flex-column">
				<div class="my-2 col-12 font-weight-bold form-group text-dark">
					비밀번호 <input type="password"
						class="form-control col-12 rounded font-weight-nomal nullcheck"
						placeholder="기존 비밀번호를 입력해 주세요"> <input type="password"
						class="form-control col-12 rounded font-weight-nomal my-1 nullcheck"
						placeholder="변경할 비밀번호를 입력해 주세요"> <input type="password"
						class="form-control col-12 rounded font-weight-nomal nullcheck"
						placeholder="비밀번호 확인 입력을 해주세요">

				</div>
				<!-- 이메일 -->
				<div class="my-3 col-12 font-weight-bold form-group text-dark">
					이메일 <input type="email"
						class="form-control col-12 rounded font-weight-nomal nullcheck"
						placeholder="이메일을 입력해 주세요">
				</div>

				<!-- 전화번호 -->
				<div class="my-3 col-12 font-weight-bold form-group text-dark">
					전화번호 <input type="email"
						class="form-control col-12 rounded font-weight-nomal nullcheck"
						placeholder="전화번호를 입력해 주세요">
				</div>

				<!-- 주소 -->
				<!-- <div class="my-3 col-12 form-group">
            <div class="d-flex flex-row">
                <div class="text-dark font-weight-bold pr-5">
                  주소
                </div>
                <div>
                    <div class="d-flex flex-row">
                    <input type="text" class="form-control col-9 rounded font-weight-nomal nullcheck" placeholder="주소를 입력해 주세요">
                    <button type="button" class="btn btn-secondary align-middle text-center ml-1" style="font-size: 10px; line-height: 10px;" onclick="sample6_execDaumPostcode()">주소찾기</button>
                    </div>
                    <input type="text" class="form-control col-12 rounded font-weight-nomal  my-1 nullcheck" placeholder="주소를 입력해 주세요">
                    <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck" placeholder="상세주소를 입력해 주세요">
                </div>
                
 
            </div>
        
        </div> -->
				<div class="text-left font-weight-bold col-12 mt-2">주소</div>
				<div class="form-group row mb-5 px-4 justify-content-between"
					style="font-size: 14px;">
					<input type="text" class="col-8 form-control mb-1 bg-white"
						id="sample6_postcode" placeholder="우편주소" readonly> <input
						type="button" class="col-3 btn btn-secondary text-dark mb-1"
						value="주소찾기" style="font-size: 14px;"
						onclick="sample6_execDaumPostcode()"> <input type="text"
						class="col-12 form-control mb-1 bg-white nullcheck"
						id="sample6_address" placeholder="주소" readonly> <input
						type="text" class="col-12 form-control" id="sample6_detailAddress"
						placeholder="상세주소를 입력해주세요">
					<!-- 지우면 버튼클릭 안됨 -->
					<input type="hidden" class="inputStyle1" id="sample6_extraAddress"
						placeholder="참고항목">
				</div>
			</div>


			<!-- 수정하기 button -->
			<div class="mt-5 align-items-center text-center">
				<button type="submit"
					class="btn btn-primary text-light form-control"
					style="width: 300px;">수정하기</button>

			</div>
		</form>



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