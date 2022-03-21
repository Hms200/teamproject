<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>about Us</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >

<c:import url="header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative" id="mainContainer" style="max-width: 520px; margin-top: 80px;">
       
      <!-- mainBOX -->
      <div class="col-12 d-flex flex-column justify-content-center align-items-center">           
        <div><img src="/img/main01.jpeg" class="img-fluid"alt="이미지"></div>   
        <div class="text-dark mt-5 mb-5">
          <h3 class="text-center" style="font-size: 18px;">[ 소소하지만 향기로운 행복을 당신에게 ]</h3>
          <p class="pt-4 pb-5 pl-1 pr-1 font-primary">
            소향행의 향기로 당신의 일상에 행복을 채우세요.<br><br>
            소향행은 다양한 천연 오일을 베이스로 천여가지의 조합법을 통해 다양한 향을 제조하여 판매하는 퍼퓸샵입니다.<br><br>
            인간의 다섯가지 감각 중 가장 추상적인 감각으로 불리는 후각의 완벽한 만족을 위해 소향행은 5년간 수천가지 조합의 향을 개발, 연구하였습니다. 연구 끝에 완성된 천여개의 감각적인 향 제품을 소향행 샾에서 만나보세요.
          </p>
          <h3 class="text-left pt-3 mb-3" style="font-size: 18px;">찾아오시는길</h3>              
          <!-- 구글 지도삽입 -->
          <div class="map-responsive d-flex justify-content-center pt-2 mb-4">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3158.7216493263263!2d127.06010341531409!3d37.65574757978121!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357cb9154da5ebed%3A0x48e83c38e2553738!2z7ZmU656R67mM65Sp!5e0!3m2!1sko!2skr!4v1645275174005!5m2!1sko!2skr" class="w-100" style="border:0; height:200px" allowfullscreen="" loading="lazy"></iframe>
          </div>  
          <p class="pl-1 pr-1 font-primary">
            서울특별시 노원구 상계로64 화랑빌딩4F (주)소향행<br>
            연락처: 0000-0000
          </p>                        
        </div>  
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