<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
</head>
<body>
<h3>productInsertView.jsp</h3>
	<article>
	<form action="productInsertService" method="post">
		<!-- 도서 테이블 -->
		<label for="ISBN">ISBN</label>
		<div class="form-small">
			<input type="text" name="bisbn" />
			<input type="button" value="ISBN 검색" />
		</div>
		<label for="btitle">도서제목</label>
		<input type="text" name="btitle" />
		
		<table>
		<tr>
					<td>도서부제목</td>
					<td><input type="text" name="bsubtitle" /></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><input type="text" name="bpublisher" /></td>
				</tr>
				<tr>
					<td>저자</td>
					<td><input type="text" name="bwriter" /></td>
				</tr>
				<tr>
					<td>역자</td>
					<td><input type="text" name="btranslator" /></td>
				</tr>
				<tr>
					<td>출간일</td>
					<td><input type="text" name="bpdate" /></td>
				</tr>
				<tr>
					<td>정가</td>
					<td><input type="text" name="bprice" /></td>
				</tr>
				<tr>
					<td>판매가</td>
					<td><input type="text" name="bpricesell" /></td>
				</tr>
				<tr>
					<td>할인율</td>
					<td><input type="text" name="bdiscount" /></td>
				</tr>
				<tr>
					<td>상태</td>
					<td><input type="text" name="bstatus" /></td>
				</tr>
				<!-- <tr>
					<td>생성일</td>
					<td><input type="text" name="bcdate" /></td>
				</tr> -->
				<!-- <tr>
					<td>수정일</td>
					<td><input type="text" name="bmdate" /></td>
				</tr> -->
				<tr>
					<td>재고</td>
					<td><input type="text" name="bstock" /></td>
				</tr>
				<tr>
					<td>asdfasdf</td>
					<td></td>
				</tr>
		<!-- 도서 상세 테이블 -->
				<!-- <tr>
					<td>도서썸네일</td>
					<td><input type="text" name="bimg" /></td>
				</tr>
				<tr>
					<td>도서상세이미지</td>
					<td><input type="text" name="bimgdetail" /></td>
				</tr>
				<tr>
					<td>도서설명</td>
					<td><input type="text" name="bdescription" /></td>
				</tr>
				<tr>
					<td>전체페이지</td>
					<td><input type="text" name="bpage" /></td>
				</tr>
				<tr>
					<td>도서크기</td>
					<td><input type="text" name="bsize" /></td>
				</tr>
				<tr>
					<td>출간일</td>
					<td><input type="text" name="bpdate" /></td>
				</tr> <br /> -->
				<%-- <tr>
					<td>상품뱃지</td>
					<td><input type="text" name="badge" /></td>
				</tr> --%> 
				
				
		<!-- 도서 카테고리 테이블 -->
				<%-- <tr>
					<td>카테고리 1</td>
				</tr>
				<tr>
					<td>카테고리 2</td>
					<td><input type="text" name="bcategory2" /></td>
				</tr> --%>
				
			
				
				
				<c:forEach items="${dto }" var="dto">
					<tr>
						<%-- <td><input type="radio" name="ca1" />${dto.bcategory1 } >> ${dto.bcategory2 }</td> --%>
						<td>${dto.bcategory1 } >> ${dto.bcategory2 }</td>
					</tr>
				</c:forEach>
				
				<%-- 카테고리
				<c:forEach items="${dto }" var="dto">
					<tr>
						<td><input type="radio" name="category" value="cate" />${dto.bookCategoryDto.bcategory1 } >> ${dto.bookCategoryDto.bcategory2 }</td>
					</tr>
				</c:forEach> --%>
		</table>
		<input type="submit" value="등록" />
		<a href="#">취소</a>
	</form>
	</article>
	
				
	<script>
		document.title = "상품등록";
	</script>
</body>
</html>