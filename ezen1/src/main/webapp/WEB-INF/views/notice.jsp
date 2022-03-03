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

<c:import url="header.jsp"></c:import>

 <!-- container -->
    <div class="container-sm container-fluid d-flex flex-column justify-content-center align-items-center postion-relative pl-0 pr-0" style="max-width: 520px;">
   
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
                    <tr>
                        <th scope="row">3</th>
                        <td onclick="popupHideAndShow(target = 'notice_popup')" style="cursor: pointer;"> 공지 제목입니다.</td>
                        <td> 2022-02-21</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td onclick="popupHideAndShow(target = 'notice_popup')" style="cursor: pointer;"> 공지 제목입니다.</td>
                        <td> 2022-02-21</td>
                    </tr><tr>
                        <th scope="row">1</th>
                        <td onclick="popupHideAndShow(target = 'notice_popup')" style="cursor: pointer;"> 공지 제목입니다.</td>
                        <td> 2022-02-21</td>
                    </tr>
                </tbody>
            </table>
            
        </div>
            <!-- 작성버튼 -->
        <div class="d-flex flex-column justify-content-center">
            <button class="btn btn-secondary text-dark border-0 mx-auto font-weight-bold" style="width: 100px;font-size: 16px;" onclick="popupHideAndShow(target = 'notice_write_popup')">
                작성
            </button>

            <!-- 페이지 표시기 jsp변환시 링크수정! -->
            <div class="container row my-3 mx-auto">
                <nav class="mx-auto">
                <ul class="pagination justify-content-center ">
                        
                        <li class="page-item ">
                            <a class="page-link" href="community01?currentPage=${ beginPagenation - 1}">&lang;</a>
                        </li>
                        
                        <li class="page-item active">
                            <a class="page-link" href="community01?currentPage=${ page }">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="community01?currentPage=${ page }">2</a>
                        </li><li class="page-item ">
                            <a class="page-link" href="community01?currentPage=${ page }">3</a>
                        </li><li class="page-item ">
                            <a class="page-link" href="community01?currentPage=${ page }">4</a>
                        </li><li class="page-item ">
                            <a class="page-link" href="community01?currentPage=${ page }">5</a>
                        </li>
                        
                        <li class="page-item">
                            <a class="page-link" href="community01?curruntPage=${endPagenation+1}">&rang;</a>
                        </li>
                </ul>
                </nav>
            </div>
        </div>
        <!-- 팝업 별도 페이지로 작성예정! -->
        <!-- 공지사항 열람/수정(관리자) 팝업창 -->
        <div class="position-absolute d-none bg-white border border-dark-50 rouned" id="notice_popup" style=" top: 120px;z-index: 1100;">

            <!-- 닫기 버튼 -->
            <div class="w-100 d-flex flex-row my-2 pr-3 justify-content-end">
                <img src="/img/icon/cross.png" alt="닫기버튼" width="25px" height="25px" onclick="popupHideAndShow(target ='notice_popup')" style="cursor: pointer;">
            </div>
            <!-- form 시작 -->
            <div class="form-group w-100">
                <form name="noticeUpdateForm" method="post" action="noticeUpdateAction">
                    <!-- 히든 input -->
                    <input type="hidden" name="notice_idx" value="notice_idx">
                    <!-- 날짜 표시 -->
                    <div class="w-100 my-1">
                        <input class="form-control-plaintext text-right pr-4" disabled type="text" value="2022-02-11" style="font-size: 14px;">
                    </div>
                    <!-- 공지사항 제목 -->
                    <div class="col-11 mx-auto">
                        <input class="form-control bg-white nullcheck" readonly type="text" name="notice_title" value="공지제목">
                    </div>
                    <!-- 공지사항 내용 -->
                    <div class="col-11 mx-auto mt-1">
                        <textarea class="form-control overflow-auto bg-white nullcheck" readonly name="notice_content"cols="30" rows="10" style="resize: none;">공지사항 내용입니다.</textarea>
                    </div>
                    <!-- 중요공지사항(관리자) -->
                    <div class="ml-4 my-2 pl-2">
                        <label><input class="mr-2" type="checkbox" name="notice_show">중요공지사항</label>
                    </div>
                    <!-- 확인버튼 / 수정버튼(관리자) // 삭제버튼-->
                    <div class="mx-auto" style="width: fit-content;">
                        <!-- 사용자용 확인버튼 -->
                        <button class="btn btn-dark btn-lg d-none" style="width: 140px" onclick="popupHideAndShow(target = 'notice_popup')">확인</button>
                        <!-- 관리자용 확인버튼 -->
                        <input type="submit" class="btn btn-dark btn-lg" style="width: 140px;" value="확인">
                        <button class="btn btn-secondary" onclick="multiSubmit(formName = 'noticeUpdateForm', formAction = 'noticeDeleteAction', onsubmit ='return nullChecker();')">삭제</button>
                    </div>
                </form>
            </div>
        </div>
    
        <!-- 공지사항 작성 팝업(관리자) -->
        <div class="position-absolute d-none bg-white border border-dark-50 rouned" id="notice_write_popup" style=" top: 120px;z-index: 1100;">

            <!-- 닫기 버튼 -->
            <div class="w-100 d-flex flex-row my-2 pr-3 justify-content-end">
                <img src="/img/icon/cross.png" alt="닫기버튼" width="25px" height="25px" onclick="popupHideAndShow(target ='notice_write_popup')" style="cursor: pointer;">
            </div>
            <!-- form 시작 -->
            <div class="form-group w-100">
                <form name="noticeWriteForm" method="post" action="noticeWriteAction" onsubmit="return nullChecker();">
                    <!-- 히든 input -->
                    <input type="hidden" name="notice_idx" value="notice_idx">
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
                        <textarea class="form-control overflow-auto bg-white nullcheck" name="notice_content"cols="30" rows="10" placeholder="내용을 입력해 주세요." style="resize: none;"></textarea>
                    </div>
                    <!-- 중요공지사항(관리자) -->
                    <div class="ml-4 my-2 pl-2">
                        <label><input class="mr-2" type="checkbox" name="notice_show">중요공지사항</label>
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