<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		전체 회원 : 
		${totRowcnt }
	</div>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>권한</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입날짜</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${dto }" var="dto">
				<tr>
					<td>${dto.memberno }</td>
					<td>
						<strong>${dto.mauthority }</strong><br>
						<form action="list/status" method="post" style="width:auto">
							<input type="hidden" name="no" value="${dto.memberno }"/>
							<select name="status" id="userStatus">
								<option value="관리자" <c:if test="${dto.mauthority eq '관리자' }">selected</c:if>>관리자</option>
								<option value="사용자" <c:if test="${dto.mauthority eq '사용자' }">selected</c:if>>사용자</option>
							</select>
							<button type="submit">수정</button>
						</form>
					</td>
					<td>${dto.mid }</td>
					<td>${dto.mname }</td>
					<td>${dto.memail }</td>
					<td>${dto.to_regdate }</td>
					<td><a href="detail?memberNo=${dto.memberno}">상세보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<form action=""></form>
	
	<form action="list" method="post" style="width:1000px;">
		<div class="search-wrap">
			<p>
				전체글 : ${totRowcnt }<br />
				현재페이지/토탈페이지 : ${searchVO.page } / ${searchVO.totPage }
			</p>
			<div>
				<select name="searchType" id="searchType">
					<option value="mid" <c:if test="${mid eq true }">selected</c:if>>아이디</option>
					<option value="mname" <c:if test="${mname eq true }">selected</c:if>>이름</option>
				</select>
				<input type="text" name="sk" style="width:150px;" maxlength="50" value="${searchKey }"/>
				<button type="submit" class="search-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
		</div>
		
		<ul class="paging">
			<c:choose>
				<c:when test="${searchVO.page>1}">
					<li><a href="list?page=1"><i class="fa-solid fa-angles-left"></i></a></li>
					<li><a href="list?page=${searchVO.page-1 }"><i class="fa-solid fa-circle-chevron-left"></i></a></li>
				</c:when>
				<c:otherwise>
					<li><i class="fa-solid fa-angles-left" style="color:#cecece"></i></li>
					<li><i class="fa-solid fa-circle-chevron-left" style="color:#cecece"></i></li>
				</c:otherwise>
			</c:choose>
			<!-- 14 -->
			<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
				<c:choose>
					<c:when test="${i eq searchVO.page }">
						<!-- 내가 클릭한 페이지의 숫자랑 같냐 -->
						<li><span >${i }</span></li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="list?page=${i }&sk=${searchKey }&mid=${mid==true?'mid':''}&mname=${mname==true?'mname':''}">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${searchVO.page < searchVO.totPage}">
					<li><a href="list?page=${searchVO.page+1 }"><i class="fa-solid fa-circle-chevron-right"></i></a></li>
					<li><a href="list?page=${searchVO.totPage }"><i class="fa-solid fa-angles-right"></i></a></li>
				</c:when>
				<c:otherwise>
					<li><i class="fa-solid fa-circle-chevron-right" style="color:#cecece"></i></li>
					<li><i class="fa-solid fa-angles-right" style="color:#cecece"></i></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</form>
</body>
</html>