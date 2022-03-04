<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
	<script>
	//ajax으로 서버와 통신한다.
    // ajax 용도 : 화면 갱신(reload,redirect)가 없이
	//            부분화면 갱신(통신)을 js에서 한다.
    function idCheck() {
    	var member_id = $('#member_id').val();
    	if(!member_id){
			alert("아이디를 입력하세요.");
			return false;
		}
    	// 아이디 유효성 검사(1보다 같거나 크면 중복 / 0 이면 중복안됨)
    	$.ajax(
    			{
    				url: 'http://localhost:8090/login/idCheckAjax?member_id='+ member_id,	
    	    		type: 'get',
    	    		success: function(data) {
    	    			console.log('통신 성공, data:' + data);
    	    			
    	    			var data_num = Number( data );
    	    			if( data_num >= 1 ) {
    	    				//아이디가 중복됨.
    	    				alert("중복된 아이디입니다.");
    						$('#member_id_check').val("no");
    						$('#member_id').val('');
    	    			}else{
    	    				//아이디가 중복 안됨. 사용 가능.
    	    				alert("사용가능한 아이디입니다.");
    						$('#member_id_check').val("yes");
    	    			}
    	    			
    	    		},
    	    		error: function(){
    	    			console.log('통신 실패');
    	    		}	
    			}
    		
    	);
    	
    }
</script>
</head>
<body>
    <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative" style="max-width: 520px;">
        <!-- joinTitle -->
        <div class="container-sm container-fluid d-flex flex-row mb-0 border-bottom" height="60px">
            <div class="col-1 my-3 py-1 pl-0">
                <img src="/img/icon/left.png" class="mx-auto d-block" alt="" width="27px" height="27px">
            </div>
            <div class="col-11 my-3 py-1 text-center text-bold">회원가입</div>
        </div>
        <!-- joinMainDiv -->
        <div class="container-sm container-fluid col-11 d-flex flex-column mt-3 justify-content-center align-items-center" style="max-width:520px;">
            <form action="/joinAction" method="get" onsubmit="return nullChecker();">
                <div class="text-left font-weight-bold pl-2 mt-2">아이디</div>
                <div class="form-group row mb-1 ml-0 mr-0 justify-content-between" style="font-size:14px;">
                    <input type="text" class="col-8 form-control nullcheck" name="member_id" id="member_id" placeholder="아이디를 입력해주세요">
                    <input type="button" class="col-3 btn btn-secondary text-dark" value="중복체크" style="font-size: 14px;" onclick="idCheck();">
                    <input type="hidden" name="member_id_check" id="member_id_check" value="no">
                </div>
                <div class="text-left font-weight-bold pl-2 mt-2" >비밀번호</div>
                <div class="form-group mb-1" style="font-size:14px;">
                    <input type="password" class="col-12 form-control mb-1 nullcheck" name="member_pw" id="user_pw" placeholder="비밀번호를 입력해주세요">
                    <input type="password" class="col-12 form-control nullcheck" id="user_pw_check" placeholder="비밀번호를 한 번더 입력해주세요">
                </div>
                <div class="text-left font-weight-bold pl-2 mt-2">이름</div>
                <div class="form-group mb-1" style="font-size:14px;">
                    <input type="text" class="col-12 form-control nullcheck" name="member_name" id="user_name" placeholder="이름을 입력해주세요">
                </div>
                <div class="text-left font-weight-bold pl-2 mt-2">이메일</div>
                <div class="form-group mb-1" style="font-size:14px;">
                    <input type="email" class="col-12 form-control nullcheck" name="member_email" id="user_email" placeholder="이메일을 입력해주세요">
                </div>
                <div class="text-left font-weight-bold pl-2 mt-2 ">휴대폰</div>
                <div class="form-group mb-1" style="font-size:14px;">
                    <input type="text" class="col-12 form-control nullcheck" name="member_phone" id="user_phone" placeholder="전화번호를 입력해주세요">
                </div>
                <!-- 자바스크립트 주소연결 성공 -->
                <!-- child window로 열리게 설정하고 , child window 크기 설정해야 함 -->
                <div class="text-left font-weight-bold pl-2 mt-2">주소</div>
                <div class="form-group row mb-5 ml-0 mr-0 justify-content-between" style="font-size:14px;">
                    <input type="text" class="col-8 form-control mb-1 bg-white" name="sample6_postcode" id="sample6_postcode" placeholder="우편주소" readonly>
                    <input type="button" class="col-3 btn btn-secondary text-dark mb-1"  value="주소찾기" style="font-size: 14px;" onclick="sample6_execDaumPostcode()">
                    <input type="text" class="col-12 form-control mb-1 bg-white nullcheck" name="sample6_address" id="sample6_address" placeholder="주소를 입력해주세요" readonly>
                    <input type="text" class="col-12 form-control nullcheck" name="sample6_detailAddress" id="sample6_detailAddress"  placeholder="상세주소를 입력해주세요">
                    <!-- 지우면 버튼클릭 안됨 -->
                    <input type="hidden" class="inputStyle1" id="sample6_extraAddress" placeholder="참고항목">
                </div>
                <!-- checkBox -->
                <div class="mb-4">
                    <div class="custom-control custom-checkbox my-1">
                        <input type="checkbox" class="custom-control-input" id="joinAll" onclick="checkAll();">
                        <label class="custom-control-label font-weight-bold" for="joinAll">전체동의</label>
                      </div>
                    <div class="custom-control custom-checkbox my-1">
                        <input type="checkbox" class="custom-control-input nullcheck" name="agree" id="joinCK1">
                        <label class="custom-control-label font-weight-bold" for="joinCK1"> [필수]회원가입약관 </label>
                        <textarea cols="30" rows="3" class="col-12 border rounded text-wrap" style="resize: none;" readonly>
                            제1조(목적) 이 약관은 회사가 온라인으로 제공하는 디지털콘텐츠(이하 "콘텐츠"라고 한다) 및 제반서비스의 이용과 관련하여 회사와 이용자와의 권리, 의무 및 책임사항 등을 규정함을 목적으로 합니다.
                        </textarea>
                      </div>
                    <div class="custom-control custom-checkbox my-1">
                        <input type="checkbox" class="custom-control-input nullcheck" name="agree" id="joinCK2">
                        <label class="custom-control-label font-weight-bold" for="joinCK2"> [필수]개인정보처리방침안내 </label>
                        <textarea cols="30" rows="3" class="col-12 border rounded text-wrap" style="resize: none;" readonly>
                            제1조 (개인정보의 처리 목적) ① 개인정보보호위원회는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
                        </textarea>
                    </div>
                </div>
                <input type="submit" class="input type submit btn btn-primary col-12 my-3 mb-5 text-white" height="40px" value="가입하기" style="font-size: 18px;">
            </form>
        </div>
    </div>
<!-- 카카오 주소 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- bootstrap js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<!-- main js -->
<script src="/js/main.js"></script>
</body>
</html>