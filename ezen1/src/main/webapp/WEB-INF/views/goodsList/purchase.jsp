<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

  <div
    class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative"
    style="max-width: 520px; margin-top: 60px;">
    <div class="container-sm container-fluid d-flex flex-row mb-0 px-0 border-bottom purchaseListTopBox ">
      <div class="col-2 my-3">
        <a href="goodsList"><img src="/img/icon/left.png" alt="" class="mx-auto d-block my-auto img-fluid" width="30px"
            height="30px"></a>
      </div>
      <div class="col-10 my-3 py-1 pr-5 text-center font-weight-bold">
        주문/결제
      </div>
    </div>
    <!--장바구니 내용-->
    <!-- 전체선택/선택삭제 -->
    <div class="container-fluid d-flex felx-row justify-content-between mx-3 my-3 w-100 border-bottom"
      style="width: 330px; height: 40px;">
      <div class="ml-3">
        <input type="checkbox" value="selectAll" class="ml-0" onclick="selectAll(this)"
          style="width: 16px; height: 16px;"><label for="selectAll" class="ml-2" style="font-size: 14px;">전체선택</label>
      </div>
      <div style="font-size: 13px;">
        <input type="button" value="선택삭제">
      </div>
    </div>
    <!-- 상품내용 -->
    <div class="container d-flex flex-column py-1 px-3 mb-4 border-bottom">
      <div class="row mt-4 mx-3">
        <input type="checkbox" value="name" class="ml-2" style="width: 16px; height: 16px;"><label for="name"
          class="ml-1" style="font-size: 14px;">네이쳐 소이캔들</label>
      </div>
      <div class="d-flex flex-row justify-content-around">
        <img src="/img/goods/candle/Candle01_01.jpeg" alt="" class="img-fluid ml-3" width="100px" height="100px">
        <div class="d-flex flex-column" style="width: 200px;height: 100px;">
          <div>
            가격:
          </div>
          <div>
            옵션:
          </div>
          <div class="d-flex flex-row justify-content-between">
            옵션(수량,크기) <input type="button" class="btn-block mt-1" value="옵션변경"
              style="width: 60px;height: 20px; font-size: 11px;">
          </div>
          <div class="d-flex flex-row justify-content-between">
            <select class="form-select text-center" aria-label="Default select example" style="width: 140px;">
              <option selected>----</option>
              <option>선물포장+1000</option>
            </select>
            <select class="form-select text-center" aria-label="Default select example"
              style="width: 60px; font-size: 12px;">
              <option selected>갯수</option>
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
    <!-- 배송지 정보 -->
    <div class="container d-flex flex-column ">
      <span class="font-weight-bold" style="font-size: 16px;">
        배송지 정보
      </span>
      <span style="font-size: 12px;">
        홍길동 010-0000-0000
      </span>
      <span style="font-size: 12px;">
        서울 노원구
      </span>
      <span style="font-size: 12px;">
        아파트 1동1호
      </span>
      <span style="width: 320px; height: 35px;">
        <select class="form-select w-100" aria-label="Default select example" style="font-size: 14px;">
          <option selected>배송시 요청사항</option>
          <option value="1">문앞에 두고가주세요</option>
          <option value="2">부재시 경비실에 맡겨주세요</option>
        </select>
      </span>
      <!-- 주소 변경하기 -->
      <div class="d-flex flex-row justify-content-end" style=" margin-bottom: 20px">
        <span onclick="popupHideAndShow('changeAddress')" style="font-size: 12px; padding: 5px; cursor: pointer;">
          주소 변경하기<img src="/img/icon/down.png" alt="" class="img-fluid" style="width: 12px;height: 12px;">
        </span>
      </div>
    </div>
    <!-- 주소 변경하기 배송시 요청사항 -->
    <div class="d-none mb-5" id="changeAddress">
      <form action="userUpdateFormInner
      PayFormPageAction">
      <div class="w-100 d-flex flex-column align-self-between border-top border"
        style="padding: 50px 30px; height: 300px;">
        <div class="d-flex flex-row justify-content-between">
          <span style="font-size: 12px;">수령인</span>
          <input type="text" placeholder="내용을 입력해주세요" style="width: 200px; height: 20px; font-size: 12px;">
        </div>
        <div class="d-flex flex-row justify-content-between">
          <span style="font-size: 12px;">휴대폰</span>
          <input type="text" placeholder="내용을 입력해주세요" style="width: 200px; height: 20px; font-size: 12px;">
        </div>
        <div class="address">
          <div class="d-flex flex-row justify-content-between">
            <span style="font-size: 12px;">주소</span>
            <div>
              <input type="text" placeholder="우편주소" style="width: 130px; height: 20px; font-size: 12px;"><button
                style="width: 70px; height: 20px; font-size: 11px;">주소찾기</button>
            </div>
          </div>
          <div class="d-flex flex-row justify-content-end">
            <input type="text" placeholder="주소" style="width: 200px; height: 20px; font-size: 12px;">
          </div>
          <div class="d-flex flex-row justify-content-end">
            <input type="text" placeholder="상세주소" style="width: 200px; height: 20px; font-size: 12px;">
          </div>
        </div>
        <div class="d-flex flex-row justify-content-center mt-3">
          <span style="width: 320px; height: 35px;">
            <select class="form-select w-100" aria-label="Default select example">
              <option selected>배송시 요청사항</option>
              <option value="1">문앞에 두고가주세요</option>
              <option value="2">부재시 경비실에 맡겨주세요</option>
            </select>
          </span>
        </div>
        <button class="btn btn-primary">저장</button>
      </div>
    </form>
    </div>
    <div class="d-flex flex-row justify-content-between w-100 font-weight-bold border-top border-bottom py-4 px-3 purchaseListTotalPriceBox" 
      style="font-size: 16px">
      <span>총결제금액</span>
      <span>가격</span>
    </div>
    <hr>
    <div class="d-flex flex-column w-100 border-bottom" style="padding: 50px 20px; font-size: 12px;">
      <div class="d-flex flex-row justify-content-between w-100">
        <span>상품금액</span>
        <span>가격</span>
      </div>
      <div class="d-flex flex-row justify-content-between">
        <span>배송비</span>
        <span>가격</span>
      </div>
    </div>
    <div class="w-75 d-flex flex-column my-5 purchaseListPay">
      <span class="font-weight-bold text-center " style="font-size: 16px;">
        결제방법
      </span>
      <div class="d-flex flex-row justify-content-between">
        <div class="d-flex flex-column align-items-center">
          <input type="radio" class="btn-check my-4" name="options" id="option1" autocomplete="off" checked>
          <label class="btn btn-primary" for="option1">카드결제</label>
        </div>
        <div class="d-flex flex-row justify-content-between">
          <div class="d-flex flex-column align-items-center">
            <input type="radio" class="btn-check my-4" name="options" id="option2" autocomplete="off">
            <label class="btn btn-primary" for="option2">무통장결제</label>
          </div>
        </div>
      </div>
      <div class="w-100 font-weight-bold text-center"
        style="width: 300px; height: 40px; margin-top: 30px; margin-bottom: 50px; font-size: 16xp;">
        <span><button class="btn btn-primary" onclick=" popupHideAndShow('pwCheckPop')" style="width: 300px; height: 40px;">결제하기</button></span>
      </div>
      <!-- 비밀번호 확인 팝업창 -->
      <!--ajax으로 처리-->
      <div class="d-none" id="pwCheckPop">
      <div class="border bg-white" style="width: 450px; height: auto;">
        <div class="d-flex justify-content-end">
          <img src="/img/icon/cross.png" alt="" onclick="popupHideAndShow('pwCheckPop')" style="cursor: pointer;" width="30px" height="30px">
        </div>
        <div class="mx-auto text-center font-weight-bold my-5 purchaseListPop" style="width: 300px; height: 60px;">
          개인정보 보호를 위해<br>
          비밀번호를 다시 입력해주세요
        </div>
        <div class="mx-auto purchaseListPopInput mb-2 py-1 px-2"
          style="font-size: 14px; ">
          <input type="text" placeholder="비밀번호를 입력해주세요" class="text-center text-dark w-100 border border-dark-50"
            style="border-radius: 6px;">
        </div>
        <div class="d-flex flex-row justify-content-center my-5">
          <button class="btn btn-dark" style="width: 140px; height: 40px; border-radius: 6px;">확인</button>
        </div>
      </div>
    </div>
    </div>
  </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
  <script>
    function selectAll(selectAll) {
      const checkboxes
        = document.querySelectorAll('input[type="checkbox"]');

      checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked
      })
    }
  </script>
</body>
</html>