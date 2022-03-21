<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 상세보기</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px; max-height: 100vh; overflow: auto;" >


<c:import url="../header.jsp"></c:import>

<!-- main container -->
        <div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">

 <!-- container -->
   <!--  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative px-0" style="max-width: 520px; margin-top: 60px;"> -->
        <!-- 팝업창 -->
        <div class="container-sm container-fluid col-11  d-flex flex-column  align-items-center bg-white border border-dark-50 rounded my-5">
            <div class="d-flex w-100 flex-row justify-content-end pt-2">
                
               <!--  취소버튼 -->
                <div class="col-1  mr-3" onclick="location.href='memberList'" style="cursor: pointer;">
                <img src="/img/icon/cross.png" alt="취소" style="width: 30px; height: 30px;">
            </div>    
            </div>
            
             
                  
              
               <!-- main -->
               <div class="w-100 d-flex flex-column jusfity-content-center align-items-center px-3 mb-3">
                <div class="w-auto text-center font-weight-bold text-dark mt-3 mb-4" >
                       회원정보 상세조회
                </div>  
               </div>
              
               <form action="userSearchAction" name="userSearchForm" class="d-flex flex-column" >
                
                <!-- 이름 -->
                <div>
                <div class="col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    이름
                <div class="pl-5">
                <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck font-primary " value="${ user.user_name }"  disabled>
                </div>
                </div>
                </div>
                
                <!-- 아이디 -->
                <div>
                <div class="col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    아이디
                <div class="pl-4">
                <input type="text" class="form-control font-primary col-12 rounded font-weight-nomal nullcheck " value=${ user.user_id }  disabled>
                </div>
                </div>
                </div>
                
                <!-- 비밀번호 -->
                <div>
                <div class="col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    가입일
                <div class="pl-3">
                <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck font-primary " value=${ user.join_date }  disabled>
                </div>
                </div>
                </div>
                
                <!-- 이메일 -->
                <div>
                <div class="col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    이메일
                <div class="pl-4"> 
                <input type="email" class="form-control col-12 rounded font-weight-nomal nullcheck  font-primary" value=${ user.user_email }  disabled>
                </div>
                </div>
                </div>
                
                <!-- 전화번호 -->
                <div>
                <div class="col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    전화번호
                <div class="pl-3">
                <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck  font-primary" value=${ user.user_phone }  disabled>
                </div>
                </div>
                </div>
                
                <!-- 주소 -->
                <div>
                <div class="col-12 font-weight-bold form-group text-dark d-flex flex-row justify-content-between">
                    주소
                <div class="pl-5">
                <input type="text" class="form-control col-12 rounded font-weight-nomal nullcheck font-primary " value=${ user.user_address }  disabled>
                </div>
                </div>
                </div>

                 <!-- 버튼 -->
               
                 <div  class="mt-5 mb-3 align-items-center text-center w-100" >
                    <button type="button" class="btn btn-dark text-light form-control col-8"  onclick="location.href='memberList'">확인</button>
          
                  </div>
           
               
            </form>
            
    
    
      <!--팝업창 div  -->         
        </div>



<!-- 레퍼런스 div -->
    </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>

</div>

<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>