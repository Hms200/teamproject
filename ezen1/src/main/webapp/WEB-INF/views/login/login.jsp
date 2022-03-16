<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative" style="max-width: 520px;">
      <div class="container col-11 d-flex flex-column align-items-center justify-content-center text-center postion-relative" style="max-width: 520px; margin-top:150px;">
        <div class="font-weight-bold font-italic text-dark w-100 mb-1" style="font-size: 24px">LOGIN</div>
        <div class="text-dark  w-100 mb-4" style="font-size: 10px">로그인을 하시면 다양한 혜택을 누릴 수 있습니다.</div>
        <div class="col-12 pl-0 pr-0  ml-0 mr-0 column">
          <form action="../login/loginAction" method="post" class="control mb-1" name="userInfo" onsubmit="return nullChecker();">
            <input type="text" class="mb-1 p-2 w-100 nullcheck" style="font-size: 14px;" name="user_id" id="user_id" placeholder="아이디를 입력하세요.">
            <input type="password" class="mb-3 p-2 w-100 nullcheck" style="font-size: 14px;" name="user_pw" id="user_pw" placeholder="비밀번호를 입력하세요.">
            <input type="submit" class="btn btn-primary w-100 rouned-lg text-white mb-2" style="font-size: 16px;" value="로그인">
          </form>
        </div>
        <a href="join" class="btn btn-outline-primary text-primary mb-2 w-100" style="font-size: 16px;">회원가입</a>
        <!-- 팝업창 띄우는 아이디/비밀번호찾기 -->
        <div class="w-100 mt-2 text-center" style="font-size: 14px;">
          <span class="text-dark" onclick="popupHideAndShow(target ='idFindForm');" style="cursor: pointer;">아이디찾기</span>
          <span class="text-black-50">&nbsp; | &nbsp;</span>
          <span class="text-dark" onclick="popupHideAndShow(target ='pwFindForm');" style="cursor: pointer;">비밀번호찾기</span>
        </div>
      </div>
    </div>
    <!-- 아이디찾기팝업창_ 팝업창 좌표는 화면 정가운데 고정시킴 -->
    <div class="container-sm container-fluid col-12 position-absolute d-none flex-column justify-content-center bg-white border border-dark-50 rounded" style="top:50%; left: 50%; transform:translate(-50%, -50%); max-width:340px;" id="idFindForm">
      <div class="d-100  d-flex flex-row  justify-content-end">
        <img src="/img/icon/cross.png" alt="" width="30px" height="30px" onclick="popupHideAndShow(target ='idFindForm');">
      </div>
        <div class="w-100 d-flex flex-column justify-content-center align-items-center mb-4" >
          <div class="w-auto text-center font-weight-bold text-dark mt-1 mb-4" style="height: 30px; font-size: 16px;">아이디 찾기</div>
          <div class="col-12 d-flex flex-column justify-content-center align-items-center mb-4">
            <form action="../login/idFindAction" method="get" class="form-control form-control-lg mb-1 col-12 d-flex flex-column align-items-center border-0" style="font-size: 14px;">
              <div class="form-group">
                <lable>이름 &nbsp;<input type="text" class="ml-2" name="user_name" placeholder="이름을 입력해주세요"></lable>
              </div>
              <div class="form-group">
                <lable>이메일 <input type="email" name="user_email" placeholder="이메일을 입력해주세요"></lable>
              </div>
              <input type="submit" class="btn btn-dark col-6 rouned-lg text-light my-3" style="font-size: 16px" height="40px">
            </form>
          </div>
        </div>
    </div>
    <!-- 비밀번호찾기 팝업창  -->
    <div class="container-sm container-fluid col-12 position-absolute d-none flex-column justify-content-center bg-white border border-dark-50 rounded" style="top:50%; left: 50%; transform:translate(-50%, -50%); max-width:340px;" id="pwFindForm">
      <div class="d-100 d-flex flex-row justify-content-end">
        <img src="/img/icon/cross.png" alt="" width="30px" height="30px" onclick="popupHideAndShow(target ='pwFindForm');">
      </div>
        <div class="w-100 d-flex flex-column justify-content-center align-items-center mb-4" >
          <!-- idFindText -->
          <div class="w-auto text-center font-weight-bold text-dark mt-1 mb-4" style="height: 30px; font-size: 16px;">비밀번호찾기</div>
          <div class="col-12 d-flex flex-column justify-content-center align-items-center mb-4">
            <form action="../login/pwFindAction" method="get" class="form-control form-control-lg mb-1 col-12 d-flex flex-column align-items-center border-0" style="font-size: 14px;">
              <div class="form-group">
                <lable>아이디 <input type="text" name="user_id" placeholder="아이디를 입력해주세요" /></lable>
              </div>
              <div class="form-group">
                <lable>이름 &nbsp;<input type="text" class="ml-2" name="user_name" placeholder="이름을 입력해주세요" /></lable>
              </div>
              <div class="form-group">
                <lable>이메일 <input type="email" name="user_email" placeholder="이메일을 입력해주세요" /></lable>
              </div>
              <input type="submit" class="btn btn-dark col-6 rouned-lg text-light my-3" style="font-size: 16px" height="40px" />
            </form>
          </div>
        </div>
    </div>
<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<!-- main js -->
<script src="/js/main.js"></script>
</body>
</html>