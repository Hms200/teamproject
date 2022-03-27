// popup hide & show   
function popupHideAndShow(target) {
    const targetWindow = document.getElementById(String(target));
    if(targetWindow.classList.contains("d-none")){
        targetWindow.classList.add("d-block");
        targetWindow.classList.remove("d-none");
    }else if(targetWindow.classList.contains("d-block")){
        targetWindow.classList.add("d-none");
        targetWindow.classList.remove("d-block");
    }
};

// 최상위로 스크롤
 function scrollToTop(){
    	const target = document.getElementById('mainContainer');
    	target.scrollIntoView({behavior: "smooth"});
}


// 장바구니 벳지 장바구니가 0이면 숨기기

window.onload = bedgeHideAndShow();

function bedgeHideAndShow() {
    const bedge = document.getElementById('bedge');
    let bedgeNumber = document.getElementById('bedgeNumber').innerText;
    if(bedgeNumber == '0' || bedgeNumber == '' || bedgeNumber == null){
        bedge.classList.remove("d-block");
        bedge.classList.add("d-none");

    }else{
        bedge.classList.add("d-block");
        bedge.classList.remove("d-none");
    } 
};

// null checker
function nullChecker(){
    const target = document.getElementsByClassName('nullcheck');

    for(i=0; i<target.length; i++){
        if(target[i].value == ''){
            alert(target[i].placeholder);
            target[i].focus();
            return false;
        }else if(target[i].type == 'checkbox' && target[i].checked == false){
            alert('채크사항을 확인 해 주세요');
            return false;
        }
    }
    return true;
};

// multi submit form
function multiSubmit(formName, formAction, onsubmit){
    const targetForm = document.getElementsByName(String(formName));
    targetForm[0].action = formAction;
    if(onsubmit != null){
        targetForm[0].onsubmit = String(onsubmit);
        targetForm[0].submit();
    }else{
    targetForm[0].submit();
    }
};


// 상품리스트 노출
function setGoodsList(_type) {
    const types = document.querySelectorAll("div .goodsList div");
    types.forEach(function (type) {
      type.classList.remove('on');
    });
    document.querySelector("div .goodsList div." + _type).classList.add("on");

    const container = document.querySelector("main")
    container.classList.remove('candle');
    container.classList.remove('warmer');
    container.classList.remove('diffuser');
    container.classList.remove('soap');
    container.classList.add(_type);
    
    $('.valcandle,.valwarmer,.valsoap,.valdiffuser').css('display','none');
    if(container.classList.contains('candle')){
        let target = document.getElementsByClassName('valcandle');
        for(let item of target){
			item.style.display='block';
		};
    }else if(container.classList.contains('warmer')){
		let target = document.getElementsByClassName('valwarmer');
        for(let item of target){
			item.style.display='block';
		};
	}else if(container.classList.contains('soap')){
		let target = document.getElementsByClassName('valsoap');
        for(let item of target){
			item.style.display='block';
		};
	}else if(container.classList.contains('diffuser')){
		let target = document.getElementsByClassName('valdiffuser');
        for(let item of target){
			item.style.display='block';
		};
	}
  }

// 모든 체크박스 체크
function checkAll() {
//모든 체크박스를 checked 되게 한다.
let checkboxArray = document.getElementsByName('agree');
for(let cbx of checkboxArray) {
    cbx.checked = true;
    }
}

// kakao 주소 api
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            let addr = ''; // 주소 변수
            let extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
};

// checkbox value int 형으로 바꾸기 체크되어있으면 1 체크해제시 0]
function changeValueOfCheckbox(){

	let checkbox = document.getElementsByClassName('checkbox');
	for(i=0; i<checkbox.length; i++){
	if(checkbox[i].value == 'on'){
		checkbox[i].value = 1;
		}else {
			checkbox[i].value = 0;
		}
	}
	return true;
}

//id 중복체크 
function idCheck() {
	const user_id = $('#user_id').val();
	if(!user_id){
		alert("아이디 중복체크 후 회원가입이 가능합니다");
		return false;
		}
	
	// 아이디 유효성 검사(1보다 같거나 크면 중복 / 0 이면 중복안됨)
	$.ajax(
			{
				url: 'http://localhost:8085/login/idCheckAjax?user_id='+ user_id,	
	    		type: 'get',
	    		success: function(data) {
	    			console.log('통신 성공, data:' + data);
	    			
	    			let data_num = Number( data );
	    			if( data_num >= 1 ) {
	    				//아이디가 중복됨.
	    				alert("중복된 아이디입니다.");
						$('#isIDChecked').val('no');
						$('#user_id').val('');
						$('#user_id').focus();
	    			}else{
	    				//아이디가 중복 안됨. 사용 가능.
	    				alert("사용가능한 아이디입니다.");
						$('#isIDChecked').val('ok');
	    			}    			
	    		},
	    		error: function(){
	    			console.log('통신 실패');
	    		}	
			}    		
	);
 }

//비밀번호 일치 여부확인 
function pwCheck() {
	const user_pw = $('#user_pw').val();
	if(!user_pw){
		alert("비밀번호 중복체크 후 회원가입이 가능합니다");
		return false;
		}
	if( $('#user_pw').val() == $('#user_pw_check').val() ){
		alert("비밀번호가 일치합니다");
		$('#isPWChecked').val('ok');
	}else {
		alert("비밀번호가 다릅니다.");
		$('#isPWChecked').val('no');
		$('#user_pw_check').val('');
		$('#user_pw_check').focus();
	}
	
}

// 회원가입페이지 모든 체크사항 체크
function joinCheckAll(){
    	
		const isIDChecked = $('#isIDChecked').val();
		const isPWChecked = $('#isPWChecked').val();			
		const userNull = nullChecker();
		
		if( isIDChecked == 'no'){
			alert("아이디 중복확인 후 회원가입이 가능합니다.");
			return false;
		}
		if(isPWChecked == 'no') {
			alert("비밀번호 일치여부 후 회원가입이 가능합니다.");
			return false;
		}
		if( userNull == false) {
			return false;
		}
		
		const address1 = $('#sample6_address').val();
		const address2 = $('#sample6_detailAddress').val();
		$('#user_address').val( address1 + " " + address2 ); 
		
		document.forms[0].submit();
		
	}	
/* thumbnail 이미지 등록 */

function uploadThumbnail(){
	const thumb = document.getElementsByName('uploadthumb')[0].files[0];
	const formData = new FormData();
	formData.append("file", thumb);

	jQuery.ajax({
		url: "uploadGoodsThumbAction",
		type: "POST",
		processData: false,
		contentType: false,
		data: formData,
		success: function(result){
			if(result == false){
			alert('등록에 실패하였습니다.');
			thumb = null;
		}
		console.log('파일등록 성공 :' +result);
		document.getElementsByName('goods_thumb')[0].value = result;
		}
	})
};

/* 상세이미지 등록 */
 
 function uploadDetail(){
	const detail = document.getElementsByName('uploadGoodsDetail')[0].files[0];
	const formData = new FormData();
	formData.append("file", detail);

	jQuery.ajax({
		url: "uploadGoodsDetailAction",
		type: "POST",
		processData: false,
		contentType: false,
		data: formData,
		success: function(result){
			if(result == false){
				alert('등록에 실패하였습니다.');
				detail = null;
			}
			console.log('파일등록 성공 : '+result);
			document.getElementsByName('goods_detail')[0].value = result;
		},
	})
};

// 상품등록

function registerGoods(){
	const form = document.querySelectorAll('form[name="productRegisterForm"] > div > input, select');
	let formData = {};
	for(i=0; i<form.length; i++){
		formData[form[i].name] = form[i].value;
	}
	formData = JSON.stringify(formData);
	console.log(formData);
	console.log('파일등록 폼 전송 시도');
	jQuery.ajax({
		url: "productRegisterAction",
		type: "POST",
		contentType: "application/json",
		processData: false,
		data: formData,
		success: function(result){
			if(result == false){
				alert('등록에 실패하였습니다.');
				return false;
			}
			console.log('등록 성공 goods_idx = '+result);
			document.getElementsByName('goods_idx')[0].value = result;
			multiSubmit(formName = 'goodsimgs', formAction = 'uploadGoodsIMGSAction');
		},
		error: function(){return false},
	})
	
};


// 상품상세페이지 상품문의글 작성 전 로그인여부 체크
function checkLogin(){
	
	const userIdx = document.getElementsByName('user_idx')[1].value;
	if(userIdx == '0' || userIdx == 0 || userIdx == null || userIdx == ''){
		alert('로그인해주세요.');
		location.href = '../login/login';
	}else{
		return true;
	}
}

// 장바구니 개별상품 최종가격 산정
function totalPrice (event){
	const optionInput = event.target.id;
	let optionPrice = document.getElementsByName(optionInput)[0].value;
	let optionIdx = document.getElementsByName(optionInput)[1].value;
	const originalGoodsPrice = document.getElementsByName('goods_price')[0].value;
	let total_Price = document.getElementsByName('goods_total_price')[0];
	let optionIdxForm = document.getElementsByName('option_idx')[0];
	
	total_Price.value = Number(optionPrice) + Number(originalGoodsPrice);
	optionIdxForm.value = optionIdx;
	
	let optionText = event.target.innerText;
	let optionTitle = document.querySelector("#dropdownMenuButton");
	optionTitle.innerText = optionText.toString();
	
}

// 	장바구니에 상품담기
function addCart(){
	// useridx
	const userIdx = document.getElementsByName('user_idx')[0].value;
	const goodsIdx = document.getElementsByName('goods_idx')[0].value;
	const optionIdx = document.getElementsByName('option_idx')[0].value;
	const totalPrice = document.getElementsByName('goods_total_price')[0].value;
	const bedge = document.getElementById('bedgeNumber');
	const btnClicked = event.target.id;
	
	if(userIdx == 0){
		alert('로그인하신 후 이용할 수 있습니다.');
		location.href='../login/login';
	}else{
	
		let formData = {};
		
		formData["user_idx"] = userIdx;
		formData["goods_idx"] = goodsIdx;
		formData["option_idx"] = optionIdx;
		formData["cart_amount"] = 1;
		formData["cart_total_price"] = totalPrice;
		formData["cart_isdone"] = 0;
		
		formData = JSON.stringify(formData);
		
		jQuery.ajax({
			url: "toShoppingCartAction",
			type: "POST",
			contentType: "application/json",
			processData: false,
			async: false,
			data: formData,
			success: function(num){
				if(btnClicked === 'justAdd'){
				alert('장바구니에 담겼습니다.');
				bedge.innerText = Number(num);
				
				bedgeHideAndShow();
				location.reload;
				}else{
					location.href = '../goodsList/cart';
				}
			},
			error: function(e){
				console.log(e);
				alert('처리에 실패하였습니다. 다시 시도해 주세요');
			},
		});
	}
}
	
// 장바구니 옵션/수량 변경
function changeValue(event){
	const targetCartIdx = event.target.id;
	const values = document.getElementsByName(targetCartIdx);
	// [0] : cart_idx
	// [1] : goods_price
	// [2] : cart_total_price
	// [3] : option_idx
	// [4] : cart_amount
	
	let formData = {};
	formData["cart_idx"] = values[0].value;
	formData["option_idx"] = values[3].value;
	formData["cart_amount"] = values[4].value;
	formData["original_price"] = values[1].value;
	
	formData = JSON.stringify(formData);
	console.log(formData.toString());
	jQuery.ajax({
		url: "changeValueAction",
		type: "POST",
		contentType: "application/json",
		processData: false,
		async: false,
		data: formData,
		success: function(){
			alert('변경되었습니다.');
			location.href='cart'
		},
		error: function(e){
			console.log(e);
			alert('처리에 실패하였습니다. 다시 시도해 주세요');
		},
	});
	
}
// 장바구니 삭제
function removeGoodsInCart(){
	const listOfCheckbox = document.querySelectorAll("input[type='checkbox']");
	let formData = {}
	
	for(i=1; i<listOfCheckbox.length; i++){
		formData[listOfCheckbox[i].name] = listOfCheckbox[i].checked;
	}
	
	let indicator = 0;
	for(i=1; i<listOfCheckbox.length; i++){
		if(formData[listOfCheckbox[i].name]  == false){
			indicator ++;
		}
	}
	if(indicator == listOfCheckbox.length -1){
		return alert('선택된 상품이 없습니다.');
	}
	
	formData = JSON.stringify(formData);
	console.log(formData);
	
	jQuery.ajax({
		url: "removeGoodsFromCartAction",
		type: "POST",
		contentType: "application/json",
		processData: false,
		async: false,
		data: formData,
		success: function(){
			alert('삭제되었습니다.');
			bedgeHideAndShow();
			location.href='cart'
		},
		error: function(e){
			console.log(e);
			alert('처리에 실패하였습니다. 다시 시도해 주세요');
		},
	});
}
// 장바구니 개별항목 리스트로 묶기
function listingGoods(){
	const checkboxes = document.querySelectorAll("input[type='checkbox']");
	let targetCartIdx = {};
	for(i=1; i<checkboxes.length; i++){
		
		targetCartIdx[checkboxes[i].name] = checkboxes[i].checked;
		
	}
	
	let indicator = 0;
	for(i=1; i<checkboxes.length; i++){
		if(targetCartIdx[checkboxes[i].name]  == false){
			indicator ++;
		}
	}
	if(indicator == checkboxes.length -1){
		return alert('선택된 상품이 없습니다.');
	}
	
	console.log(typeof(targetCartIdx));
	targetCartIdx = JSON.stringify(targetCartIdx);
	console.log(targetCartIdx);
	jQuery.ajax({
		url: "listingGoodsAction",
		type: "POST",
		contentType: "application/json",
		processData: false,
		async: false,
		data: targetCartIdx,
		success: function(result){
			console.log('listing완료 cart_list_idx =' + result);
		//	document.getElementsByName('cart_list_idx')[0].value = result;
			location.href = 'purchase?cart_list_idx='+result;
		},
		error: function(e){
			console.log(e);
		},
	});
}
// 구매패이지 수령인정보 변경
function changeBuyerInfo(){
	const newName = document.getElementById('adjustBuyerName').value;
	const newPhone = document.getElementById('adjustBuyerPhone').value;
	const newPostCode = document.getElementById('sample6_postcode').value;
	const newAddressHead = document.getElementById('sample6_address').value;
	const newAddressTail = document.getElementById('sample6_detailAddress').value;
	let newFullAddress = newPostCode.toString() + newAddressHead.toString() + newAddressTail.toString();
	
	console.log(newName);
	console.log(newPhone);
	console.log(newFullAddress);
	
	const nameAndPhoneArea = document.getElementById('nameAndPhone');
	const addressArea = document.getElementById('originalAddress');
	const hiddenInputForName = document.getElementsByName('purchase_buyer_name')[0];
	const hiddenInputForPhone = document.getElementsByName('purchase_buyer_phone')[0];
	const hiddenInputForAddress = document.getElementsByName('purchase_buyer_address')[0];
	
	nameAndPhoneArea.innerHTML = newName + "<br>" + newPhone;
	addressArea.innerText = newFullAddress;
	hiddenInputForName.value = newName;
	hiddenInputForPhone.value = newPhone;
	hiddenInputForAddress.value = newFullAddress;
	
	popupHideAndShow('changeAddress');
	
}
// 가격계산
function calculateTotalPrice(){
	const priceValues = document.getElementsByClassName('price');
	let totalPriceofGoods = 0;
	for(i=0 ; i<priceValues.length; i++){
		totalPriceofGoods += Number(priceValues[i].value);
	}
	const areaOfTotalPrice = document.getElementById('total_price');
	areaOfTotalPrice.innerText = totalPriceofGoods;
	
	const shippingPrice = Number(document.getElementById('shipping_price').innerText);
	const finalPrice = document.getElementById('final_price');
	finalPrice.innerText = Number(totalPriceofGoods) + shippingPrice;
	document.getElementsByName('cart_total_price')[0].value = Number(totalPriceofGoods) + shippingPrice;
}
// 구매페이지 비밀번호 확인
function checkPw(){
	const inputtedPw = document.getElementById('inputtedPw').value;
	if(inputtedPw == null || inputtedPw === ''){
		alert('비밀번호를 입력해주세요');
		return false;
	}
	let data = { "inputtedPw": inputtedPw};
	data = JSON.stringify(data);
	console.log(data.toString());
	jQuery.ajax({
		url: "checkPwAction",
		type: "POST",
		contentType: "application/json",
		processData: false,
		async: false,
		data: data,
		success: function(result){
			if(result !== 'true'){
				alert('비밀번호를 재확인 해주세요');
				inputtedPw = '';
				}else{
					
					if($('input[name=purchase_buyer_payment]:checked').val() == 'bootpay'){
						console.log('결제 프로세스 진행');
						bootpay();						
					}else{
						alert("주문이 접수되었습니다. 무통장 전용계좌로 입금 확인후 익일 상품이 출고됩니다.");
						makingPurchase();
					}
				}
		},
		error: function(e){
			console.log(e);
		},
	});
}
// 결재완료 후 db 처리(구매기록 저장)를 위한 데이터 전송
function makingPurchase(){
	const cartListIdx = document.getElementsByName('cart_list_idx')[0].value;
	const userIdx = document.getElementsByName('user_idx')[0].value;
	const totalPrice = document.getElementsByName('cart_total_price')[0].value;
	const buyerName = document.getElementsByName('purchase_buyer_name')[0].value;
	const buyerPhone = document.getElementsByName('purchase_buyer_phone')[0].value;
	const buyerAddress = document.getElementsByName('purchase_buyer_address')[0].value;
	const payment = function(){
						const radios = document.querySelectorAll("input[type='radio']");
						const value = radios[0].checked ? radios[0].value : radios[1].value;
						return value;
					};
	const buyerRequest = document.getElementsByName('purchase_buyer_request')[0].value;
	
	let formData = {};
	
	formData.cart_list_idx = cartListIdx;
	formData.user_idx = userIdx;
	formData.purchase_total_price = totalPrice;
	formData.purchase_buyer_name = buyerName;
	formData.purchase_buyer_phone = buyerPhone;
	formData.purchase_buyer_address = buyerAddress;
	formData.purchase_payment = payment();
	formData.purchase_buyer_request = buyerRequest;
	
	formData = JSON.stringify(formData);
	console.log(formData);
	
	jQuery.ajax({
		url: "makePurchaseAction",
		type: "POST",
		contentType: "application/json",
		processData: false,
		async: false,
		data: formData,
		success: function(result){
			console.log('구매프로세스 완료');
			document.getElementById('bedgeNumber').innerText = Number(result);
			bedgeHideAndShow()
			// mypage 구매기록 페이지로 보내기.
			location.href = '../myPage/purchaseList';
		},
		error: function(e){
			console.log(e);
		},
	})
}

// admin transActionPop 주문상태변경
function updateTransactionStatement(event){
	const targetId = event.target.id;
	const selectValue = document.getElementsByName('purchase_statement')[1].value;
	const purchaseIdx = document.getElementById('purchase_idx').value;
	console.log(targetId);
	let data = {};
	
	if(targetId == '확인'){
		if(selectValue == '#'){
			location.href = 'transaction';
		}else{
			data.purchase_idx = purchaseIdx;
			data.purchase_statement = selectValue;
			data = JSON.stringify(data);
			console.log(data);
			jQuery.ajax({
				url: "changeStatementAction",
				type: "POST",
				contentType: "application/json",
				processData: false,
				async: false,
				data: data,
				success: function(result){
					console.log(result);
					alert(result);
					location.href = 'transactionpop?purchase_idx='+purchaseIdx;
				},
				error: function(e){
					console.log(e);
				},
			});
		}
	}else{
		data.purchase_idx = purchaseIdx;
		data.purchase_statement = targetId;
		data = JSON.stringify(data);
		console.log(data);
		jQuery.ajax({
			url: "changeStatementAction",
			type: "POST",
			contentType: "application/json",
			processData: false,
			async: false,
			data: data,
			success: function(result){
				console.log(result);
				alert(result);
				location.href = 'transactionpop?purchase_idx='+purchaseIdx;
			},
			error: function(e){
				console.log(e);
			},
		});
	}
	
}

// admin.review 리뷰답글달기
function registReviewReply(){
	const replyContents = document.getElementsByName('review_reply')[0].value;
	const reviewIdx = document.getElementById('targetIdx').value;
	
	let formData = {};
	formData.review_idx = reviewIdx;
	formData.review_reply = replyContents;
	formData = JSON.stringify(formData);
	console.log(formData);
	jQuery.ajax({
			url: "registReviewReplyAction",
			type: "POST",
			contentType: "application/json",
			processData: false,
			async: false,
			data: formData,
			success: function(result){
				console.log(result);
				alert(result);
				popupHideAndShow('reviewReplyWriteForm');
			},
			error: function(e){
				console.log(e);
			},
		});
}

// admin.qnaList 질문답글달기
function registerQuestionReply(){
	const replyContents = document.getElementsByName('question_reply')[0].value;
	const questionIdx = document.getElementById('targetIdx').value;
	const mode = document.getElementById('mode').value;
	
	let formData = {};
	formData.question_idx = questionIdx;
	formData.question_reply = replyContents;
	formData = JSON.stringify(formData);
	console.log(formData);
	if(mode == 'Qna'){
		jQuery.ajax({
				url: "registerQuestionReplyAction",
				type: "POST",
				contentType: "application/json",
				processData: false,
				async: false,
				data: formData,
				success: function(result){
					console.log(result);
					alert(result);
					popupHideAndShow('qna_reply_popup');
				},
				error: function(e){
					console.log(e);
					alert('등록에 실패하였습니다. 다시 시도해주세요');
				},
			});
		}else{
			jQuery.ajax({
				url: "registerOneToOneReplyAction",
				type: "POST",
				contentType: "application/json",
				processData: false,
				async: false,
				data: formData,
				success: function(result){
					console.log(result);
					alert(result);
					popupHideAndShow('qna_reply_popup');
				},
				error: function(e){
					console.log(e);
					alert('등록에 실패하였습니다. 다시 시도해주세요');
				},
			});
		}
}
// 리뷰등록
 function reviewContentAction() {
		  const form = document.querySelectorAll('form[name="reviewWriteForm"] > div > input, select, textarea');
		  let formData = {};
		  for(i=0; i<form.length; i++){
				formData[form[i].name] = form[i].value;
		  }
		  formData = JSON.stringify(formData);
		  console.log(formData);
		  console.log('리뷰 폼 전송 시도');
		  jQuery.ajax({
				url: "reviewWriteAction",
				type: "POST",
				contentType: "application/json",
				processData: false,
				data: formData,
				success: function(result){
					if(result == false){
						alert('등록에 실패하였습니다.');
						return false;
					}
					console.log('등록 성공 review_idx ='+result);
					document.getElementsByName('review_idx')[0].value = result;
					multiSubmit(formName = 'reviewImg', formAction = 'uploadReviewImgAction');
				},
				error: function(){return false},
			})
	  };
	  
 
// admin/stock	상품품절처리

function makeGoodsSoldOut(){
	const form = document.forms[2].elements;
	let formData = {};
	for(i=0 ; i<form.length; i++){
		formData[form[i].name] = form[i].checked;
	}
	formData = JSON.stringify(formData);
	console.log(formData.toString())
	jQuery.ajax({
		url: "inventorySoldOutAction",
		type: "POST",
		contentType: "application/json",
		processData: false,
		async: false,
		data: formData,
		success: function(){
			alert('품절처리되었습니다.');
			for(i=0; i<form.length; i++){
				form[i].checked = false;
			}
		},
		error: function(e){
			console.log(e);
			alert('처리에 실패하였습니다. 다시 시도해 주세요');
		},
	});
}

// admin/stock 상품발주처리

function orderGoods(){
	let amount = prompt('발주 수량을 입력해 주세요.');
	while(true){
		if(amount == null || amount == 0 || amount < 0){
			amount = prompt('발주 수량을 입력해 주세요');
		}else{
			break;
		}
	}
	const form = document.forms[2].elements;
	let formData = {};
	for(i=0 ; i<form.length; i++){
		formData[form[i].name] = form[i].checked;
	}
	formData.amount = amount;
	formData = JSON.stringify(formData);
	console.log(formData.toString())
	jQuery.ajax({
		url: "inventoryOrderAction",
		type: "POST",
		contentType: "application/json",
		processData: false,
		async: false,
		data: formData,
		success: function(){
			alert('발주처리되었습니다. 상태를 판매중으로 변경합니다.');
			for(i=0; i<form.length; i++){
				form[i].checked = false;
			}
		},
		error: function(e){
			console.log(e);
			alert('처리에 실패하였습니다. 다시 시도해 주세요');
		},
	});
	
}