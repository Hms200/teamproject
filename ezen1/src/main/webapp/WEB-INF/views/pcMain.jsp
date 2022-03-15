<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pcMainPage</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="/css/custom.css">
</head>
<body>
	<div class="container-fluid d-none d-lg-block flex-column justify-content-center align-items-center border" style="max-width: 900px;">
    <div class="d-flex flex-column justify-content-end align-items-end my-4 pr-4 no-repeat mx-auto" style="background-image: url('/img/pcMainImg.jpeg'); background-size: cover; width: 475px; height: 600px;">
      <!-- 버튼 디자인 -->
      <c:if test="${ not empty user_id }">
	    <div class="border border-primary rounded-pill text-center text-primary my-2" style="font-size: 12px; width: 100px; height: 22px; line-height: 22px; cursor: pointer;" onclick="location.href='myPage/myPage'">
	    	${ user_id }
	    </div>
	  </c:if>
	  <c:if test="${ empty user_id }">
	    <div class="border border-primary rounded-pill text-center text-primary my-2" style="font-size: 12px; width: 100px; height: 22px; line-height: 22px; cursor: pointer;" onclick="location.href='login/login'">
	    	LOGIN
	    </div>
	  </c:if>
      <div class="border border-primary rounded-pill text-center text-primary mb-5" style="font-size: 12px; width: 100px; height: 22px; line-height: 22px; cursor: pointer;" onclick="location.href='aboutUs'">aboutUs > </div>
    </div>
  </div>
<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<!-- main js -->
<script src="/js/main.js"></script>
</body>
</html>