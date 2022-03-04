<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 회원탈퇴 경고 팝업창</title>
     <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
     <link rel="styleshhet" href="/css/custom.css">
</head>
<body>
  <div class="container-sm container-fluid col-12 position-absolute d-flex flex-column justify-content-center bg-white border border-dark-50 rounded" id="quitForm" style="max-width: 340px; top: 50%; left: 50%; transform:translate(-50%, -50%);">
    <div class="d-100  d-flex flex-row  justify-content-end">
      <img src="/img/icon/cross.png" alt="취소아이콘" width="30px" height="30px" onclick="window.close();">
    </div>
    <div class="col-12 font-weight-bold text-center text-dark mt-3 py-4" width="300px" height="60px" style="font-size: 16px;">
      탈퇴 시 고객님의 모든 정보가 소멸됩니다.<br>
      정말 탈퇴 하시겠습니까?
    </div>
	<form name="quitForm" onsubmit="return nullChecker();">
	    <!-- 체크박스 처리해야 넘어가는 자바스크립트 기능 + 체크박스 위치  onsubmit="return nullChecker();" onclick="agree();"-->
	    <div class="col-12 row ml-2">
	      <div class=" custom-control custom-checkbox my-1" >
	        <input type="checkbox" class="custom-control-input nullcheck" name="agree" id="quitCheck" >
	        <label class="custom-control-label text-dart pl-2" for="quitCheck" style="font-size:14px;">정보처리에 동의합니다.</label>
	      </div>
	    </div>
	   
	    <div class="d-flex justify-content-center mb-3">
	      <input type="button" class="col-5 btn btn-dark text-light my-3 mr-1" value="네" onclick="multiSubmit(formName='quitForm', formAction='quitAction', onsubmit = 'retrun nullChecker();')">
	      <input type="button" class="col-5 btn btn-secondary text-dark my-3 ml-1" value="아니오" onclick="multiSubmit(formName='quitForm', formAction='/')">
	    </div>
 	</form>
  </div>
<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>