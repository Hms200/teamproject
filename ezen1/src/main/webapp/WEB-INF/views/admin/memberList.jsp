<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원목록 조회</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >


<c:import url="../header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative mb-5" id="mainContainer" style="max-width: 520px; margin-top: 60px;">
        
        <!-- 헤더 -->
        <div class="font-weight-bold pl-3 d-flex my-2 w-100 pb-2 pt-3 text-black-50">회원목록 조회</div>

          <!-- 검색바 -->
          <form action="userSearchAction" name="userSearchForm" >

          <div class="d-flex flex-row my-3">
          <div class="form-control pl-1" style="width: 80px;">
            <select class="form-select " name="cat" style="border: none; background-color: white;" onchange="submit();">
              <option value="0">id</option>
               <option value="1">구매량</option>
               <option value="2">금액</option>
               <option value="3">가입일</option>
              
             </select>
            </div>
            
                <div class="search d-flex flex-row">
                <input type="text" name="searchText" value="검색" class="border border-1 form-control" style="width: 220px;" >
                <button class="btn form-control p-1 pb-2 " type="submit" style="margin-left: -45px;">
                  <img src="/img/icon/search.png" alt="" style="width: 18px; height: 18px;">
               </button>
              </div>
              
           </div>
          </form> 

           <!-- 테이블 -->

           <div class=" my-4 pb-5" >
           <table class="table table-bordered text-dark table-sm">
               <thead class="font-weight-bold text-center font-primary " >
                <tr class="table-secondary">
                    <td class="col-1">no</td>
                    <td class="col-3">아이디</td>
                    <td class="col-2">이름</td>
                    <td class="col-2">구매량</td>
                    <td class="col-2">구매금액</td>
                    <td class="col-2">가입일</td> 
                </tr>
                </thead>
                <tbody class="text-center word-break font-secondary" >
               
                <c:forEach var="user" items="${ userlist }"> 
                	
			               <tr class="word-break" style="cursor:pointer;" onclick="location.href='memberListpopup?user_idx=${ user.get('USER_IDX')}'">
			                <td>${ user.get("USER_IDX") }</td>
			               <td class="">${ user.get("USER_ID") }</td>
			               <td>${ user.get("USER_NAME") }</td>
			               <td>${ user.get("TOTAL_AMOUNT") }</td>
			               <td>${ user.get("TOTAL_PRICE") }</td>
			               <fmt:formatDate var="date" value="${ user.get('JOIN_DATE') }" pattern="YY.MM.dd"/>
			               <td>${ date }</td>
			              </tr>
              	
              </c:forEach> 
               
               
            
               </tbody>
           </table>
        </div>

           
            
            
                
            

    </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>

</div>

<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>