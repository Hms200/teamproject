<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

<!--상품 상단 뒤로가기 버튼 &&현재 페이지 내용-->
  <div
    class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative"
    style="max-width: 520px;">
    <div class="container-sm container-fluid d-flex flex-row mb-0 px-0 border-bottom cartTopdivBox">
      <div class="col-2 my-3">
        <a href="goodsList"><img src="/img/icon/left.png" alt="" class="mx-auto d-block my-auto img-fluid"
          width="30px" height="30px"></a>
      </div>
      <div class="col-10 my-3 py-1 pr-5 text-center font-weight-bold">
        장바구니
      </div>
    </div>
    <!--장바구니 내용-->
    <!-- jsp파일로 만들때 서버에서 내려온값을 jstl로 eq cart가 !null null로 화면구분  -->
    <!-- 전체선택/선택삭제 -->
    <main class="w-100">
    <div class="container-fluid d-flex felx-row justify-content-between mx-3 my-3 w-100 border-bottom cartSelectAllBox">
      <div class="ml-3">
        <input type="checkbox" value="selectAll" class="ml-0" id="checkAll" onclick="selectAll(this)" style="width: 16px; height: 16px;"><label for="selectAll"
          class="ml-2" style="font-size: 14px;">전체선택</label>
      </div>
      <!--서버에서 처리-->
      <div style="font-size: 13px;">
        <input type="button" value="선택삭제">
      </div>
    </div>
    <!-- 상품내용 -->
    <div class="container d-flex flex-column py-1 px-3 mb-4 border-bottom">
      <form name="shoppingCartForm" action="" method="post"  onsubmit="return nullChecker();">
      <div class="row mt-4 mx-3 mb-3" style="font-size: 14px;">
        <input type="hidden" name="cart_idx">
        <input type="checkbox" name="IsGoodsCheck" class="mx-2 nullcheck" style="width: 16px; height: 16px;">
        <div name="goods_name">네이쳐 소이캔들</div>
      </div>
      <div class="d-flex flex-row justify-content-around">
        <img src="/img/goods/candle/Candle01_01.jpeg" alt="" class="img-fluid mx-3" width="100px"
          height="100px">
        <div class="d-flex flex-column cartGoodsInfo">
          <div>
            가격:
          </div>
          <div>
            옵션:
          </div>
          <div class="d-flex flex-row justify-content-between">
            옵션(수량,크기) 
            <!-- 서버에서 처리 -->
            <input type="button" class="btn-block mt-1" value="옵션변경"
              style="width: 60px;height: 20px; font-size: 11px;">
          </div>
          <div class="d-flex flex-row justify-content-between">
            <select class="form-select text-center" aria-label="Default select example" style="width: 140px;">
              <option selected name="option_name">----</option>
              <option>선물포장+1000</option>
            </select>
            <select class="form-select text-center" aria-label="Default select example"
              style="width: 60px; font-size: 12px;">
              <option selected name="cart_amount">갯수</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
            </select>
          </div>
        </div>
      </div>
      <div class="d-flex flex-row justify-content-between mx-2 mt-5" style="font-size: 14px;">
        <div>
          상품금액
        </div>
        <div>
          가격
        </div>
      </div>
      <div class="d-flex flex-row justify-content-between mx-2 mb-3" style="font-size: 14px;">
        <div>
          배송비
        </div>
        <div>
          가격
        </div>
      </div>
    </div>
    <div class="container d-flex flex-row justify-content-between my-4 mx-0 w-100 font-weight-bold"
      style="font-size: 16px;">
      <div class="">
        총 결제 금액
      </div>
      <div class="">
        <input type="hidden" name="cart_total_price" value="{}">
        가격
      </div>
    </div>
    <div class="font-weight-bold w-100 mt-5 text-center cartOrderButtonBox" style="font-size: 16xp;">
      <button type="submit" class="btn btn-primary" style="width: 300px; height: 40px;">주문하기</button>
      </div>
  </form>
  </main>
    <!--장바구니 비어있는-->
    <div class="d-flex justify-content-center mb-0">
      <img src="/img/icon/bag.png" alt="" class="img-fluid " width="300px" height="300px">
    </div>
    <div class="font-weight-bold mb-5" style="font-size: 26px;">
      장바구니가 비었습니다.
    </div>
    <div class="d-flex flex-row justify-content-center mb-5 w-100 cartGoToGoodsList">
      <a href="goodsList"><input type="button" class="btn btn-primary" value="상품보러가기" style="border-radius: 20px;"></a>
    </div>
  </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
    <!-- 전체선택 -->
  <script>
    function selectAll(selectAll)  {
  const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
  })
}
  </script>
</body>
</html>