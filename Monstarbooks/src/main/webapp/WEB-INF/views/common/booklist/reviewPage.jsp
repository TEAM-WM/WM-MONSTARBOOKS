<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<style>
table,tr, td {
	width: 1000px;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
	border-collapse: collapse;
	padding:10px;
}
.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}
.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: auto;
}
.star span {
	width: 0;
	position: absolute; 
	left: 0;
	color: orange;
	overflow: hidden;
	
}
</style>
</head>
<body>
<div align="center">
	<!-- 댓글 목록 -->
	<div id="reviewPage">
		<table>
		<c:forEach items="${review }" var="re">
			<tr>
				<td>${re.member.mid } | ${re.regdate }  </td>
				<td align="right">
					<span class="star">
				      	  ★★★★★
				        <span id="star2" style="width:${re.rstar*20}%">★★★★★</span>
				        <input type="range" value="1" step="1" min="0" max="5">
					</span>
				</td>
			</tr>
			<tr>
				<td height="100px">${re.rcontent }</td>
				<td align="right"><i class="fa-regular fa-thumbs-up"></i></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2" align="center">
				<c:if test="${searchVO.page==1}">
					<i class="fa-solid fa-circle-chevron-left"></i>
				</c:if>
				<c:if test="${searchVO.page>1}">
					<a href="javascript:reviewPage('${searchVO.page-1 }')"><i class="fa-solid fa-circle-chevron-left"></i></a>
				</c:if>
				<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i"> 
					<c:choose>
						<c:when test="${i eq searchVO.page }">
							<span style="font-weight:bold;">${i }</span>
						</c:when>
						<c:otherwise>
							<a href="javascript:reviewPage('${i }')">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>	
				
				<c:if test="${searchVO.page < searchVO.totPage}">
					<a href="javascript:reviewPage('${searchVO.page+1 }')"><i class="fa-solid fa-circle-chevron-right"></i></a>
				</c:if>
				<c:if test="${searchVO.page == searchVO.totPage}">
					<i class="fa-solid fa-circle-chevron-right"></i>
				</c:if>
			</td>
		</tr>
		</table>
	</div>
</div>
</body>
</html>