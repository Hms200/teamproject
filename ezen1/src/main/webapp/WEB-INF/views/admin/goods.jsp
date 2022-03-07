<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="../header.jsp"></c:import>

<!-- container -->
  <div
    class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative mb-2"
    style="max-width: 520px; margin-top: 70px;">
    
    
    
    <div class="d-flex flex-column bg-white border border-dark-50 rounded col-12"
      style="height: auto;">
      <form action="productRegisterAction" class="w-100" id="productRegisterForm" name="productRegisterForm" method="post">
      <p class="text-center font-weight-bold text-dark mt-3" style="font-size: 16px;">
        상품등록
      </p>
      <div class="d-flex felx-row justify-content-around mb-3 form-group">
        <span class="font-weight-bold text-dark" style="font-size: 14px;">상품이름</span>
        <input type="text" id="goods_name" name="goods_name" class="nullcheck form-control col-7" placeholder="상품이름을 입력해주세요" style="font-size: 14px;">
        
      </div>
      <div class="d-flex felx-row justify-content-around mb-3 form-group">
        <span class="font-weight-bold text-dark" style="font-size: 14px;">정품가격</span>
        <input type="text" id="goods_price" name="goods_price" class="nullcheck form-control col-7" placeholder="상품가격을 입력해주세요" style="font-size: 14px;">
      </div>
      <div class="d-flex felx-row justify-content-around mb-3 form-group">
        <span class="font-weight-bold text-dark" style="font-size: 14px;">판매수량</span>
        <input type="text" id="goods_stock" name="goods_stock" class="nullcheck form-control col-7" placeholder="상품수량을 입력해주세요" style="font-size: 14px;">
      </div>
      <div class="d-flex felx-row justify-content-between form-group mx-4 mb-4">
        <span class="font-weight-bold" style="font-size: 14px;">카테고리 선택</span>
        <select class="text-dark form-control col-6" name="goods_cat" id="goods_cat" style="font-size: 14px;">
          <option selected>카테고리 선택</option>
          <option value="캔들">캔들</option>
          <option value="캔들워머">캔들워머</option>
          <option value="디퓨저">디퓨저</option>
          <option value="비누">비누</option>
        </select>
      </div>
      <div class="d-none">
      <input type="hidden" id="goods_thumb" name="goods_thumb" value="">
      <input type="hidden" id="goods_detail" name="goods_detail" value="">
      <input type="hidden" id="goods_onsale" name="goods_onsale" value="1">
      </div>
      </form>
      
      
      <!-- 파일등록폼과 분리 -->
      <div class="d-flex felx-row justify-content-start ml-4 mb-3">
        <span class="font-weight-bold text-dark" style="font-size: 14px;">이미지</span>
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>썸네일</span>
        <input type="file" id="thumbimg" name="uploadthumb" accept="image/*" style="display: none" oninput="uploadThumbnail();"/>
        <label for="thumbimg" class="btn btn-primary border pb-4"
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      
      
      <form name="goodsimgs" method="post" enctype="multipart/form-data">
      <div class="d-none">
   		<input type="hidden" name="goods_idx" value="">
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>1번파일</span>
        <input type="file" name="img1" id="img1" accept="image/*" style="display:none;" />
        <label for="img1" class="btn btn-primary border pb-4"
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>2번파일</span>
        <input type="file" name="img2" id="img2"accept="image/*" style="display:none;" />
        <label for="img2" class="btn btn-primary border pb-4 "
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>3번파일</span>
        <input type="file" name="img3" id="img3" accept="image/*" style="display:none;" />
        <label for="img3" class="btn btn-primary border pb-4"
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      </form>
      
      
      <div class="d-flex flex-row justify-content-between mx-4 mb-2" style="font-size: 14px;">
        <span>상세파일</span>
        <input type="file" id="detailimg" name="uploadGoodsDetail"style="display:none;" accept="image/*"  oninput="uploadDetail();" />
        <label for="detailimg" class="btn btn-primary border pb-4"
          style="width: 76px; height: 27px; font-size: 12px;">파일선택</label>
      </div>
      <div class="d-flex flex-row justify-content-between my-3">
          <button type="button" class="btn btn-dark text-light ml-3 col-5" style="height: 40px; border-radius: 6px;" onclick="location.href='admin/main'">취소</button>
          <button type="button" class="btn btn-primary text-light mr-3 col-5" style="height: 40px; border-radius: 6px;" onclick="registerGoods();">확인</button>
      </div>
    </div>
  
  </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
<script type="text/javascript">
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
		dataType: "json",
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

</script>
</body>
</html>