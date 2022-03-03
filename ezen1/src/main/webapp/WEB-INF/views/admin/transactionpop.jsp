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

<c:import url="../header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative px-0" style="max-width: 520px;">


        <!-- title container -->
        <div class="container-fluid d-flex flex-row mb-4 border-bottom border-dark-50" style="height: 60px;">
            <!-- title back btn -->
                <div class="col-1 my-3" onclick="location.href='admin'" style="cursor: pointer;">
                    <img src="/img/icon/뒤로가기 (2).png" alt="뒤로가기">
                </div>
            <!-- title -->
                <div class="col-11 my-3 py-1 text-center font-weight-bold" style="font-size: 16px;">
                    주문목록
                </div>
            </div>

        <!-- 구매상품 리스트 container -->
        <div class="container-fluid d-flex flex-column mb-4 border-bottom border-dark-50 pb-2">

            <!-- 구매일 -->
            <div class="w-100 text-right" style="font-size: 14px; height: 40px;">
                2022-02-11
            </div>
            <!-- 구매번호 -->
            <div class="w-100 text-left border-bottom border-dark-50" style="font-size: 14px; height: 40px;">
                구매번호 - 0000001
            </div>

            <!-- 상품정보 반복-->
            <div class="w-100 border-bottom border-dark-50 d-flex flex-row justifiy-content-start align-items-center py-1">

                <!-- thumbnail -->
                <div class="col-4">
                    <img class="img-fluid" src="/img/goods/candle/Candle01_01.jpeg" alt="">
                </div>
                <!-- 정보 -->
                <div class="col-8 d-flex flex-column text-left">
                    <div class="my-1">
                        이름
                    </div>
                    <div class="my-1">
                        옵션
                    </div>
                    <div class="my-1">
                        가격
                    </div>

                </div>
            </div>
            <div class="w-100 border-bottom border-dark-50 d-flex flex-row justifiy-content-start align-items-center py-1">
                <!-- thumbnail -->
                <div class="col-4">
                    <img class="img-fluid" src="/img/goods/candle/Candle01_01.jpeg" alt="">
                </div>
                <!-- 정보 -->
                <div class="col-8 d-flex flex-column text-left">
                    <div class="my-1">
                        이름
                    </div>
                    <div class="my-1">
                        옵션
                    </div>
                    <div class="my-1">
                        가격
                    </div>

                </div>
            </div>
            <div class="w-100 border-bottom border-dark-50 d-flex flex-row justifiy-content-start align-items-center py-1">
                <!-- thumbnail -->
                <div class="col-4">
                    <img class="img-fluid" src="/img/goods/candle/Candle01_01.jpeg" alt="">
                </div>
                <!-- 정보 -->
                <div class="col-8 d-flex flex-column text-left">
                    <div class="my-1">
                        이름
                    </div>
                    <div class="my-1">
                        옵션
                    </div>
                    <div class="my-1">
                        가격
                    </div>

                </div>
            </div>
        </div>

        <!-- 구매자 or 수령인 정보표시 -->
        
        <div class="container-fluid d-flex flex-column mb-4  pb-2 form-group">
            <form name="transactionDetailForm" method="get">
                <label class="row text-center w-100 ml-2 font-weight-bold" style="line-height: 38px;">
                    수 &numsp;&numsp; 령 &numsp;&numsp; 인
                    <input class="form-control-plaintext text-right col-7 mx-auto font-weight-normal" type="text" name="purchase_buyer_name" value="수령인" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    연 &numsp;&numsp; 락 &numsp;&numsp;  처 
                    <input class="form-control-plaintext text-right col-7 mx-auto font-weight-normal" type="text" name="purchase_buyer_phone" value="010-0000-0000" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    주   &numsp;&numsp;&numsp;&numsp;&numsp;&numsp;  소 
                    <input class="form-control-plaintext text-right col-7 mx-auto font-weight-normal" type="text" name="purchase_buyer_address" value="경기도 의정부시" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50 mb-4" style="line-height: 38px;">
                    배 &numsp;송 &numsp;매 &numsp;모 
                    <input class="form-control-plaintext text-right col-7 mx-auto font-weight-normal" type="text" name="purchase_buyer_request" value="문 앞에 두고 가 주세요" readonly>
                </label>

                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    총 &numsp;결제 &numsp;금액 &numsp;&numsp;&numsp;&numsp;&numsp;
                    <input class="form-control-plaintext text-right col-5 mx-auto font-weight-normal" type="text" name="purchase_total_price" value="12,000" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    &numsp;결제 &numsp;&numsp;수단 &numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
                    <input class="form-control-plaintext text-right col-5 mx-auto font-weight-normal" type="text" name="purchase_total_price" value="카드" readonly>
                </label>
                <label class="row text-center w-100 ml-2 font-weight-bold text-dark-50" style="line-height: 38px;">
                    &numsp;현재 &numsp;&numsp;상태 &numsp;&numsp;&numsp;&numsp;&numsp;&numsp;
                    <input class="form-control-plaintext text-right col-5 mx-auto font-weight-normal" type="text" name="purchase_statement" value="배송 준비중" readonly>
                </label>
                <!-- 주문상태별 value값 정해야함. -->
                <select class="form-control col-6 mx-auto" name="purchase_statement">
                    <option value="#" selected>주문상태 변경</option>
                    <option value="">주문접수</option>
                    <option value="">발송준비중</option>
                    <option value="">배송중</option>
                    <option value="">완료</option>
                </select>

                <!-- 버튼 그룹 -->
                <div class="w-100 d-flex flex-wrap flex-row justify-content-around mt-4" style="height: 125px;">
                    <button class="btn btn-secondary col-5 my-auto" onclick="multiSubmit(formName = 'transactionDetailForm', formAction = 'transactionExchangeAction')">교환접수</button>
                    <button class="btn btn-secondary col-5 my-auto" onclick="multiSubmit(formName = 'transactionDetailForm', formAction = 'transactionRefundAction')">반품접수</button>
                    <button class="btn btn-secondary col-5 my-auto" onclick="multiSubmit(formName = 'transactionDetailForm', formActio = 'transactionCancleAction')">주문취소</button>
                    <button class="btn btn-secondary col-5 my-auto" onclick="multiSubmit(formName = 'transactionDetailForm', formAction = 'transactionDetailUpdateAction')">확인</button>
                </div>
            </form>
        </div>

    </div>

    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>