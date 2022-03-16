<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>memberInfo</title>
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
		<!-- 헤더 -->
		<div
			class="container-sm container-fluid d-flex flex-row mb-0 pl-2 mt-1 border-bottom"
			style="height: 60px; font-size: 16px;">
			<div class="col-1 my-3">
				<a href="/myPage/myPage"> <img src="/img/icon/뒤로가기 (2).png"
					style="width: 30px; height: 30px;" alt="">
				</a>
			</div>
			<div class="col-11 my-3 py-1 text-center font-weight-bold">
				회원정보</div>
		</div>
		<form action="userUpdateAction" name="userUpdateForm" method="post"
			onsubmit="return nullChecker();">
			<!-- 이름, 아이디 -->
			<div class="col-12 my-3 d-flex flex-row justify-content-center">
				<div class="d-flex justify-content-around">
					<div style="height: 65px;"
						class="col font-weight-bold form-group text-dark pr-2">
						이름 <input type="text"
							class="form-control-plaintext col-12 rounded font-weight-normal border"
							style="font-size: 12px;" name="user_name"
							value="${user.user_name}" readonly>
					</div>
					<div style="height: 65px;"
						class="col font-weight-bold form-hroup text-dark">
						아이디 <input type="text"
							class="form-control-plaintext col-12 rounded font-weight-normal border"
							style="font-size: 12px;" name="user_id" value="${user.user_id}"
							readonly>
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
						id="pw1" placeholder="변경할 비밀번호를 입력해 주세요"> <input
						type="password"
						class="form-control col-12 rounded font-weight-nomal nullcheck"
						id="pw2" name="user_pw" placeholder="비밀번호 확인 입력을 해주세요">
					<div id="al1" style="color: red; display: none;">*비밀번호가 서로
						다릅니다*</div>
					<div id="al2" style="color: green; display: none;">*비밀번호가
						일치합니다*</div>
				</div>
				<!-- 이메일 -->
				<div class="my-3 col-12 font-weight-bold form-group text-dark">
					이메일 <input type="email"
						class="form-control col-12 rounded font-weight-nomal nullcheck"
						name="user_email" placeholder="이메일을 입력해 주세요">
				</div>
				<!-- 전화번호 -->
				<div class="my-3 col-12 font-weight-bold form-group text-dark">
					전화번호 <input type="text"
						class="form-control col-12 rounded font-weight-nomal nullcheck"
						name="user_phone" placeholder="전화번호를 입력해 주세요">

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
						name="sample6_postcode" id="sample6_postcode" placeholder="우편주소"
						readonly> <input type="button"
						class="col-3 btn btn-secondary text-dark mb-1" value="주소찾기"
						style="font-size: 14px;" onclick="sample6_execDaumPostcode()">
					<input type="text"
						class="col-12 form-control mb-1 bg-white nullcheck"
						name="sample6_address" id="sample6_address"
						placeholder="주소를 입력해주세요" readonly> <input type="text"
						class="col-12 form-control nullcheck" name="sample6_detailAddress"
						id="sample6_detailAddress" placeholder="상세주소를 입력해주세요">
					<!-- 지우면 버튼클릭 안됨 -->
					<input type="hidden" class="inputStyle1" id="sample6_extraAddress"
						placeholder="참고항목"> <input type="hidden"
						name="user_address">
				</div>
			</div>
			<!-- 수정하기 button -->
			<div class="my-5 align-items-center text-center">
				<button type="submit"
					class="btn btn-primary text-light form-control"
					style="width: 300px;">수정하기</button>
			</div>
		</form>
	<c:import url="../footer.jsp"></c:import>
	<c:import url="../nav.jsp"></c:import>
	</div>
	<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/js/main.js"></script>
	<!-- 비밀번호 확인 true/false 표현 , 주소값 넘겨주기 -->
	<script>
  $(function(){
    var pw2;
    $('input[id=pw2]').keyup(function(){
      var pw2 = $(this).val();
      if(pw2 != $('input[id=pw1]').val()){
        $('#al1').css('display','block');
        $('#al2').css('display','none');
      }
      if(pw2 == $('input[id=pw1]').val()){
        $('#al1').css('display','none');
        $('#al2').css('display','block');
      }
    })
    $('button[type=submit]').click(function(){
    const address = $('#sample6_address').val()+$('#sample6_detailAddress').val();
    $('input[name=user_address]').attr('value',address);
    })
  })
</script>
</body>
</html>