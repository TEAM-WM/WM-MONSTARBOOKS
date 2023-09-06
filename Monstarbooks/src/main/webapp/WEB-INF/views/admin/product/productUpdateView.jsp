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
<h3>productUpdateView.jsp</h3>

	<article>
	<form action="productupdate" method="post">
	<input type="hidden" name="bookno" value="${dtos.bookno }" />
	<!-- 도서 테이블 -->
		<label for="" style="font-size: 20px;">도서 테이블</label>
		
		<label>도서번호: ${dtos.bookno }</label>
		
		<label for="bisbn">ISBN</label>
		<div class="form-small">
			<input type="text" name="bisbn" value="${dtos.bisbn }" />
			<input type="button" value="ISBN 검색" />
		</div>
		
		<label for="btitle">도서제목</label>
		<input type="text" name="btitle" value="${dtos.btitle }" />
		
		<label for="bsubtitle">도서부제목</label>
		<input type="text" name="bsubtitle" value="${dtos.bsubtitle }" />
		
		<label for="bpublisher">출판사</label>
		<input type="text" name="bpublisher" value="${dtos.bpublisher }" />
		
		<label for="bwriter">저자</label>
		<input type="text" name="bwriter" value="${dtos.bwriter }" />
		
		<label for="btranslator">역자</label>
		<input type="text" name="btranslator" value="${dtos.btranslator }" />
		
		<label for="bpdate">출간일</label>
		<input type="text" name="bpdate" value="${dtos.bpdate }" />
		
		<label for="bprice">정가</label>
		<input type="text" name="bprice" value="${dtos.bprice }" />
		
		<label for="bpricesell">판매가</label>
		<input type="text" name="bpricesell" value="${dtos.bpricesell }" />
		
		<label for="bdiscount">할인율</label>
		<input type="text" name="bdiscount" value="${dtos.bdiscount }" />
		
		<label for="bstatus">상태</label>
		<input type="text" name="bstatus" value="${dtos.bstatus }" />
		
		<!-- <label for="bcdate">생성일</label>
		<input type="text" name="bcdate" /> -->
		
		<%-- <label for="bmdate">수정일</label>
		<input type="text" name="bmdate" value="${dtos.bmdate }" /> --%> 
		
		<label for="bstock">재고</label>
		<input type="text" name="bstock" value="${dtos.bstock }" />
		
					
			
	<!-- 도서 상세 테이블 -->
		<label for="" style="font-size: 20px;">도서 디테일 테이블</label>
		
		<label for="bimg">도서썸네일</label>
		<input type="text" name="bimg" value="${dtos.bookDetailDto.bimg }" />
		
		<label for="bimgdetail">도서상세이미지</label>
		<input type="text" name="bimgdetail" value="${dtos.bookDetailDto.bimgdetail }" />
		
		<label for="bdescription">도서설명</label>
		<input type="text" name="bdescription" value="${dtos.bookDetailDto.bdescription }" />
		
		<label for="bpage">전체페이지</label>
		<input type="text" name="bpage" value="${dtos.bookDetailDto.bpage }" />
		
		<label for="bsize">도서크기</label>
		<input type="text" name="bsize" value="${dtos.bookDetailDto.bsize }" />
		
		<label for="badge">상품뱃지</label>
		<input type="text" name="badge" value="${dtos.bookDetailDto.badge }" />
						
				
	<!-- 도서 카테고리 테이블 -->
		<label for="" style="font-size: 20px;">도서 카테고리 테이블</label>	
				
			<c:set var="selectedValue" value="${selectedValue}" />
			<div>
				<label for="">카테고리</label>
					<c:forEach items="${dto }" var="dto">
					<tr>
						<td><input type="radio" name="bcategoryno" value="${dto.bcategoryno }"
						<c:if test="${dto.bcategoryno eq selectedValue}">checked</c:if> />
						${dto.bcategory1 } >> ${dto.bcategory2 }</td>
					</tr>
				</c:forEach>
			</div>
				
				
				
				
				
			<!-- 	<label for="bcategory">카테고리</label>
					<form action="" method="post">
			    		<select name="category1" id="category1">
				          <option>----- 상위 카테고리 -----</option>
				          <option value="국내도서">국내도서</option>
				          <option value="외국도서">외국도서</option>
				        </select>
				        <select name="category2" id="category2">
				          <option>----- 하위 카테고리 -----</option>
				          <option value="소설">소설</option>
				          <option value="시">시</option>
				          <option value="경제">경제</option>
				          <option value="에세이">에세이</option>
				          <option value="요리">요리</option>
				          <option value="문화">문화</option>
				        </select>
					</form> -->
					
		<br />
		<br />
		<br />
		<br />
		<br />
			
			
				
				
				
		
		<input type="submit" value="수정하기" />
		<a href="productlist">목록으로</a>
	</form>
	</article>
	
				
	<script>
		document.title = "상품수정";
	</script>
</body>
</html>