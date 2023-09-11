<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 불러오기</title>
</head>
<body>
	<ol class="review-list">
	<c:forEach items="${review }" var="re">
		<li class="review-item">
			<header class="review-card-header">
				<div class="review-card-box">
					<span class="avatar"> </span>
					<div class="info">
						<strong class="username">${re.member.mid }</strong>
						<time datetime="${re.regdate }"> ${re.regdate } </time>
					</div>
				</div>
				<div class="review-card-box2">
					<div class="star-rating">
						<div class="star-back">
							<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
							<i class="fa-solid fa-star"></i>
							<div class="star-front" style="width: ${re.rstar*20.6}%">
								<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
							</div>
						</div>
					</div>
					<!-- 별점끝 -->
				</div>
			</header>

			<div class="review-card-body">
				<c:if test="${re.refilesrc ne null }">
				<div class="review-image">
					<img
						src="${pageContext.request.contextPath}/resources/assets/upload/${re.refilesrc }"
						alt="리뷰 사진" />
				</div>
				</c:if>
				<pre>${re.rcontent }</pre>
			</div>
			</li>
			</c:forEach>
	</ol>
	<!-- pagination-wrap -->
    <div class="pagination-wrap">
        <!-- pagination -->
        <div class="pagination">
            <ol>
			<c:choose>
				<c:when test="${searchVO.page>1}">
					<li><a href="javascript:reviewPage('1')"><i class="fa-solid fa-angles-left"></i></a></li>
					<li><a href="javascript:reviewPage('${searchVO.page-1 }')"><i class="fa-solid fa-angle-left"></i></a></li>
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
							<a href="javascript:reviewPage('${i }')">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${searchVO.page < searchVO.totPage}">
					<li><a href="javascript:reviewPage('${searchVO.page+1 }')"><i class="fa-solid fa-angle-right"></i></a></li>
					<li><a href="javascript:reviewPage('${searchVO.totPage }')"><i class="fa-solid fa-angles-right"></i></a></li>
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
	<%-- <div align="center">
		<!-- 댓글 목록 -->
		<div id="reviewPage">
			<table>
				<c:forEach items="${review }" var="re">
					<tr>
						<td>${re.member.mid }| ${re.regdate }</td>
						<td align="right"><span class="star"> ★★★★★ <span
								id="star2" style="width:${re.rstar*20}%">★★★★★</span> <input
								type="range" value="1" step="1" min="0" max="5">
						</span></td>
					</tr>
					<tr>
						<td height="100px">${re.rcontent }</td>
						<td align="right"><i class="fa-regular fa-thumbs-up"></i></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2" align="center"><c:if
							test="${searchVO.page==1}">
							<i class="fa-solid fa-circle-chevron-left"></i>
						</c:if> <c:if test="${searchVO.page>1}">
							<a href="javascript:reviewPage('${searchVO.page-1 }')"><i
								class="fa-solid fa-circle-chevron-left"></i></a>
						</c:if> <c:forEach begin="${searchVO.pageStart }"
							end="${searchVO.pageEnd }" var="i">
							<c:choose>
								<c:when test="${i eq searchVO.page }">
									<span style="font-weight: bold;">${i }</span>
								</c:when>
								<c:otherwise>
									<a href="javascript:reviewPage('${i }')">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> <c:if test="${searchVO.page < searchVO.totPage}">
							<a href="javascript:reviewPage('${searchVO.page+1 }')"><i
								class="fa-solid fa-circle-chevron-right"></i></a>
						</c:if> <c:if test="${searchVO.page == searchVO.totPage}">
							<i class="fa-solid fa-circle-chevron-right"></i>
						</c:if></td>
				</tr>
			</table>
		</div>
	</div> --%>
</body>
</html>