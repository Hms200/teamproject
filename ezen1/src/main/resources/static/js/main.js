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

// 장바구니 벳지 장바구니가 0이면 숨기기
///로딩시.  ajax통신으로 실시간 반영될 경우 ajax 코드에서 해당 함수 호출되게 만들것.
window.onload(bedgeHideAndShow());
function bedgeHideAndShow() {
    const bedge = document.getElementById('bedge');
    const bedgeNumber = document.getElementById('bedgeNumber').innerText;
    if(bedgeNumber == '0'){
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
    var types = document.querySelectorAll("div .goodsList div");
    types.forEach(function (type) {
      type.classList.remove('on');
    });
    document.querySelector("div .goodsList div." + _type).classList.add("on");

    document.querySelector("main").className = _type;
  }

// 모든 체크박스 체크
function checkAll() {
//모든 체크박스를 checked 되게 한다.
var checkboxArray = document.getElementsByName('agree');
for(var cbx of checkboxArray) {
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
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

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
