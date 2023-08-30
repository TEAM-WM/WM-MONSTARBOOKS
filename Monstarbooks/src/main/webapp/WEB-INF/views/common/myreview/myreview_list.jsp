<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--  주문 테이블 중 주문번호? 주문도서명 등 함께 조인 -->
<body>
	<h3>마이리뷰</h3>
	<br />
	<div align="center" style="height: auto;">
		<table width="780" border="1">
			<tr>
				<td>번호</td>
				<td>책 이미지</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 수정 &nbsp; l &nbsp; 삭제</td>
			</tr>
			<tr>
				<td>별점</td>
				<td>날짜</td>
			</tr>
			<tr>
				<td>내용</td>
			</tr>

			<c:forEach items="${reviewlist }" var="dto">
				<tr>
					<td>${dto.reviewno }</td>
					<td>${dto.refilesrc }</td>
				</tr>
				<tr>
					<td><a href="myreview_list?reviewno=${dto.reviewno }">${dto.rtitle }</a></td>
					<td>${dto.rstar }</td>
					<td>${dto.redate }</td>
				</tr>
				<tr>
					<td>${dto.rcontent }</td>
				</tr>
			</c:forEach>
		</table>
	</div>










	<script>
		document.title = "몬스타북스 :: 마이페이지 :: 마이리뷰";
	</script>
</body>
</html>