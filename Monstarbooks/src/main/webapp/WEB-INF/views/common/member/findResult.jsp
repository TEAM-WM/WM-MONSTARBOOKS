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
		<i class="fa-solid fa-magnifying-glass"></i>
		<h2>
			${name }님의 아이디입니다.<br>
			<span>${info }</span>
		</h2>
		<table>
			<tr>
				<th>아이디</th>
				<th>가입날짜</th>
			</tr>
		<c:forEach var="dto" items="${dto }">
			<tr>
				<td>
					${dto.mid }
				</td>
				<td>
					${dto.mregdate }
				</td>
			</tr>
		</c:forEach>
		</table>
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