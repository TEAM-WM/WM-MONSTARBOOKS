<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

</head>
<body>
<h3>productList.jsp</h3>
<%-- 	<img src="${pageContext.request.contextPath}/resources/assets/imgs/kyobo.jpg" witdh="200" height="200" alt="" /> --%>
	<img src="/books/resources/assets/imgs/product/기여어.png" alt="테스트이미지" width="100" />
	
	<!-- 상품등록 버튼 -->
	<div style="width:100%; text-align:right;">
		<button type="button" onclick="location.href='productinsertview'" style="font-size: 18px; padding: 10px 20px; border: 1px solid #000;">상품등록</button>
	</div>

	<!-- 검색시작 -->
	<!-- 조건 드롭다운 메뉴 -->
<form action="productlist" method="get">
	<div>
		<label for="searchType">검색 옵션:</label>
		<select name="searchType" id="searchType">
		    <option value="bisbn" <c:if test="${bisbn eq true }">selected</c:if>>ISBN</option>
		    <option value="btitle" <c:if test="${btitle eq true }">selected</c:if>>도서제목</option>
		    <option value="bpublisher">출판사</option>
		    <option value="bwriter">저자</option>
		</select>
	<!-- 검색어, 검색버튼 -->
		<label for="sk">검색어:</label>
		<input type="text" name="sk" value="${resk }" />
		<input type="submit" value="검색" />
	</div>
</form>	
	
	<article>
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
					<th>ISBN</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dto }" var="dto">
					<tr>
						<td align=center>${dto.bookno }</td>
						<!-- <td>도서이미지</td> -->
						<td align=center><img src="/books/resources/assets/imgs/product/${dto.bookDetailDto.bimg }" width="80" alt="도서이미지" /></td>
						<td align=center>${dto.btitle }</td>
						<td align=center>${dto.bpublisher }</td>
						<td align=center>${dto.bwriter }</td>
						<td align=center>${dto.bprice }</td>
						<td align=center>${dto.bstatus }</td>
						<td align=center>${dto.bcdate }</td>
						<td align=center>${dto.bmdate }</td>
						<td align=center>${dto.bstock }</td>
						<td align=center>${dto.bisbn }</td>
						<td align=center><a href="productdetail?bookno=${dto.bookno }">상세보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr />
		totCnt: ${totRowcnt }<br />
		현재페이지/토탈페이지: ${searchVO.page }/${searchVO.totPage }
		<hr />
		
		
		<!-- 페이징 -->
		<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
			<c:choose>
				<c:when test="${i eq searchVO.page }">
					<span style="color:red; font-weight: bold;">${i }</span>
				</c:when>
				<c:otherwise>
					<a href="productlist?page=${i }&sk=${searchKey }&bisbn=${bisbn==true?'bisbn':''}&btitle=${btitle==true?'btitle':''}" style="text-decoration: none;">${i }</a>
				</c:otherwise>
			</c:choose>	
		</c:forEach>
	
		<style>
		.fa-solid{
			color: #333; 
		}
		
		.fa-solid: hover{
			color: orange; 
		}

		</style>
		
		
	</article>

	<script>
		document.title = "상품리스트";
	</script>
</body>
</html>