<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <!-- 검색최적화(seo)용 meta tag -->
	<meta property="title" content="소향행">
	<meta property="description" content="소중한 향기의 행복을 당신에게 선물하세요. 향기전문 샵 - 소향행">
	<meta property="image" content="https://postfiles.pstatic.net/MjAyMjAzMjJfMjE3/MDAxNjQ3OTUyMDQ3Mzc1.j4tI-RkQikaoUyx5hSUxnv059wvaDLRQ4Qp7mPRJQvog.67A-WtXggNCGMnAdZGLYn51MZ9R7KZ-eMwnKA0o0ZRsg.JPEG.anselddl17/logo.jpg?type=w966">
	<meta property="keyword" content="디퓨저 비누 향초 diffuser candle soap">
	<!-- og는 공유하기 등을 통해 나타나는 미리보기 표시항목 -->
	<meta property="og:type" content="website" />
	<meta property="og:title" content="소향행" />
	<meta property="og:description" content="소중한 향기의 행복을 당신에게 선물하세요. 향기전문 샵 - 소향행" />
	<!-- 페이지 도메인등록 후 og:url은 수정할것. -->
	<meta property="og:url" content="http://localhost:8085/" />
	<meta property="og:image" content="https://postfiles.pstatic.net/MjAyMjAzMjJfMjE3/MDAxNjQ3OTUyMDQ3Mzc1.j4tI-RkQikaoUyx5hSUxnv059wvaDLRQ4Qp7mPRJQvog.67A-WtXggNCGMnAdZGLYn51MZ9R7KZ-eMwnKA0o0ZRsg.JPEG.anselddl17/logo.jpg?type=w966" />
    <title>소향행</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<c:import url="pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >
<c:import url="header.jsp"></c:import>

 
    
        <!-- main container -->
        <div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">
            <!-- 케러셀 이미지 -->
            <div id="carouselImg" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                <li data-target="#carouselImg" data-slide-to="0" class="active"></li>
                <li data-target="#carouselImg" data-slide-to="1"></li>
                <li data-target="#carouselImg" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/img/main01.jpeg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="/img/main02.jpeg" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="/img/main03.jpeg" class="d-block w-100" alt="...">
                </div>
                </div>
            </div>

            <!-- 공지사항 -->
            <div id="carouselNotice" class="carousel slide w-100" data-ride="carousel" style="cursor: pointer;">
                <div class="carousel-inner">
	               
   	                <div class="carousel-item active" data-interval="4000">
	                    <div class="w-100 font-weight-bold border text-dark bg-secondary py-1 pr-2 pb-0 pl-3 font-primary"
	                     onclick="location.href='notice'">
	                		[공지] ${ noticeList[0].notice_title }
	            		</div>
	                </div>
	                
	                <c:forEach var="notice" items="${noticeList}" begin="1" step="1">
	                <div class="carousel-item" data-interval="4000">
	                    <div class="w-100 font-weight-bold border  text-dark bg-secondary py-1 pr-2 pb-0 pl-3 font-primary"
	                     onclick="location.href='notice'">
	              		  [공지] ${ notice.notice_title }
	            		</div>
	                </div>
	                </c:forEach>
                
                </div>
            </div>

            <!-- 카드영역 -->
            <div class="w-100">
             <!-- main search결과를 노출할때 -->
             <c:if test="${ entireItemCardMode == 1 }">
             <c:import url="card/entireItem.Card.jsp"></c:import>
             </c:if>
             
             <c:import url="card/BestItems.Card.jsp"></c:import>
             <c:import url="card/MDpick.Card.jsp"></c:import>
             <c:import url="card/MonthDiscount.Card.jsp"></c:import>
             <c:import url="card/Reviews.Card.jsp"></c:import>
             <!-- main search결과를 노출하는 때가 아닌경우 -->
             <c:if test="${ entireItemCardMode == 0 }">
             <c:import url="card/entireItem.Card.jsp"></c:import>
             </c:if>  
            </div>
             
        
        
        </div>
        
        

<c:import url="footer.jsp"></c:import>
<c:import url="nav.jsp"></c:import>
</div>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>