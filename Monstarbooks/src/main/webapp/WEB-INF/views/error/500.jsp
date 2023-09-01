<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>500</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/error.css">
</head>

<body>
    </head>
    <body>
    <section class="error">
        <div>
            <h1 class="title"><span>5</span><span>0</span><span>0</span></h1>
            <h2 class="subtitle">
                요청하신 페이지가 없습니다.
            </h2>
            <p class="desc">
                입력하신 주소를 확인해주세요.
            </p>

            <div class="buttons">
                <a href="javascript:window.history.back();" class="button goback-button">
                    이전페이지
                </a>
                <a href="${pageContext.request.contextPath}/" class="button gohome-button">
                    홈으로
                </a>
            </div>
        </div>
    </section>
</body>
</html>