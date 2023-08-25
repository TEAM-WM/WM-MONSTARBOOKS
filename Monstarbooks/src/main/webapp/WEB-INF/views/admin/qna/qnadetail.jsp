<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>1:1문의상세</h1>
<table>
<c:forEach items="${qnaDetail }" var="dto">
	<tr>
		<td>${dto.qstatus }</td>
		<td>문의유형</td>
		<td>제목</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>작성자</td>
		<td>작성날짜</td>
	</tr>
	<tr>
		<td>내용</td>
	</tr>
	<tr>
		<td>첨부</td>
	</tr>
</c:forEach>
</table>

</body>
</html>