<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>권한</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입날짜</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${dto }" var="dto">
				<tr>
					<td>${dto.memberno }</td>
					<td>${dto.mauthority }</td>
					<td>${dto.mid }</td>
					<td>${dto.mname }</td>
					<td>${dto.memail }</td>
					<td>${dto.mregdate }</td>
					<td><a href="">상세보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>