<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>
	.admin-container{
		overflow: hidden;
	}
</style>
</head>
<body>
	<article class="space" style="margin-bottom: 15px;">
		<div class="admin-count">
			<strong>${totRowcnt }</strong>건
		</div>
		<button type="button" class="btn-a w100"
			onclick="location.href='productinsertview'">상품등록</button>
	</article>


	<%-- 	<img src="${pageContext.request.contextPath}/resources/assets/imgs/kyobo.jpg" witdh="200" height="200" alt="" /> --%>
	<%-- <img
		src="https://monstarbuck.s3.ap-northeast-2.amazonaws.com/imgs/%EA%B8%B0%EC%97%AC%EC%96%B4.png"
		alt="aws 버킷 테스트" />
	<h3>AWS 버킷 테스트</h3>
	<img
		src="${pageContext.request.contextPath}/resources/assets/imgs/product/기여어.png"
		alt="테스트이미지" width="100" /> --%>

	<!-- 상품등록 버튼 -->



	<table>
	<colgroup>
		<col width="80px">
		<col width="auto">
		<col width="250px">
		<col width="auto">
		<col width="auto">
		<col width="auto">
		<col width="auto">
		<col width="300px">
		<col width="auto">
	</colgroup>
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서이미지</th>
				<th>도서제목</th>
				<!-- <th>출판사</th>
				<th>저자</th> -->
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
					<td>
						<div class="product-card-image">
							<img
								src="${pageContext.request.contextPath}/resources/assets/imgs/product/${dto.bookDetailDto.bimg }"
								alt="도서이미지" />
						</div>
					</td>
					<td>
					
						<div class="book-info">
                        <div class="product-card-title">
                            <h3>
                                ${dto.btitle }
                            </h3>
                        </div>
                        <strong aria-label="저자 / 출판사" class="product-card-author">${dto.bwriter } · ${dto.bpublisher }</strong>
                        <div class="book-price">
                            <span class="price">
                                ${dto.bprice }원
                            </span>
                        </div>
                    </div>
					</td>
					<td><span class="text-back">
						${dto.bstatus }
					</span></td>
					<td>${dto.bcdate }</td>
					<td>${dto.bmdate }</td>
					<td>${dto.bstock }</td>
					<td>${dto.bisbn }</td>
					<td><a href="productdetail?bookno=${dto.bookno }">상세보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 검색시작 -->
	<!-- 조건 드롭다운 메뉴 -->
	<form action="productlist" method="get" class="admin">
		<div class="search-wrap">
			<div class="search-box">
				<select name="searchType" id="searchType">
					<option value="bisbn"
						<c:if test="${bisbn eq true }">selected</c:if>>ISBN</option>
					<option value="btitle"
						<c:if test="${btitle eq true }">selected</c:if>>도서제목</option>
					<option value="bpublisher">출판사</option>
					<option value="bwriter">저자</option>
				</select>
				<!-- 검색어, 검색버튼 -->
				<input type="text" name="sk" value="${resk }" />
				<button type="submit" class="search-icon">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>
		</div>
	</form>
	
	<!-- pagination-wrap -->
        <div class="pagination-wrap">
            <!-- pagination -->
            <div class="pagination">
                <ol>
				<c:choose>
					<c:when test="${searchVO.page>1}">
						<li><a href="productlist?page=1"><i class="fa-solid fa-angles-left"></i></a></li>
						<li><a href="productlist?page=${searchVO.page-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a>
								<i class="fa-solid fa-angles-left"></i>
							</a>
						</li>
						<li class="disabled">
							<a>
								<i class="fa-solid fa-angle-left"></i>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
				<!-- 14 -->
				<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
					<c:choose>
						<c:when test="${i eq searchVO.page }">
							<!-- 내가 클릭한 페이지의 숫자랑 같냐 -->
							<li class="current-page">
								<a>
									${i }
								</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="productlist?page=${i }&sk=${searchKey }&bisbn=${bisbn==true?'bisbn':''}&btitle=${btitle==true?'btitle':''}">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${searchVO.page < searchVO.totPage}">
						<li><a href="productlist?page=${searchVO.page+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
						<li><a href="productlist?page=${searchVO.totPage }"><i class="fa-solid fa-angles-right"></i></a></li>
					</c:when>
					<c:otherwise>
						<li class="disabled">
							<a>
								<i class="fa-solid fa-angle-right"></i>
							</a>
						</li>
						<li class="disabled">
							<a>
								<i class="fa-solid fa-angles-right"></i>
							</a>
						</li>
					</c:otherwise>
				</c:choose>
               </ol>
            </div>
            <!-- pagination -->
        </div>
        <!-- pagination-wrap -->
	<%-- <!-- 페이징 -->
	<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }"
		var="i">
		<c:choose>
			<c:when test="${i eq searchVO.page }">
				<span style="color: red; font-weight: bold;">${i }</span>
			</c:when>
			<c:otherwise>
				<a
					href="productlist?page=${i }&sk=${searchKey }&bisbn=${bisbn==true?'bisbn':''}&btitle=${btitle==true?'btitle':''}"
					style="text-decoration: none;">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach> --%>

	<script>
		document.title = "몬스타북스 :: 관리자 도서리스트";
	</script>
</body>
</html>