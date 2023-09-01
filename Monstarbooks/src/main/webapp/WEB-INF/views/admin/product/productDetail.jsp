<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productDetail</title>
</head>
<body>
<h3>productDetail.jsp</h3>
	<article>
		<table border=1 width="1600" text-align="center">
			<thead>
				
			</thead>
			<tbody>
		<!-- 도서 테이블 -->
				<tr>	
					<td>ISBN</td>
					<td>${dto.bisbn }</td> 
				</tr>
				<tr>
					<td>도서제목</td>
					<td>${dto.btitle }</td> 
				</tr>
				<tr>
					<td>도서부제목</td>
					<td>${dto.bsubtitle }</td> 
				</tr>
				<tr>
					<td>출판사</td>
					<td>${dto.bpublisher }</td>
				</tr>
				<tr>
					<td>저자</td>
					<td>${dto.bwriter }</td>
				</tr>		
				<tr>
					<td>역자</td>
					<td>${dto.btranslator }</td>
				</tr>
				<tr>
					<td>출간일</td>
					<td>${dto.bpdate }</td>
				</tr>
				<tr>
					<td>정가</td>
					<td>${dto.bprice }</td>
				</tr>
				<%-- <tr>
					<td>판매가</td>
					<td>${dto.bpricesell }</td>
				</tr> --%>
				<%-- <tr>
					<td>할인율</td>
					<td>${dto.bdiscount }</td>
				</tr> --%>
				<tr>
					<td>상태</td>
					<td>${dto.bstatus }</td>
				</tr>
				<tr>
					<td>생성일</td>
					<td>${dto.bcdate }</td>
				</tr>
				<tr>
					<td>수정일</td>
					<td>${dto.bmdate }</td>
				</tr>
				<tr>
					<td>재고</td>
					<td>${dto.bstock }</td>
				</tr>
				
		<!-- 도서 상세 테이블 -->
				<tr>
					<td>도서썸네일</td>
					<td><img src="/books/resources/assets/imgs/product/${dto.bookDetailDto.bimg }" width="200" alt="도서이미지" /></td>
				</tr>
				<tr>
					<td>도서상세이미지</td>
					<td><img src="/books/resources/assets/imgs/product/${dto.bookDetailDto.bimgdetail }" alt="도서디테일이미지" /></td>
				</tr>
				<tr>
					<td>도서설명</td>
					<td>${dto.bookDetailDto.bdescription }</td>
				</tr>
				<tr>
					<td>전체페이지</td>
					<td>${dto.bookDetailDto.bpage }</td>
				</tr>
				<tr>
					<td>도서크기</td>
					<td>${dto.bookDetailDto.bsize }</td>
				</tr>
				<tr>
					<td>출간일</td>
					<td>${dto.bookDetailDto.bpdate }</td>
				</tr>
				<%-- <tr>
					<td>상품뱃지</td>
					<td>${dto. }</td>
				</tr> --%>
				
		<!-- 도서 카테고리 테이블 -->
				<tr>
					<td>상위 카테고리</td>
					<td>${dto.bookCategoryDto.bcategory1 }</td>
				</tr>
				<tr>
					<td>하위 카테고리</td>
					<td>${dto.bookCategoryDto.bcategory2 }</td>
				</tr>
			</tbody>
		</table>
	</article>

	<script>
		document.title = "상품디테일";
	</script>
</body>
</html>