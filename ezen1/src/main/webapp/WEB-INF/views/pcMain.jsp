<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid d-none d-lg-block flex-column justify-content-center align-items-center border p-0 ml-5" style="max-width: 690px; height: 100vh;" id="pc_contents">
    <div class="d-flex flex-column justify-content-end align-items-end pr-4 no-repeat mx-auto col-12" style="background-image: url('/img/pcMainImg.jpeg'); background-size: cover; height: 100vh;">
      <!-- 버튼 디자인 -->
      <c:if test="${ not empty user_id }">
	    <div class="border border-primary rounded-pill text-center text-primary my-2" style="font-size: 12px; width: 100px; height: 22px; line-height: 22px; cursor: pointer;" onclick="location.href='../myPage/myPage'">
	    	${ user_id }
	    </div>
	  </c:if>
	  <c:if test="${ empty user_id }">
	    <div class="border border-primary rounded-pill text-center text-primary my-2" style="font-size: 12px; width: 100px; height: 22px; line-height: 22px; cursor: pointer;" onclick="location.href='../login/login'">
	    	LOGIN
	    </div>
	  </c:if>
      <div class="border border-primary rounded-pill text-center text-primary mb-5" style="font-size: 12px; width: 100px; height: 22px; line-height: 22px; cursor: pointer;" onclick="location.href='../aboutUs'">aboutUs > </div>
    </div>
  </div>