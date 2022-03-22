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

<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >


<c:import url="../header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative" id="mainContainer" style="max-width: 520px; margin-top: 60px;">
   		<div class="font-weight-bold pl-3 d-flex my-2 w-100 pb-2 pt-3 text-black-50">주문목록</div>
         <!-- title container 
         <div class="container-fluid d-flex flex-row mb-4 border-bottom border-dark-50" style="height: 60px;">
            
                <div class="col-1 my-3" onclick="location.href='../admin'" style="cursor: pointer;">
                    <img src="/img/icon/뒤로가기 (2).png" alt="뒤로가기">
                </div>
            
                <div class="col-11 my-3 py-1 text-center font-weight-bold" style="font-size: 16px;">
                    주문목록
                </div>
            </div>-->

            <!-- drop down 정렬버튼 -->
            <!-- href 에 해당상품만 노출되도록 서버에 요청하는 request 작성해야함. -->
            <div class="col-11 d-flex flex-row justify-content-around mb-4" style="flex: none;">
                <div class="dropdown col-5 px-2">
                    <a class="btn btn-outline-secondary dropdown-toggle w-100" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false">
                      주문 상태
                    </a>
                    
                    <div class="dropdown-menu col-11" style="min-width: 0;" aria-labelledby="dropdownMenuLink">
                      <a class="dropdown-item" href="../admin/transaction?statement=주문접수">주문접수</a>
                      <a class="dropdown-item" href="../admin/transaction?statement=발송준비중">발송준비중</a>
                      <a class="dropdown-item" href="../admin/transaction?statement=배송중">배송중</a>
                      <a class="dropdown-item" href="../admin/transaction?statement=완료">완료</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="../admin/transaction?statement=주문취소">주문취소</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="../admin/transaction?statement=반품신청">반품신청</a>
                      <a class="dropdown-item" href="../admin/transaction?statement=교환신청">교환신청</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="../admin/transaction?statement=반품접수">반품접수</a>
                      <a class="dropdown-item" href="../admin/transaction?statement=교환접수">교환접수</a>

                    </div>
                </div>

                <div class="dropdown col-5 px-2">
                    <a class="btn btn-outline-secondary dropdown-toggle w-100" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-expanded="false">
                      주문 날짜
                    </a>
                  
                    <div class="dropdown-menu col-11" style="min-width: 0;" aria-labelledby="dropdownMenuLink">
                      <a class="dropdown-item" href="../admin/transaction?statement=최신순">최신순</a>
                      <a class="dropdown-item" href="../admin/transaction?statement=오래된순">오래된순</a>
                    </div>
                </div>
            </div>

            <!-- table container-->
            <div class="container-fluid text-center">
                <!-- table -->
                <table class="table table-hover border border-dark-50">
                    <thead class="thead-dark-50 bg-secondary font-primary">
                        <th scope="col" class="px-2">주문번호</th>
                        <th scope="col" class="px-2">아이디</th>
                        <th scope="col" class="px-2">주문상태</th>
                        <th scope="col" class="px-2">주문날짜</th>
                    </thead>
                    <tbody>
                    	<c:forEach var="list" items="${ purchaselist }">
                        <tr class="font-primary">
                            <th scope="row" onclick="location.href='transactionpop?purchase_idx=${ list.purchase_idx}'" style="cursor: pointer;">${ list.purchase_idx }</th>
                            <td>
	                            ${ userlist.get(list.user_idx) }
                            </td>
                            <td>${ list.purchase_statement }</td>
                            <td class="font-secondary">${ list.purchase_date }</td>
                        </tr>
                        </c:forEach>                        
                    </tbody>
                </table>
                
            </div>
            
            <!-- 페이지 표시기 -->
			
		    <div class="container row my-3 mx-auto">
		      <nav class="mx-auto">
		        <ul class="pagination justify-content-center ">
					<!-- 현재 페이지가 페이지표시기의 페이지 표시 수 보다 작으면 뒤로가기버튼 disable -->
		          <li class="page-item <c:if test="${ pages.currentPage <= 5 }">disabled</c:if>">
		            <a class="page-link" href="transaction?currentPage=${ pages.beginPagenation - 1}">&lang;</a>
		          </li>
				  <c:forEach var="page" begin="${ pages.beginPagenation }" end="${ pages.endPagenation }" step="1">
		          <li class="page-item <c:if test="${ pages.currentPage == page }">active</c:if>">
		            <a class="page-link" href="transaction?currentPage=${ page }">${ page }</a>
		          </li>
		          </c:forEach>
		          <!-- 마지막페이지까지 표시되면 앞으로 가기 표시 안됨 -->
		          <li class="page-item <c:if test="${ pages.countOfPages eq pages.endPagenation }">disabled</c:if>">
		            <a class="page-link" href="transaction?currentPage=${ pages.endPagenation+1}">&rang;</a>
		          </li>
		        </ul>
		      </nav>
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