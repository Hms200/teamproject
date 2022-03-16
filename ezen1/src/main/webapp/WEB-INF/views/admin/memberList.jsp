<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<c:import url="../header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative" style="max-width: 520px; margin-top: 60px; ">
        <!-- 헤더 -->
        <div class="container-sm container-fluid d-flex flex-row mb-0 pl-2 mt-1 border-bottom" style="height: 60px; font-size: 16px;">
            <div class="col-1 my-3">
              <a href="/main">
                <img src="/img/icon/뒤로가기 (2).png" alt="" width="30px" height="30px">
              </a>
            </div>
            <div class="col-11 my-3 py-1 text-center font-weight-bold">
              회원목록
            </div>
          </div>
          <!-- 검색바 -->
          <form action="admin/userSearchAction" name="userSearchForm">

          <div class="d-flex flex-row mt-4 mb-4">
          <div class="form-control" style="width: 90px;">
            <select class="form-select " name="cat" style="border: none; background-color: white;">
              <option value="0">id</option>
               <option value="1">구매량</option>
               <option value="2">금액</option>
               <option value="3">가입일</option>
              
             </select>
            </div>
            
                <div class="search">
                <input type="text" name="searchText" placeholder="카테고리를 선택해주세요" class="border border-1 form-control" style="width: 230px;">
              </div>
              <div>
                <button class="btn" type="submit">
                  <img src="/img/icon/search.png" alt="" style="width: 25px; height: 25px;">
                </button>
              </div>
              
           </div>
          </form> 

           <!-- 테이블 -->
           <div class="table-responsive">
           <table class="table table-bordered table-sm text-dark">
               <thead class="font-weight-bold" style="font-size: 14px;">
                <tr class="table-secondary">
                    <td>no</td>
                    <td>아이디</td>
                    <td>이름</td>
                    <td>구매량</td>
                    <td>구매금액</td>
                    <td>가입일</td> 
                </tr>
                </thead>
                <tbody style="font-size: 12px;">
                  
               <tr style="cursor:pointer;" onclick="popupHideandShow(target='memberlistpopup')">
                <td>01</td>
               <td>hong1234</td>
               <td>홍길동</td>
               <td>12</td>
               <td>123.000</td>
               <td>2022.02.21</td>
              </tr>
               <tr style="cursor:pointer;" onclick="popupHideandShow(target='memberlistpopup')">
               <td>02</td>
               <td>lee1234</td>
               <td>이순신</td>
               <td>3</td>
               <td>70.000</td>
               <td>2022.02.21</td>
               </tr>
               
            
               </tbody>
           </table>
        </div>

           
            
            
                
            

    </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>