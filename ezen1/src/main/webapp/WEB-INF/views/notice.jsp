<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/custom.css">
</head>
<body>

<c:import url="header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center position-relative pl-0 pr-0" style="max-width: 520px; margin-top: 60px">
   
        <!-- title container -->
        <div class="container-fluid d-flex flex-row mb-4 border-bottom border-dark-50" style="height: 60px;">
        <!-- title back btn -->
            <div class="col-1 my-3" onclick="location.href='main'" style="cursor: pointer;">
                <img src="/img/icon/뒤로가기 (2).png" alt="뒤로가기">
            </div>
        <!-- title -->
            <div class="col-11 my-3 py-1 text-center font-weight-bold">
                공지사항
            </div>
        </div>

        <!-- table container-->
        <div class="container-fluid text-center">
            <!-- table -->
            <table class="table table-hover border border-dark-50">
                <thead class="thead-dark-50 bg-secondary">
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">날짜</th>
                </thead>
                <tbody>
                	<c:forEach var="notice" items="${ noticeList }">
                    <tr>
                        <th scope="row">${ notice.notice_idx }</th>
                        <td onclick="popupHideAndShow(target = 'notice_popup${ notice.notice_idx}')" style="cursor: pointer;"> ${ notice.notice_title }</td>
                        <fmt:formatDate var="date" value="${ notice.notice_date }" pattern="YY.MM.dd"/>
                        <td>${ date } </td>
                    </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
            
        </div>
            
        <div class="d-flex flex-column justify-content-center mb-2">
        	<!-- 작성버튼 admin에게만 보임 -->
        	<c:if test="${ user_id eq 'admin' }">
            <button class="btn btn-secondary text-dark border-0 mx-auto font-weight-bold" style="width: 100px;font-size: 16px;" onclick="popupHideAndShow(target = 'notice_write_popup')">
                작성
            </button>
			</c:if>
            <!-- 페이지 표시기 -->
			<c:if test="${ pages.beginPagenation != pages.endPagenation }">
		    <div class="container row my-3 mx-auto">
		      <nav class="mx-auto">
		        <ul class="pagination justify-content-center ">
					<!-- 현재 페이지가 페이지표시기의 페이지 표시 수 보다 작으면 뒤로가기버튼 disable -->
		          <li class="page-item <c:if test="${ pages.currentPage <= 5 }">disabled</c:if>">
		            <a class="page-link" href="notice?currentPage=${ pages.beginPagenation - 1}">&lang;</a>
		          </li>
				  <c:forEach var="page" begin="${ pages.beginPagenation }" end="${ pages.endPagenation }" step="1">
		          <li class="page-item <c:if test="${ pages.currentPage == page }">active</c:if>">
		            <a class="page-link" href="notice?currentPage=${ page }">${ page }</a>
		          </li>
		          </c:forEach>
		          <!-- 마지막페이지까지 표시되면 앞으로 가기 표시 안됨 -->
		          <li class="page-item <c:if test="${ pages.countOfPages eq pages.endPagenation }">disabled</c:if>">
		            <a class="page-link" href="notice?curruntPage=${ pages.endPagenation+1}">&rang;</a>
		          </li>
		        </ul>
		      </nav>
		    </div>
		    </c:if>
		    
			    
        </div>
        
        <!-- 팝업 별도 페이지로 작성예정! -->
        <!-- 공지사항 열람/수정(관리자) 팝업창 -->
        <c:forEach var="notice" items="${ noticeList }">
        <div class="position-absolute d-none bg-white border border-dark-50 rouned" id="notice_popup${ notice.notice_idx }" style=" top: 120px;z-index: 1100;">

            <!-- 닫기 버튼 -->
            <div class="w-100 d-flex flex-row my-2 pr-3 justify-content-end">
                <img src="/img/icon/cross.png" alt="닫기버튼" width="25px" height="25px" onclick="popupHideAndShow(target ='notice_popup${ notice.notice_idx}')" style="cursor: pointer;">
            </div>
            <!-- form 시작 -->
            <div class="form-group w-100">
                <form name="noticeUpdateForm${ notice.notice_idx }" method="post" action="noticeUpdateAction" onsubmit="return changeValueOfCheckbox();">
                    <!-- 히든 input -->
                    <input type="hidden" name="notice_idx" value="${ notice.notice_idx }">
                    <!-- 날짜 표시 -->
                    <div class="w-100 my-1">
                    	<fmt:formatDate var="date" value="${ notice.notice_date }" pattern="YY.MM.dd"/>
                        <input class="form-control-plaintext text-right pr-4" disabled type="text" value="${ date }" style="font-size: 14px;">
                    </div>
                    <!-- 공지사항 제목 -->
                    <div class="col-11 mx-auto">
                        <input class="form-control bg-white nullcheck" readonly type="text" name="notice_title" value="${ notice.notice_title }">
                    </div>
                    <!-- 공지사항 내용 -->
                    <div class="col-11 mx-auto mt-1">
                        <textarea class="form-control overflow-auto bg-white nullcheck" readonly name="notice_contents"cols="30" rows="10" style="resize: none;">${ notice.notice_contents }</textarea>
                    </div>
                    <!-- 중요공지사항(관리자) -->
                    <div class="ml-4 my-2 pl-2">
                        <label><input class="mr-2 checkbox" type="checkbox" name="notice_show"<c:if test="${ notice.notice_show eq 1 }"> checked</c:if>
                        	>중요공지사항</label>
                    </div>
                    <!-- 확인버튼 / 수정버튼(관리자) // 삭제버튼-->
                    <div class="mx-auto" style="width: fit-content;">
                        <!-- 사용자용 확인버튼 -->
                        <button class="btn btn-dark btn-lg <c:if test="${ user_id eq 'admin' }">d-none</c:if>>" style="width: 140px" onclick="popupHideAndShow(target = 'notice_popup${ notice.notice_idx}')" type="button">확인</button>
                        <!-- 관리자용 확인버튼 -->
                        <c:if test="${ user_id eq 'admin' }">
                        <input type="submit" class="btn btn-dark btn-lg" style="width: 140px;" value="확인">
                        <button class="btn btn-secondary" onclick="multiSubmit(formName = 'noticeUpdateForm', formAction = 'noticeDeleteAction?${ notice.notice_idx}')">삭제</button>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
        </c:forEach>
    
        <!-- 공지사항 작성 팝업(관리자) -->
        <div class="position-absolute d-none bg-white border border-dark-50 rouned" id="notice_write_popup" style=" top: 120px;z-index: 1100;">

            <!-- 닫기 버튼 -->
            <div class="w-100 d-flex flex-row my-2 pr-3 justify-content-end">
                <img src="/img/icon/cross.png" alt="닫기버튼" width="25px" height="25px" onclick="popupHideAndShow(target ='notice_write_popup')" style="cursor: pointer;">
            </div>
            <!-- form 시작 -->
            <div class="form-group w-100">
                <form name="noticeWriteForm" method="post" action="noticeWriteAction" onsubmit="return changeValueOfCheckbox(); return nullChecker();">
                    
                    <!-- 날짜 표시 -->
                    <div class="w-100 my-1">
                        <input class="form-control-plaintext text-right pr-4" disabled type="text" value="2022-02-11" style="font-size: 14px;">
                    </div>
                    <!-- 공지사항 제목 -->
                    <div class="col-11 mx-auto">
                        <input class="form-control bg-white nullcheck" type="text" name="notice_title" placeholder="제목을 입력해주세요.">
                    </div>
                    <!-- 공지사항 내용 -->
                    <div class="col-11 mx-auto mt-1">
                        <textarea class="form-control overflow-auto bg-white nullcheck" name="notice_contents"cols="30" rows="10" placeholder="내용을 입력해 주세요." style="resize: none;"></textarea>
                    </div>
                    <!-- 중요공지사항(관리자) -->
                    <div class="ml-4 my-2 pl-2">
                        <label><input class="mr-2 checkbox" type="checkbox" name="notice_show">중요공지사항</label>
                    </div>
                    <!-- 확인버튼 -->
                    <div class="mx-auto" style="width: fit-content;">
                        <input type="submit" class="btn btn-dark btn-lg" style="width: 140px;" value="확인">
                    </div>
                </form>
            </div>
        </div>
    </div>

    
<c:import url="footer.jsp"></c:import>
<c:import url="nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>