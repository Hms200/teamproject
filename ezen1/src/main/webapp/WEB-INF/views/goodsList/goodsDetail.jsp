<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${ goods.goods_name }</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

<div
    class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative"
    style="max-width: 520px; margin-top: 60px">
    <!--상품 상단 뒤로가기 버튼 &&현재 페이지 내용-->
    <div class="container-sm container-fluid d-flex flex-row mb-0 px-0">
      <div class="col-2 my-3">
        <a href="goodsList"><img src="/img/icon/left.png" alt="" class="mx-auto d-block my-auto img-fluid"
            width="30px" height="30px"></a>
      </div>
      <div class="col-10 my-3 py-1 pr-5 text-center font-weight-bold">
        상품상세정보
      </div>
    </div>
    <!--상품 상세보기 이미지-->
    <c:if test="${ goodsImgs.size() != 0 }">
    <div id="carouselImg" class="carousel slide mx-0 px-0" data-ride="carousel" style="width: 360px;">
        <ol class="carousel-indicators">
        <li data-target="#carouselImg" data-slide-to="0" class="active"></li>
        <li data-target="#carouselImg" data-slide-to="1"></li>
        <li data-target="#carouselImg" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="${ goodsImgs.get(0) }" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="${ goodsImgs.get(1) }" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="${ goodsImgs.get(2) }" class="d-block w-100" alt="...">
        </div>
        </div>
    </div>
    </c:if>
    <c:if test="${ goodsImgs.size() == 0 }">
    <div class=" mx-0 px-0">
      <img src="${goods.goods_thumb}" alt="" class="img-fluid" width="360px" height="240px">
    </div>
    </c:if>
    <!--상품 상세보기 타이틀-->
    <div class="my-3 font-weight-bold text-center" style="font-size: 18px;">
    ${goods.goods_name}
    <input type="hidden" name="goods_idx" value="${ goods.goods_idx }">
    <input type="hidden" name="user_idx" value="${ user_idx }">
      <!--부모클래스bg-primary 안넣었음 -->
    </div>
    <!--상품 상세보기 옵션 드롭다운-->
    <div class="col-12 d-flex flex-row justify-content-between w-75 mx-4" style="font-size: 14px;">
      <div class="clo-6 py-2"> 
        상품 옵션
      </div>
      <div class="col-6 dropdown border ">
        <button class="col-12 btn dropdown-toggle goodsDetailOption" type="button" id="dropdownMenuButton" data-toggle="dropdown"
          aria-expanded="false" style="font-size: 14px;">
          옵션
        </button>
        
        <div class="dropdown-menu goodsDeatailMenu" aria-labelledby="dropdownMenuButton">
          <c:forEach var="option" items="${ goodsOptions }"> 
          <button class="dropdown-item" id="${ option.option_idx }" type="button" style="font-size: 14px;" onclick="totalPrice(event);">${ option.option_name }+${ option.option_price }</button>
          <input type="hidden" name="${ option.option_idx }" value="${ option.option_price }">
          <input type="hidden" name="${ option.option_idx }" value="${ option.option_idx }">
 		  </c:forEach>     
        </div>
        <input type="hidden" name="option_idx" value="">
        
      </div>
    </div>
    <!--판매가격-->
    <div class="mx-2 my-2 d-flex flex-row justify-content-between w-75" style="font-size: 14px;">
      <div class="col-3" style="font-size: 14px;">
        판매가 
      </div>
      <input type="hidden" name="goods_price" value="${ goods.goods_price }">
      <div class="col-4" style="font-size: 14px;">
      <input type="text" class="form-control-plaintext" name="goods_total_price" value="">
      <%-- <fmt:formatNumber value="${goods.goods_price}" type="number" /> --%>
      </div>
    </div>
    <div class="w-100 bg-primary goodsDetailDivisionLine">
      <!--bg-dark-50-->
    </div>
    <!--상품정보 리뷰 문의/안내 네브-->
    <nav class="w-100">
      <div
        class="navMenu d-flex flex-row justify-content-around mb-2 mt-1 font-weight-bold border-bottom w-100 text-center"
        style="height: 45px;">
        <div class="col-4 info on" onclick="setMenu('info')">상품 정보</div>
        <div class="col-4 review" onclick="setMenu('review')">리뷰</div>
        <div class="col-4 inquiry" onclick="setMenu('inquiry')">문의/안내</div>
      </div>
    </nav>


    <!--해당 페이지 네브 선택된 화면만 보여지기-->
    <main class="info">
      <div class="dep _info">
        <div class="d-block text-center mx-5 my-4">
          <img src="${goods.goods_detail}" alt="" class="img-fluid">
          <!--구매하기버튼/장바구니 아이콘-->
          <div class="col-12 my-2">
            <!--장바구니 버튼을 누르면 장바구니 페이지로 이동하고 장바구니에 해당상품 페이지에 보고있던 상품이 추가된다-->
            <img src="/img/icon/장바구니_큰아이콘.png" class="goodsDetailCartIcon"
              onclick="addCart();" style="width: 40px; height: 40px;">
            <!--구매하기 버튼을 누르면 구매 페이지로 이동하고 구매페이지에서 해당상품 페이지에 보고있던 상품이 추가된다-->
            <button type="submit" class="btn btn-primary goodsDeatailPurchaseButton" onclick="location.href='purchaseList?goodsname={}' ">구매하기</button>
          </div>
        </div>
      </div>
      <!--해당네브:리뷰-->
      <div class="dep _review ">
        <div class="d-flex flex-row flex-wrap mx-4 mt-5">
        <c:forEach var = "dto" items="${reviewList}">
          <div class="px-3 border">
            <!--날짜 div-->
            <div class="text-right" style="font-size: 8px;">
              ${dto.review_date}
            </div>
            <!--이미지 div-->
            <div class="goodsDetailReviewImgBox" style="height: 150px;">
              <img src="/img/goods/candle/Candle01_01.jpeg" class="img-fluid" alt="" style="width: 150px;">
            </div>
            <!--별점div-->
            <div style="font-size: 8px;">
              ${dto.review_star}
            </div>
            <!--이름div-->
            <div class="font-weight-bold mb-2" style="font-size: 14px;">
              ${name}
            </div>
          </div>
          </c:forEach>
        </div>
      </div>
      <!--해당네브:문의/안내-->
      <!--아코디언 제목-->
      <div class="dep _inquiry">
        <div class="py-3 mb-4">
          <div class="accordion accordionGoodsDetail" id="accordionExample">
            <div class="card">
              <div class="card-header cardHeaderGoodsDetail" id="headingOne">
                <h2 class="mb-0">
                  <button class="btn btn-block text-left d-flex flex-row justify-content-between mb-3" type="button"
                    data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"
                    style="font-size: 14px;">
                    <span>제목</span><img src="/img/icon/down.png" alt="" class="img-fluid"
                      style="width: 25px; height: 25px;">
                  </button>
                </h2>
              </div>
              <!--아코디언 내용-->
              <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample"
                style="font-size: 14px;">
                <div class="card-body">
                  2022-01-01<br>
                  문의내용
                </div>
              </div>
            </div>
          </div>
          <!--상품 문의하기 버튼-->
          <div class="container w-100 my-5 d-flex justify-content-center">
            <button type="button" class="btn btn-primary" onclick="popupHideAndShow('goodDetailInquiryPop')">
              상품 문의하기
            </button>
          </div> 
        </div>
      </div>
    </main>
    <!--상품문의 작성팝업-->
    <div class="d-none" id="goodDetailInquiryPop">
      <div class="d-flex flex-column border bg-white mx-auto goodsDetailInquiryPop">
        <!--X아이콘-->
        <div class="d-flex justify-content-end goodsDetailCrossIconBox">
          <img src="/img/icon/cross.png" alt="" class="goodsDetailCrossIconImg"
            onclick="popupHideAndShow('goodDetailInquiryPop')" style="width:30px; height: 30px;">
        </div>
        <div class="goodsDetailInquiryPopBox1 mr-3 mb-4 ml-3">
          <div class="text-center font-weight-bold text-dark goodsDetailInquiryPopBox2" style="font-size: 16px;">
            상품문의
          </div>
          <form action="productQnaWriteAction" method="post" name="productQnaWriteForm">
          <%
          Date date = new Date();
          %>
            <p class="text-right text-black-50 d-block goodsDetailInquiryPopDate" name="question_date" style="font-size: 12px">
              <%=date%></p>
            <div class="d-block mb-1">
              <input type="text" placeholder="상품 문의 제목을 입력해주세요." class="border w-100 text-dark py-1 px-3 goodsDetailInquiryPopTitle" name="question_title"
                style="font-size: 14px; ">
            </div>
            <div class="d-block">
              <input type="textarea" placeholder="상품문의 내용을 입력해주세요." class="border w-100 text-dark py-1 px-3 mb-4 goodsDetailInquiryPopContent"
                name="question_contents"
                style="font-size: 14px;">
            </div>
            <!--자동으로 받음-->
            <input type="hidden" name="user_id" value="${ user_id }">
            <input type="hidden" name="goods_name" value="${ goods.goods_name }">
            <!--input button 에서 button- button으로 변경-->
            <button type="button" class="btn btn-secondary text-dark goodsDetailInquiryPopCancle" onclick="popupHideAndShow('goodDetailInquiryPop')">취소 </button>
            <button class="btn text-light ml-2 goodsDetailInquiryPopSubmit">문의하기</button>
          </form>
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
      function setMenu(_type) {
        var types = document.querySelectorAll("div .navMenu div");
        types.forEach(function (type) {
          type.classList.remove('on');
        });
        document.querySelector("div .navMenu div." + _type).classList.add("on");
        document.querySelector("main").className = _type;
      };
      
      let total_Price = document.getElementsByName('goods_total_price')[0];
      total_Price.value = document.getElementsByName('goods_price')[0].value;
    </script>
</body>
</html>