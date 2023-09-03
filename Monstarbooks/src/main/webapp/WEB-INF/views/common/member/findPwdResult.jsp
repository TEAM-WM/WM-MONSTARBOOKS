<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<article class="join-success">
		<c:choose>
			<c:when test="${ isSuccess eq 'true' }">
				<i class="fa-solid fa-magnifying-glass"></i>
				<h2>
					${id }님의 임시비밀번호입니다.<br>
					<span class="text-back">${newPwd }</span>
				</h2>
				<h3>
					로그인 후 마이페이지에서 비밀번호를 변경해주세요.
				</h3>
			</c:when>
			<c:otherwise>
				<i class="fa-solid fa-triangle-exclamation"></i>
				<h3>
					입력하신 정보와 일치하는<br>회원정보가 없습니다.
				</h3>
			</c:otherwise>
		</c:choose>
		<div class="btn-wrap">
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/'">
				메인으로
			</button>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/login'">
				로그인
			</button>
		</div>
	</article>

</body>
</html>