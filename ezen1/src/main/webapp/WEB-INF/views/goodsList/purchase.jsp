<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="623567172701800021f67cee" name="bootpay-application-id" />
    <title>구매</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>
<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >

<c:import url="../header.jsp"></c:import>

  <div
    class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative" id="mainContainer"
    style="max-width: 520px; margin-top: 60px;">
    
    <!-- title container -->
    <div class="container-fluid d-flex flex-row mb-4 " style="height: 60px;">
       <!-- title -->
       <div class="col-12 my-4 py-2 text-start font-weight-bold text-black-50" >
                  주문 / 결제 
       </div>
    </div>

    <!-- 상품내용 -->
    <c:forEach var="cart" items="${ cartlist }" varStatus="status">
    <div class="container d-flex flex-column py-1 px-3 mb-2 border-bottom">
      <div class="row my-2 mx-3">
          <c:set var="goods" value="${ goodslist.get(status.index) }" scope="page"/>
          <span id="goods_name">${ goods.goods_name }</span>
      </div>
      <div class="d-flex flex-row justify-content-between mb-3">
	        <a href="goodsDetail?goods_idx=${ goods.goods_idx }"><img src="${ goods.goods_thumb }" alt="Thumbnail of ${ goods.goods_name }" class="img-fluid ml-3" width="100px" height="100px"></a>
	        <div class="d-flex flex-column" style="width: 200px; height: 100px;">
		          <div class="d-flex flex-row justify-content-around my-auto">
		            <span class="py-2" style="width: max-contents;">가격</span>
		            <input type="text" class="form-control-plaintext text-right col-6 price py-2" id="goods_price" readonly value="${ cart.cart_total_price }">
		          </div>
		         <div class="d-flex flex-row justify-content-around my-auto">
		            <span>옵션</span>
		            <span><c:set var="this_cart_option" value="${ cart.option_idx }" scope="page"/>
		            <c:forEach var="option" items="${ optionlist }">
		            	<c:if test="${ this_cart_option eq option.option_idx }">${ option.option_name }+${ option.option_price }</c:if>
		            </c:forEach> 
		          <c:remove var="goods" scope="page"/>  
		            </span>
		        </div>
	       </div>
	      </div>
      </div>
      <c:remove var="goods" scope="page"/>
      </c:forEach>
      
      
  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative" style="max-width: 520px; ">
      
    <!-- 배송지 정보 -->
    <div class="container d-flex flex-column mt-3">
      <span class="font-weight-bold mb-3">
        배송지 정보
      </span>
      <span id="nameAndPhone">
        ${ userinfo.user_name } <br>
        ${ userinfo.user_phone }
       </span>
        <input type="hidden" name="purchase_buyer_name" value="${ userinfo.user_name }">
        <input type="hidden" name="purchase_buyer_phone" value="${ userinfo.user_phone }">
      
      <span class="mt-1 mb-3" id="originalAddress">
        ${ userinfo.user_address }
      </span>
      <input type="hidden" name="purchase_buyer_address" value="${ userinfo.user_address }">
        <select class="form-select form-control w-100 font-primary " name="purchase_buyer_request" >
          <option selected>배송시 요청사항</option>
          <option value="문앞에 두고가주세요">문앞에 두고가주세요</option>
          <option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
        </select>
      
      <!-- 주소 변경하기 -->
      <div class="d-flex flex-row justify-content-end mt-2 mb-4">
        <span onclick="popupHideAndShow('changeAddress')" style="padding: 5px; cursor: pointer;">
          주소 변경하기<img src="/img/icon/down.png" alt="" class="img-fluid" style="width: 12px; height: 12px;">
        </span>
      </div>
    </div>
    <!-- 주소 변경하기 배송시 요청사항 -->
    <div class="d-none mb-5 w-100" id="changeAddress">
      <div class="w-100 d-flex flex-column align-self-between border-top border" style="padding: 50px 30px;">
        <div class="d-flex flex-row justify-content-between form-group">
          <span class="col-4">수령인</span>
          <input class="form-control col-8" id="adjustBuyerName" type="text" placeholder="수령인을 입력해주세요">
        </div>
        <div class="d-flex flex-row justify-content-between form-group">
          <span class="col-4">휴대폰</span>
          <input class="form-control col-8" id="adjustBuyerPhone" type="text" placeholder="휴대폰번호를 입력해주세요">
        </div>
        <div class="address">
          <div class="d-flex flex-row justify-content-between">
            <span class="col-4">주소</span>
            <div class="form-group w-95 row mx-0">
              <input class="form-control col-9" type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편주소">
              <button class="btn btn-primary col-3 px-0 font-secondary" style="height: 38px; text-align: center; line-height: 24px;" onclick="sample6_execDaumPostcode();">주소찾기</button>
            </div>
          </div>
          <div class="d-flex flex-row justify-content-end form-group">
            <input class="form-control col-8" type="text" name="sample6_address" id="sample6_address" placeholder="주소" style="width: 200px;">
          </div>
          <div class="d-flex flex-row justify-content-end form-group">
            <input class="form-control col-8" type="text" placeholder="상세주소" name="sample6_detailAddress" id="sample6_detailAddress" style="width: 200px;">
          </div>
          <input type="hidden" class="inputStyle1" id="sample6_extraAddress" placeholder="참고항목">
        </div>
        <button class="btn btn-primary" type="button" onclick="changeBuyerInfo();">저장</button>
      </div>
    </div>
    
    <div class="d-flex flex-column w-100 border-bottom mt-2 pb-2">
      <div class="d-flex flex-row justify-content-between w-100 mb-2">
        <span>상품금액</span>
        <span id="total_price"></span>
      </div>
      <div class="d-flex flex-row justify-content-between my-2">
        <span>배송비</span>
        <span id="shipping_price">2500</span>
      </div>
    </div>
    <div class="d-flex flex-row justify-content-between w-100 font-weight-bold border-top border-bottom py-4 px-3" style="height: 85px;">
      <span>총결제금액</span>
      <span id="final_price"></span>
      <input type="hidden" name="cart_total_price" value="">
    </div>
    <hr>
    
    <div class="w-75 d-flex flex-column my-3">
      <span class="font-weight-bold text-center" >
        결제수단 선택 
      </span>
      
      <div class="form-group custom-radio mt-3">
        <div>
          	<input type="radio" class="custom-control-input my-3" name="purchase_buyer_payment" id="option1" value="bootpay" checked >
          		<label class="custom-control-label"  for="option1">온라인 결제<br><small>(카드 결제,가상계좌 결제, 휴대폰 결제 <br> 카카오페이, 네이버페이, 페이코)</small></label>          	
        </div>
        
        <div class="form-group custom-radio mt-3">
          <div>
            <input type="radio" class="custom-control-input my-3" name="purchase_buyer_payment" id="option2" value="무통장결제" >
            	<label class="custom-control-label"  for="option2">오프라인 직접 결제<br><small>(무통장결제)</small></label>          
          </div>
        </div>
        
        
        <!-- <input type="button" class="btn btn-primary" id="cardA" value="카드" onclick="$('#purchase_buyer_payment').val('카드');">
		<input type="button" class="btn btn-primary" id="cardB" value="무통장결제" onclick="$('#purchase_buyer_payment').val('무통장결제');">
		<input type="hidden" name="purchase_buyer_payment"  id="purchase_buyer_payment" value="카드" > -->      
      </div>
      
      <input type="hidden" name="user_idx" value="${ user_idx }">
      <input type="hidden" name="cart_list_idx" value="${ cartlistidx }">
      <div class="w-100 font-weight-bold text-center" style="width: 300px; height: 40px; margin-top: 30px; margin-bottom: 50px; ">
        <span><button class="btn btn-primary col-12" onclick=" popupHideAndShow('pwCheckPop')" style=" height: 40px;">결제하기</button></span>
      </div>
      <!-- 비밀번호 확인 팝업창 -->
      <div class="d-none col-12 position-absolute" id="pwCheckPop" style="left: 0; bottom: 100px;">
      <div class="border bg-white" >
        <div class="d-flex justify-content-end">
          <img src="/img/icon/cross.png" alt="" onclick="popupHideAndShow('pwCheckPop')" style="cursor: pointer;" width="30px" height="30px">
        </div>
        <div class="mx-auto text-center font-weight-bold my-5 " style="width: 300px; height: 60px;">
          개인정보 보호를 위해<br>
          비밀번호를 다시 입력해주세요
        </div>
        <div class="mx-auto mb-2 py-1 px-2 font-primary " style="width: 300px; height: 40px;">
          <input type="password" id="inputtedPw" placeholder="비밀번호를 입력해주세요" class="text-center text-dark w-100 border border-dark-50 form-control rounded">
        </div>
        <div class="d-flex flex-row justify-content-center my-5">
          <button class="btn btn-dark rounded" style="width: 140px; height: 40px;" onclick="checkPw();">확인</button>
        </div>
      </div>
    </div>
    </div>
  </div>
</div>
    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>
</div>
<!-- 카카오 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
<script>
window.onloade = calculateTotalPrice();
</script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>
<script>

   //아이템 통계data startTrace()
	$(document).ready(function() {
	 var list = [];
		<c:set var = "count" value="${goodslist.size()}"/>
		<c:forEach var ='i' begin='0' end='${count-1}'>
			var ele = {};
			ele.item_name = '${goodslist[i].goods_name}';
			ele.unique = '${goodslist[i].goods_idx}';
			ele.price = '${goodslist[i].goods_price}';
			ele.cat1 = '${goodslist[i].goods_cat}';
			list.push(ele);
		</c:forEach>
	  console.log(list);
	  BootPay.startTrace({
	    items: list
	  });
	});
   
	//고유아이디(영수증에 나오는고유번호) 생성
	function guid() {
	function s4() {
  	return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
	}
	return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
	};
	
	//부트페이 화면연동
	function bootpay(){	
	//구매 itemList 배열로 미리생성
	var statsList = [];
	<c:set var = "count" value="${goodslist.size()}"/>
	<c:forEach var ='i' begin='0' end='${count-1}'>
		var itemList = {};
		itemList.item_name = '${goodslist[i].goods_name}';
		itemList.unique = '${goodslist[i].goods_idx}';
		itemList.qty = '${cartlist[i].cart_amount}';
		itemList.price = '${goodslist[i].goods_price}';
		itemList.cat1 = '${goodslist[i].goods_cat}';
		statsList.push(itemList);
	</c:forEach>
	
	//data 변수선언
	const goods_price = $('span[id=final_price]').text();
	const nameCount = $('span[id=goods_name]').length - 1 ;
	let goods_name = $('span[id=goods_name]')[0].textContent
	const goods_count = '${carlist[0].cart_amount}';
	const goods_idx = "${goodslist[0].goods_idx}";
	const user_name = "${userinfo.user_name}";
	const user_email = "${userinfo.user_email}";
	const user_address = "${userinfo.user_address}";
	const user_phone = "${userinfo.user_phone}";
	//물건이 1개이상일경우 맨처음 물건이름출력 외 (초과된 수) 개 
	if(nameCount > 0 ){
		goods_name +=  " "+"외" + nameCount +"개";
	};
	
	//pg사 연동 화면
	BootPay.request({
 		price: goods_price, //실제 결제되는 가격
 		application_id: "623567172701800021f67cee",//부트페이 회원가입후 고유아이디 복사
 		name: goods_name, //결제창에서 보여질 이름
 		pg: 'nicepay',
 		method: '', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
 		show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
 		items : statsList,
 		user_info: {
 			username: user_name,
 			email: user_email,
 			addr: user_address,
 			phone: user_phone
 		},
 		order_id: guid(), //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
 	}).error(function (data) {
 		//결제 진행시 에러가 발생하면 수행됩니다.
 		console.log(data);
 		location.reload();
 	}).cancel(function (data) {
 		//결제가 취소되면 수행됩니다.
 		console.log(data);
 		location.reload();
 	}).ready(function (data) {
 		// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
 		console.log(data);
 		alert("발급된 가상계좌는 "+data+" 입니다. 다시 확인이 어려우니 메모해주세요");
 	}).confirm(function (data) {
 		//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
 		//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
 		console.log(data);
 		var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
 		if (enable) {
 			BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
 		} else {
 			BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
 		}
 	}).close(function (data) {
 	    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
 	    console.log(data);
 	}).done(function (data) {
 		//결제가 정상적으로 완료되면 수행됩니다
 		//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
 		console.log(data);
 		makingPurchase();
 	});
  };
 </script>
</body>
</html>