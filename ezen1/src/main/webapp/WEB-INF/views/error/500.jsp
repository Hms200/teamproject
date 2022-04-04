<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>error</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center" style="margin-top: 180px;">       
  
    <!-- img -->
    <div class="w-100 d-flex justify-content-center">
      <div style="width: 110px;">
        <img src="/img/icon/errorCon.png" class="img-fluid" alt="error">
      </div>   
    </div>      
    <!-- text -->
    <div class="my-2">
      <h3 style="font-size: 20px;" class="text-center font-weight-bold mb-3">ERROR PAGE</h3>
      <p class="text-center" style="font-size: 14px; line-height: 25px;">     
        서비스 이용에 불편을 드려서 죄송합니다.<br>
        <c:if test="${ errorMessage == '404' }">
        페이지를 찾을 수 없습니다. 다시 시도해 주세요.<br>
        지속적으로 문제가 발생하면 고객센터를 통해 문의해주시기 바랍니다.<br>
        </c:if>
        <c:if test="${ errorMessage == '500' }">
        다시 로그인 하신 후 이용해주세요.<br>
        문제가 지속될 경우 고객센터를 통해 문의해주시기 바랍니다.<br>
        </c:if>
      </p>
    </div>
    
    <!-- button -->
    <a href="../login/login" class="btn btn-primary" style="font-size: 16px; width: 130px;"> 로그인페이지 > </a>
  
  </div>


<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>