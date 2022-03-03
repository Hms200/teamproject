<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin/transaction</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative" style="max-width: 520px;">
   
         <!-- title container -->
         <div class="container-fluid d-flex flex-row mb-4 border-bottom border-dark-50" style="height: 60px;">
            <!-- title back btn -->
                <div class="col-1 my-3" onclick="location.href='admin'" style="cursor: pointer;">
                    <img src="/img/icon/뒤로가기 (2).png" alt="뒤로가기">
                </div>
            <!-- title -->
                <div class="col-11 my-3 py-1 text-center font-weight-bold" style="font-size: 16px;">
                    주문목록
                </div>
            </div>

            <!-- drop down 정렬버튼 -->
            <!-- href 에 해당상품만 노출되도록 서버에 요청하는 request 작성해야함. -->
            <div class="col-11 d-flex flex-row justify-content-around mb-4">
                <div class="dropdown col-5 px-2">
                    <a class="btn btn-outline-secondary dropdown-toggle w-100" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false">
                      주문 상태
                    </a>
                    
                    <div class="dropdown-menu col-11" style="min-width: 0;" aria-labelledby="dropdownMenuLink">
                      <a class="dropdown-item" href="#">주문접수</a>
                      <a class="dropdown-item" href="#">발송준비중</a>
                      <a class="dropdown-item" href="#">배송중</a>
                      <a class="dropdown-item" href="#">완료</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">주문취소</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">반품신청</a>
                      <a class="dropdown-item" href="#">교환신청</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">반품접수</a>
                      <a class="dropdown-item" href="#">교환접수</a>

                    </div>
                </div>

                <div class="dropdown col-5 px-2">
                    <a class="btn btn-outline-secondary dropdown-toggle w-100" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false">
                      주문 날짜
                    </a>
                  
                    <div class="dropdown-menu col-11" style="min-width: 0;" aria-labelledby="dropdownMenuLink">
                      <a class="dropdown-item" href="#">최신순</a>
                      <a class="dropdown-item" href="#">오래된순</a>
                    </div>
                </div>
            </div>

            <!-- table container-->
            <div class="container-fluid text-center">
                <!-- table -->
                <table class="table table-hover border border-dark-50">
                    <thead class="thead-dark-50 bg-secondary">
                        <th scope="col">주문번호</th>
                        <th scope="col">아이디</th>
                        <th scope="col">주문상태</th>
                        <th scope="col">주문날짜</th>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row" onclick="location.href='transactionpop?#'" style="cursor: pointer;">111111</th>
                            <td>abc0123</td>
                            <td>배송중</td>
                            <td style="font-size: 12px;">yyyy-MM-dd:<br>HH:mm</td>
                        </tr>
                        <tr>
                            <th scope="row"onclick="location.href='#'" style="cursor: pointer;"">222222</th>
                            <td> abc0112</td>
                            <td> 주문접수</td>
                            <td style="font-size: 12px;">yyyy-MM-dd:<br>HH:mm</td>
                        </tr><tr>
                            <th scope="row" onclick="location.href='#'" style="cursor: pointer;">333333</th>
                            <td> abc0012</td>
                            <td> 배송완료</td>
                            <td style="font-size: 12px;">yyyy-MM-dd:<br>HH:mm</td>
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