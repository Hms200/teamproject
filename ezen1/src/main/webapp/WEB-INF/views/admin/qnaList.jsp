<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주묻는질문</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>


<c:import url="../pcMain.jsp"></c:import>


<div  class="container-sm container-fluid d-flex flex-column align-items-center pl-0 pr-0 position-relative"  style="max-width: 520px;max-height: 100vh; overflow: auto;" >

<c:import url="../header.jsp"></c:import>

<!-- container -->
  <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative mb-5" id="mainContainer" style="max-width: 520px; margin-top: 60px;">
       
     <!-- 네브바 -->
    <div class="container-sm container-fluid d-flex flex-row justify-content-around align-items-center text-decoration-none text-center font-weight-bold" style="height: 90px;">
      <nav>
        <span>
          <a href="qnaList?cat=Qna" class="col-4 text-decoration-none text-dark">Qna</a>
        </span>
        <span>
          <a href="qnaList?cat=OneToOne" class="col-4 text-decoration-none text-dark">1:1문의</a>
        </span>
      </nav>
    </div>
    
    <!-- 상품 상세 문의 테이블 -->
    <div class="container-sm container-fluid mt-1">
      <table class="table table-hover border border-dark-50" id="questionTable">
        <thead class="text-center" style="height: 40px;">
          <tr>
          <th class="col-4 font-primary">상품정보</th>
          <th class="col-8 font-primary">내용</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${ mode == 'Qna' }">
        <c:forEach var="question" items="${ questionlist }">
            <tr data-toggle="collapse" data-target="#q${ question.question_idx }" aria-expanded="false" aria-controls="collapse" data-parent="#questionTable" style="cursor: pointer;">
              <th class="col-6 font-primary px-2">${ goodslist.get(question.goods_idx) }</th>
              <td class="text-right font-weight-light font-primary px-0">${ userlist.get(question.user_idx) } &numsp;&numsp;<small> ${ question.question_date }</small></td>
              <td colspan="2">
	              <div class="d-flex justify-content-end">
	                <input type="button" value="답글등록" class="btn btn-secondary font-primary" id="${ question.question_idx }" onclick="popupHideAndShowForQnaList(event)" style="width: 80px; height: 30px; cursor: pointer;">
	              </div>
              </td>
            </tr>
            <!-- 아코디언 -->
            <tr class="collapse font-primary" id="q${ question.question_idx }">
              
              <td colspan="3" style="width: 260px;">${ question.question_contents }</td>
            </tr>
          
         </c:forEach>
         </c:if>
         
         <c:if test="${ mode == 'OneToOne' }">
         	<c:forEach var="question" items="${ questionlist }">
            <tr data-toggle="collapse" data-target="#q${ question.onetoone_idx }" aria-expanded="false" aria-controls="collapse" data-parent="#questionTable" style="cursor: pointer;">
              <th class="col-6 font-primary px-2">${ question.onetoone_cat }</th>
              <td class="text-right font-weight-light font-primary px-0">${ userlist.get(question.user_idx) } &numsp;&numsp;<small> ${ question.onetoone_date }</small></td>
              <td colspan="2">
              <div class="d-flex justify-content-end">
                <input type="button" value="답글등록" class="btn btn-secondary font-primary" id="${ question.onetoone_idx }" onclick="popupHideAndShowForQnaList(event)" style="width: 80px; height: 30px; cursor: pointer;">
              </div>
            </td>
            </tr>
            <!-- 아코디언 -->
            <tr class="collapse font-primary" id="q${ question.onetoone_idx }">
              
              <td colspan="3" style="width: 260px;">${ question.onetoone_contents }</td>
            </tr>
          
         </c:forEach>
         </c:if>
          </tbody> 
      </table>
    </div>
    
     <!-- 페이지 표시기 -->
    	<c:if test="${ mode == 'Qna' }">
		    <div class="container row my-3 mx-auto">
		      <nav class="mx-auto">
		        <ul class="pagination justify-content-center ">
					<!-- 현재 페이지가 페이지표시기의 페이지 표시 수 보다 작으면 뒤로가기버튼 disable -->
		          <li class="page-item <c:if test="${ pages.currentPage <= 5 }">disabled</c:if>">
		            <a class="page-link" href="qnaList?currentPage=${ pages.beginPagenation - 1}">&lang;</a>
		          </li>
				  <c:forEach var="page" begin="${ pages.beginPagenation }" end="${ pages.endPagenation }" step="1">
		          <li class="page-item <c:if test="${ pages.currentPage == page }">active</c:if>">
		            <a class="page-link" href="qnaList?currentPage=${ page }">${ page }</a>
		          </li>
		          </c:forEach>
		          <!-- 마지막페이지까지 표시되면 앞으로 가기 표시 안됨 -->
		          <li class="page-item <c:if test="${ pages.countOfPages eq pages.endPagenation }">disabled</c:if>">
		            <a class="page-link" href="qnaList?currentPage=${ pages.endPagenation+1}">&rang;</a>
		          </li>
		        </ul>
		      </nav>
		    </div>
		    </c:if>
    
    <!-- 페이지 표시기 -->
    	<c:if test="${ mode == 'OneToOne' }">
		    <div class="container row my-3 mx-auto">
		      <nav class="mx-auto">
		        <ul class="pagination justify-content-center ">
					<!-- 현재 페이지가 페이지표시기의 페이지 표시 수 보다 작으면 뒤로가기버튼 disable -->
		          <li class="page-item <c:if test="${ pages.currentPage <= 5 }">disabled</c:if>">
		            <a class="page-link" href="qnaList?cat=oneToone&currentPage=${ pages.beginPagenation - 1}">&lang;</a>
		          </li>
				  <c:forEach var="page" begin="${ pages.beginPagenation }" end="${ pages.endPagenation }" step="1">
		          <li class="page-item <c:if test="${ pages.currentPage == page }">active</c:if>">
		            <a class="page-link" href="qnaList?cat=oneToone&currentPage=${ page }">${ page }</a>
		          </li>
		          </c:forEach>
		          <!-- 마지막페이지까지 표시되면 앞으로 가기 표시 안됨 -->
		          <li class="page-item <c:if test="${ pages.countOfPages eq pages.endPagenation }">disabled</c:if>">
		            <a class="page-link" href="qnaList?cat=oneToone&currentPage=${ pages.endPagenation+1}">&rang;</a>
		          </li>
		        </ul>
		      </nav>
		    </div>
		    </c:if>

	<input type="hidden" id="mode" value="${ mode }">
    <!-- 상품 문의 답글 팝업 -->
    <div class="position-fixed d-none flex-column bg-white border border-dark-50 rouned w-90" id="qna_reply_popup" style="top: 150px;z-index: 1100; max-width: 520px;">
      <!-- 닫기 버튼 -->
      <div class="d-flex justify-content-end">
        <img src="/img/icon/cross.png" alt="닫기 버튼" width="30px" height="30px" style="cursor: pointer;" onclick="popupHideAndShow(target ='qna_reply_popup')">
      </div>
      <div style="margin: 0 20px 30px">
        <!-- 타이틀 -->
        <div class="text-center font-weight-bold text-dark" style="height: 25px; margin: 5px 0 20px;">
          답글 작성
        </div>
        <div class="d-flex flex-column justify-content-center align-items-center">
        <!-- 작성폼 시작 -->
      
        <!-- 히든 input -->
        <input type="hidden" id="targetIdx" name="question_idx" value="">
      <!-- 내용 -->
      <div>
        <textarea name="question_reply" placeholder="내용을 입력해주세요" cols="30" rows="10" class="border border-dark-50 rouned nullcheck" style="padding: 2px 15px;resize: none;"></textarea>
      </div>
      <!-- 확인 버튼 -->
      <div>
        <input type="button" value="등록하기" class="btn btn-dark text-light form-control" onclick="registerQuestionReply()" style="width: 185px; margin-top: 20px; cursor: pointer;">
      </div>
    </div>
    
  </div>
    </div>

  
  </div>
    
<c:import url="../footer.jsp"></c:import>
<c:import url="../nav.jsp"></c:import>
</div>

<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
<script>

//popup hide & show   for admin.qnaList
function popupHideAndShowForQnaList(event) {
    const targetWindow = document.getElementById('qna_reply_popup');
    if(targetWindow.classList.contains("d-none")){
        targetWindow.classList.add("d-block");
        targetWindow.classList.remove("d-none");
    }else if(targetWindow.classList.contains("d-block")){
        targetWindow.classList.add("d-none");
        targetWindow.classList.remove("d-block");
    }
    const targetQuestionIdx = event.target.id;
    const questionIdxInput = document.getElementById('targetIdx');
    questionIdxInput.value = targetQuestionIdx;
};

</script>
</body>
</html>