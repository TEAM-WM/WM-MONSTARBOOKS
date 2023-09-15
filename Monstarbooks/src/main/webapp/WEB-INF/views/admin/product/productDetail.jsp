<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세</title>
</head>
<body>
	<!-- <script>
        //원래 날짜 문자열 가져옴
        var dateElement = document.getElementById('dateElement');
        var originalDate = dateElement.textContent;

        // yyyy-mm-dd 형식을 yy-mm-dd 형식으로 변경
        var year = originalDate.slice(2, 4); // 년도의 마지막 2자리 추출
        var monthAndDay = originalDate.slice(5); // 월과 일 추출
        var shortYearDate = year + monthAndDay; // yy-mm-dd 형식으로 조합

        // 변경된 형식으로 HTML 요소 업데이트
        dateElement.textContent = shortYearDate;
    </script> -->
    <article class="admin-table">
	<table class="admin-book-detail">
		<colgroup>
			<col width="150px">
		</colgroup>
		<tbody>
			<!-- 도서 테이블 -->
			<tr>
				<th>도서번호</th>
				<td>${dto.bookno }</td>
			</tr>
			<tr>
				<th>ISBN</th>
				<td>${dto.bisbn }</td>
			</tr>
			<tr>
				<th>도서제목</th>
				<td>${dto.btitle }</td>
			</tr>
			<tr>
				<th>도서부제목</th>
				<td>${dto.bsubtitle }</td>
			</tr>
			<tr>
				<th>출판사</th>
				<td>${dto.bpublisher }</td>
			</tr>
			<tr>
				<th>저자</th>
				<td>${dto.bwriter }</td>
			</tr>
			<tr>
				<th>역자</th>
				<td>${dto.btranslator }</td>
			</tr>
			<tr>
				<th>출간날짜</th>
				<td><fmt:formatDate value="${dto.bpdate }" pattern="yy-MM-dd" /></td>
			</tr>
			<tr>
				<th>정가</th>
				<td>${dto.bprice }</td>
			</tr>
			<tr>
				<th>판매가</th>
				<td>${dto.bpricesell }</td>
			</tr>
			<tr>
				<th>할인율</th>
				<td>${dto.bdiscount }%</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>${dto.bstatus }</td>
			</tr>
			<tr>
				<th>등록날짜</th>
				<td><fmt:formatDate value="${dto.bcdate }" pattern="yy-MM-dd" /></td>
			</tr>
			<tr>
				<th>수정날짜</th>
				<td><fmt:formatDate value="${dto.bmdate }" pattern="yy-MM-dd" /></td>
			</tr>
			<tr>
				<th>재고</th>
				<td>${dto.bstock }</td>
			</tr>

			<!-- 도서 상세 테이블 -->
			<tr>
				<th>썸네일</th>
				<%-- <td><img src="/books/resources/assets/imgs/product/${dto.bookDetailDto.bimg }" width="200" alt="도서썸네일" /></td> --%>
				<td><c:if test="${dto.bookDetailDto.bimg ne null }">
						<div class="product-card-image">
							<img
								src="${pageContext.request.contextPath}/resources/assets/imgs/product/${dto.bookDetailDto.bimg }"
								alt="도서이미지" />
						</div>
					</c:if></td>
			</tr>
			<tr>
				<td colspan="2" style="padding:30px"><img
					src="${pageContext.request.contextPath}/resources/assets/imgs/product/${dto.bookDetailDto.bimgdetail }"
					alt="도서상세이미지" style="max-width:100%;width:auto;"/></td>
			</tr>
			<tr>
				<th>도서설명</th>
				<td style="padding:10px 30px;"><pre>${dto.bookDetailDto.bdescription }</pre></td>
			</tr>
			<tr>
				<th>전체페이지</th>
				<td>${dto.bookDetailDto.bpage }</td>
			</tr>
			<tr>
				<th>도서크기</th>
				<td>${dto.bookDetailDto.bsize }</td>
			</tr>
			<tr>
				<th>상품뱃지</th>
				<td>${dto.bookDetailDto.badge }</td>
			</tr>

			<!-- 도서 카테고리 테이블 -->
			<tr>
				<th>상위 카테고리</th>
				<td>${dto.bookCategoryDto.bcategory1 }</td>
			</tr>
			<tr>
				<th>하위 카테고리</th>
				<td>${dto.bookCategoryDto.bcategory2 }</td>
			</tr>
		</tbody>
	</table>
	</article>
	<div class="btn-box" style="gap: 5px; justify-content:flex-end; margin-top:20px;">
		<a href="productupdateview?bookno=${dto.bookno}&bcategoryno=${dto.bookCategoryDto.bcategoryno }" class="btn-a">
		수정하기
		</a>
		<a href="productlist" class="btn-a text-back">목록</a>
		<a href="productdelete?bookno=${dto.bookno }" class="btn-a gray">삭제</a>
	</div>


	<script>
		document.title = "상품디테일";
	</script>
</body>
</html>