// popup hide & show   
function popupHideAndShow(target) {
    const searchBar = document.getElementById(String(target));
    if(searchBar.classList.contains("d-none")){
        searchBar.classList.add("d-block");
        searchBar.classList.remove("d-none");
    }else if(searchBar.classList.contains("d-block")){
        searchBar.classList.add("d-none");
        searchBar.classList.remove("d-block");
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

