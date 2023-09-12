<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
</head>
<body>
<h1>이벤트</h1>
<table border="1">
	<tr>
		<td>이벤트이미지</td>
		<td>이벤트번호</td>
		<td>제목</td>
		<td>내용</td>
		<td>작성날짜</td>
		<td>상세보기</td>
	</tr>
	<c:forEach items="${list}" var="list">
		<c:choose>
			<c:when test="${list.deleted eq 'yes'}">
				<!-- DELETED 값이 'yes'인 경우 아무 작업을 하지 않습니다. -->
			</c:when>
			<c:otherwise>
				<tr>
					<td><img alt="11" src="/books33/resources/assets/imgs/coupon/event.jpeg"></td>
					<td>${list.eventno }</td>
					<td>${list.etitle }</td>
					<td>${list.econtent}</td>
					<td>${list.eregdate }</td>
					<td><button>
							<a href="eventdetail?eventno=${list.eventno }">상세보기</a>
						</button></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</table>
</body>
</html>
