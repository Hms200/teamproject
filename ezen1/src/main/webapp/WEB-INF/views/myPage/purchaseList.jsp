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
        <div class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0" id="mainContainer" style="max-width: 520px; margin-top: 60px; ">
		
		
		


       

		<!-- header -->
		<div
			class="container-fluid border-bottom container-sm d-flex flex-row mb-0"
			style="height: 60px;">
			<!-- 아이콘 -->
			<div class="col-1 my-3">
				<img src="/img/icon/뒤로가기 (2).png" alt=""
					class="mx-auto d-block  my-auto"
					style="width: 30px; height: 30px; cursor: pointer; "
					onclick="location.href='myPage'">
			</div>
			<!-- 헤더 텍스트 -->
			<div class="col-11 my-3 py-1 text-center text-bold">
				<div class="font-weight-bold pl-2 mb-2" style="font-size: 16px;">
					구매내역</div>
			</div>
		</div>
		<!-- 검색창 -->
		<div class="form-goup d-flex flex-row justify-content-between my-3 w-75 " >
			<div class="font-weight-bold mt-2">내 구매내역 보기</div>
			<%String user_id = request.getParameter("user_id"); %>
			<!-- 드롭다운 -->
			<div style="width: 120px; height: 40px;">
				<form name="progressForm" action="purchaseList"
					style="height: 40px;">
					<input type="hidden" name="user_id" value="<%=user_id%>">
					<select class="form-select mt-2" name="cat" aria-label="문의종류"
						onchange="submit();">
						<option value="null" selected>문의종류</option>
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
				class="w-100 d-flex flex-column border border-dark-50 py-1 my-2"
				style="height: 160px;">
				<form name="purchaseHistoryForm">
					<div class="w-100 d-flex flex-row justify-content-between mb-1"
						style="font-size: 12px;">
						<div class="ml-2">${list.get("PURCHASE_STATEMENT") }</div>
						<div class="mr-3">
						<fmt:formatDate value="${list.get('PURCHASE_DATE') }" dateStyle="default"/></div>
					</div>
					<div class="d-flex flex-row">
						<div col-3 class="ml-2">
							<img src="${list.get('GOODS_THUMB') }" alt="" class="img-thumbnail"
								width="100px">
						</div>
						<div class="col-9 mt-2" style="font-size: 14px;">
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
								<button type="submit" value="환불신청" class="p-0" name="AskRefund"
									style="font-size: 14px;"
									onclick="multiSubmit(formName='purchasehistoryForm', formAction='purchaseRefundAction')">환불신청</button>
								<button type="submit" value="교환신청" class="p-0" name="AskChange"
									style="font-size: 14px;"
									onclick="multiSubmit(formName='purchasehistoryForm', formAction='purchaseChangeAction')">교환신청</button>
								<button type="submit" value="취소신청" class="p-0" name="AskCancle"
									style="font-size: 14px;" style=" font-size: 14px;"
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