<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문목록상세</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >


<c:import url="../header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative px-0" id="mainContainer" style="max-width: 520px; margin-top: 60px;">


        <!-- title container -->
        <div class="container-fluid d-flex flex-row mb-4 " style="height: 60px;">
            <!-- title -->
                <div class="col-12 my-4 py-2 text-start font-weight-bold text-black-50">
                  주문목록 상세조회 
                </div>
            </div>

        <!-- 구매상품 리스트 container -->
        <div class="container-fluid d-flex flex-column mb-4 border-bottom border-dark-50 pb-2">

            <!-- 구매일 -->
           <div class="d-flex font-primary justify-content-between text-black-50 mt-3" style="height: 40px;">
           	<span class="text-left">구매번호 - ${ purchase.purchase_idx }</span>
           	<span class="test-right">${ purchase.purchase_date }</span>
           </div> 

            <!-- 상품정보 반복-->
            <c:forEach var="cart" items="${ cartlist }">
            <div class="w-100 border-bottom border-dark-50 d-flex flex-row justifiy-content-start align-items-center py-1">
				
				
                <!-- thumbnail -->
                <div class="col-4">
                	<c:forEach var="goods" items="${ goodslist }">
                		<c:if test="${ cart.goods_idx == goods.goods_idx }">
                		<c:set var="thumb" value="${ goods.goods_thumb }" />
                		<c:set var="name" value="${ goods.goods_name }" />
                		</c:if>
                	</c:forEach>
                    <img class="img-fluid" src="${ thumb }" alt="">
                </div>
                <!-- 정보 -->
                <div class="col-8 d-flex flex-column text-left pl-0">
                    <div class="my-1">
                        ${ name }
                    </div>
                    <c:forEach var="options" items="${ optionlist }">
                    	<c:if test="${ cart.option_idx == options.option_idx }">
                   		<c:set var="option" value="${ options.option_name }+${ options.option_price }" />
                    	</c:if>
                    </c:forEach>
                    <div class="my-1">
                        ${ option }
                    </div>
                    <div class="my-1">
                        ${ cart.cart_total_price }
                    </div>
                </div>
                
            </div>
            <c:remove var="thumb"/>
                <c:remove var="name"/>
                <c:remove var="option"/>
                </c:forEach>
        </div>

        <!-- 구매자 or 수령인 정보표시 -->
        
        <div class="container-fluid d-flex flex-column mb-5 pb-2 form-group">
            
                <label class="row text-center w-100 ml-2 font-weight-bold" style="line-height: 38px;">
                    수 &numsp;&numsp; 령 &numsp;&numsp; 인
                    <input class="form-control-plaintext text-right col-7 mx-auto font-weight-normal" type="text" name="purchase_buyer_name" value="${ purchase.purchase_buyer_name }" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    연 &numsp;&numsp; 락 &numsp;&numsp;  처 
                    <input class="form-control-plaintext text-right col-7 mx-auto font-weight-normal" type="text" name="purchase_buyer_phone" value="${ purchase.purchase_buyer_phone }" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    주   &numsp;&numsp;&numsp;&numsp;&numsp;&numsp;  소 
                    <input class="form-control-plaintext text-right col-7 mx-auto font-weight-normal" type="text" name="purchase_buyer_address" value="${ purchase.purchase_buyer_address }" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50 mb-4" style="line-height: 38px;">
                    배 &numsp;송 &numsp;매 &numsp;모 
                    <input class="form-control-plaintext text-right col-7 mx-auto font-weight-normal" type="text" name="purchase_buyer_request" value="${ purchase.purchase_buyer_request }" readonly>
                </label>

                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    총 &numsp;결제 &numsp;금액 &numsp;&numsp;&numsp;&numsp;&numsp;
                    <input class="form-control-plaintext text-right col-5 mx-auto font-weight-normal" type="text" name="purchase_total_price" value="${ purchase.purchase_total_price }" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    &numsp;결제 &numsp;&numsp;수단 &numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
                    <input class="form-control-plaintext text-right col-5 mx-auto font-weight-normal" type="text" name="purchase_total_price" value="${ purchase.purchase_payment }" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    &numsp;현재 &numsp;&numsp;상태 &numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
                    <input class="form-control-plaintext text-right col-5 mx-auto font-weight-normal" type="text" name="purchase_statement" value="${ purchase.purchase_statement }" readonly>
                </label>
                <!-- 주문상태별 value값 정해야함. -->
                <select class="form-control col-6 mx-auto mt-3" name="purchase_statement" style="flex:none;">
                    <option value="#" selected>주문상태 변경</option>
                    <option value="주문접수">주문접수</option>
                    <option value="발송준비중">발송준비중</option>
                    <option value="배송중">배송중</option>
                    <option value="완료">완료</option>
                    <option value="반품신청">반품신청</option>
                    <option value="교환신청">교환신청</option>
                    
                    
                </select>
				<input type="hidden" id="purchase_idx" value="${ purchase.purchase_idx }">
                <!-- 버튼 그룹 -->
                <div class="w-100 d-flex flex-wrap flex-row justify-content-around mt-4" style="height: 125px;">
                    <button class="btn btn-outline-primary text-primary col-4 my-auto mx-1" id="교환접수" onclick="updateTransactionStatement(event)">교환접수</button>
                    <button class="btn btn-outline-primary text-primary col-4 my-auto mx-1" id="반품접수" onclick="updateTransactionStatement(event)">반품접수</button>
                    <button class="btn btn-outline-primary text-primary col-4 my-auto mx-1" id="주문취소" onclick="updateTransactionStatement(event)">주문취소</button>
                    <button class="btn btn-outline-primary text-primary col-4 my-auto mx-1" id="확인" onclick="updateTransactionStatement(event)">확인</button>
                </div>
            
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