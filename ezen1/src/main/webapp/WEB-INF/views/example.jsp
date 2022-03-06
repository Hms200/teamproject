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

이 파일을 오른쪽 클릭하여 copy를 누르고 페이지가 들어갈 폴더를 선택하여 오른쪽클릭 paste 하신다음 rename으로 파일명을 페이지명에 맞게 변경해주세요. 확장자는 jsp.
도메인설계 파일을 보시고, 페이지가 들어갈 폴더에 맞게 넣어주세요. 어느폴더에 들어가야할지 햇갈리거나 모르겠으면 따로 연락 주세요.

이곳에 변환할 html 파일의 body 태그 안쪽 코드를 붙여넣어주세요.

별도의 css와 js를 포함한 페이지라면 css는 상단 head태그 안에 style로 넣어주시고, js는 가장 아래 /body 바로 위에 넣어주세요.

파일이 들어간 폴더 경로에 맞게 a, location.href를 수정해 주세요. 예) 링크가 login폴더의 join으로 연결된경우  -- /login/join  이런식으로 폴더명까지
적어주셔야 작동하게됩니다.

완성된 jsp변환 참고용 파일은 main.jsp 입니다.

    
<c:import url="footer.jsp"></c:import>
<c:import url="nav.jsp"></c:import>


<!-- bootstrap js  // jquery js는 nav에 들어있는채로 import-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="/js/main.js"></script>
</body>
</html>