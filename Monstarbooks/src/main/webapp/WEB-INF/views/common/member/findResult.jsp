<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 500px;
	margin: 20px auto;
	border-collapse: collapse;
	background-color: white;
	border: 2px solid #000d82;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px 20px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

td {
	border-right: 1px solid #ddd;
}

td:last-child {
	border-right: none;
}

th {
	background-color: #000d82;
	color: white;
}

tr:first-child {
	border-radius: 0 0 10px 10px; /* 하단 모서리만 둥글게 */
}

tr:last-child {
	border-radius: 10px 10px 0 0; 
}

tr:hover {
	background-color: #f2f2f2;
}
</style>
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