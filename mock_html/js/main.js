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

