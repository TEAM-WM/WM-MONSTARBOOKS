<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 - 상품목록</title>
<h3>상품목록</h3>
</head>
<body>
<%-- 	<img src="${pageContext.request.contextPath}/resources/assets/imgs/kyobo.jpg" witdh="200" height="200" alt="" /> --%>
	<img src="/books/resources/assets/imgs/product/기여어.png" alt="" />
	<article>
		<table border=1>
			<thead>			
				<tr>
					<th>도서번호</th>
					<th>도서이미지</th>
					<th>도서제목</th>
					<th>출판사</th>
					<th>저자</th>
					<th>정가</th>
					<th>상태</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>재고</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dto }" var="dto">
					<tr>
						<td>${dto.bookno }</td>
						<td>도서이미지</td>
						<%-- <td><img src="/books/resources/assets/imgs/product/${dto.bimg }" alt="도서이미지" /></td> --%>
						<td>${dto.btitle }</td>
						<td>${dto.bpublisher }</td>
						<td>${dto.bwriter }</td>
						<td>${dto.bprice }</td>
						<td>${dto.bstatus }</td>
						<td>${dto.bcdate }</td>
						<td>${dto.bmdate }</td>
						<td>${dto.bstock }</td>
						<td><input type="button" value="상세보기" onclick="" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</article>

	<script>
		document.title = "몬스타북스' 관리자";
	</script>
</body>
</html>