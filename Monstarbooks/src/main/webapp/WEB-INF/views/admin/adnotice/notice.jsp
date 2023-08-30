<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
</head>
<body>
<h2>공지사항 관리</h2>
<button><a href="./noticeInsert">공지 등록</a></button>
<table width="700" border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성날짜</td>
		<td>상세보기</td>
	</tr>
<c:forEach items="${notice }" var="dto">
	<tr>
		<td>${dto.noticeno }</td>
		<td>${dto.ntitle }</td>
		<td>${dto.nwriter }</td>
		<td>${dto.nregdate }</td>
		<td>
			<button>
				<a href="./noticeDetail?noticeno=${dto.noticeno }">상세보기</a>
			</button>
		</td>
	</tr>
</c:forEach>
</table>
</body>
</html>