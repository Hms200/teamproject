<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>purchaseList</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/custom.css">

<style>
     
       button {
         border: none;
         background-color: white;
       }
        
      
    </style>

</head>
<body>
<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >

	<c:import url="../header.jsp"></c:import>

	<!-- container -->

	<!-- <div
		class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative"
		style="max-width: 520px;">--!>
		 <!-- main container -->
         <div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 mb-5" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">
				
	<!-- header 
		<div class="container-fluid d-flex flex-row mb-4 " style="height: 60px;">           
                <div class="col-12 my-4 py-2 text-start font-weight-bold text-black-50" style="font-size: 16px;">
                  구매내역 상세조회  
                </div>
        </div> -->
        
		<!-- 검색창 -->
		<div class="form-goup d-flex flex-row justify-content-between mt-5 mb-3 w-100 " >
			<div class="font-weight-bold mt-2 pl-3 text-black-50">내 구매내역 보기</div>
			<%String user_id = request.getParameter("user_id"); %>
			<!-- 드롭다운 -->
			<div style="width: 120px; height: 40px;">
				<form name="progressForm" action="purchaseList"
					style="height: 40px;">
					<input type="hidden" name="user_id" value="<%=user_id%>">
					<select class="form-select mt-2" name="cat" aria-label="문의종류"
						onchange="submit();">
						<option value="null" selected>주문상태</option>
						<option value="1">주문접수</option>
						<option value="2">상품준비중</option>
						<option value="3">배송준비중</option>
						<option value="4">배송중</option>
						<option value="5">배송완료</option>
						<option value="6">환불신청</option>
						<option value="7">교환신청</option>
						<option value="8">반품접수중</option>
					</select>
				</form>
			</div>
		</div>
		<!-- 카드 -->
		<c:forEach var="list" items="${purchaseList}">
			<div
				class="w-100 d-flex flex-column border border-dark-50 py-2 my-1"
				style="height: 170px;">
				<form name="purchaseHistoryForm">
					<div class="w-100 d-flex flex-row justify-content-between my-1 font-secondary">			
						<div class="ml-2">${list.get("PURCHASE_STATEMENT") }</div>
						<div class="mr-3">
						<fmt:formatDate value="${list.get('PURCHASE_DATE') }" dateStyle="default"/></div>
					</div>
					<div class="d-flex flex-row">
						<div col-3 class="ml-2">
							<img src="${list.get('GOODS_THUMB') }" alt="" class="img-thumbnail"
								width="100px">
						</div>
						<div class="col-9 mt-2 font-primary" >
							<div class="col-12 text-left pl-2">상품이름: &nbsp;  ${list.get("GOODS_NAME") } </div>
							<div class="col-12 text-left pl-2">구매번호:  &nbsp; ${list.get("PURCHASE_IDX") }</div>
							<div class="col-12 text-left pl-2 position-relative">
								<span>가격:  &nbsp;
								<fmt:formatNumber value='${list.get("GOODS_PRICE")}' groupingUsed="true" type="currency" />
								</span> 
								<a href="reviewpopup?goods_idx=${list.get('GOODS_IDX')}&user_idx=${list.get('USER_IDX')}" 
								style="right: 0%; position: absolute" class="text-dark">리뷰작성</a>
							</div>
							<div
								class="col-12 border rounded d-flex flex-row justify-content-between form-control my-3 ">
								<button type="submit" value="환불신청" class="p-0 font-primary" name="AskRefund"
									
									onclick="multiSubmit(formName='purchasehistoryForm', formAction='purchaseRefundAction')">환불신청</button>
								<button type="submit" value="교환신청" class="p-0 font-primary" name="AskChange"
									
									onclick="multiSubmit(formName='purchasehistoryForm', formAction='purchaseChangeAction')">교환신청</button>
								<button type="submit" value="취소신청" class="p-0  font-primary" name="AskCancle"
								
									onclick="multiSubmit(formName='purchasehistoryForm', formAction='purchaseCancleAction')">취소신청</button>
								<input type="hidden" name="purchase_idx" value="${list.get('PURCHASE_IDX') }" >
							</div>
						</div>
					</div>
				</form>
			</div>
		</c:forEach>
	</div>

	<c:import url="../footer.jsp"></c:import>
	<c:import url="../nav.jsp"></c:import>
	</div>
	<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
	<script src="/js/main.js"></script>
</body>
</html>