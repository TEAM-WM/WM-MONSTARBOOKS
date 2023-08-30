<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 - 상품목록</title>

</head>
<body>
<h3>productList.jsp</h3>
<%-- 	<img src="${pageContext.request.contextPath}/resources/assets/imgs/kyobo.jpg" witdh="200" height="200" alt="" /> --%>
	<img src="/books/resources/assets/imgs/product/기여어.png" alt="테스트이미지" width="100" />
	<article>
	<div style="width:100%; text-align:right;">
		<!-- <input type="button" value="상품등록" onclick=""/> -->
		<a href="productInsertView">상품등록</a>
	</div>
		<table border=1 width="1600" align="center">
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
						<td align=center>${dto.bookno }</td>
						<!-- <td>도서이미지</td> -->
						<!-- <td><img src="/books/resources/assets/imgs/product/기여어.png" alt="" /></td> -->
						<td align=center><img src="/books/resources/assets/imgs/product/${dto.bookDetailDto.bimg }" width="80" alt="도서이미지" /></td>
						<td align=center>${dto.btitle }</td>
						<td align=center>${dto.bpublisher }</td>
						<td align=center>${dto.bwriter }</td>
						<td align=center>${dto.bprice }</td>
						<td align=center>${dto.bstatus }</td>
						<td align=center>${dto.bcdate }</td>
						<td align=center>${dto.bmdate }</td>
						<td align=center>${dto.bstock }</td>
						<td align=center><a href="productDetail?bookno=${dto.bookno }">상세보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</article>

	<script>
		document.title = "상품리스트";
	</script>
</body>
</html>