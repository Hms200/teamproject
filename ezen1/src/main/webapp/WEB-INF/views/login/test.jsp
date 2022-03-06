<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${ not empty user_id }">
		${ user_id } <br>
		${ user_idx }
	    <span><a href="logoutAction">LOGOUT</a></span>
	    <span><a href="quitAction?user_id=${ user_id }">quitAction</a></span>
	    <span><a href="/main">main</a></span>
	    </c:if>
	    <c:if test="${ empty user_id }">
	    	<span><a href="login">LOGIN</a></span>
	    </c:if>
	
	
	
</body>
</html>