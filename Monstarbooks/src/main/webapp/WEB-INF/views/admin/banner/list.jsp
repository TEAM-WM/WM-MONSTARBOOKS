<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>배너목록</h1>
<form action="list" method="post">
	<div>
		<c:choose>
			<c:when test="${etitle }">
				<input type="checkbox" name="searchType" value="etitle" checked/>	
			</c:when>
			<c:otherwise>
				<input type="checkbox" name="searchType" value="etitle"/>
			</c:otherwise>
		</c:choose>
		제목
		<c:choose>
			<c:when test="${efilesrc }">
				<input type="checkbox" name="searchType" value="efilesrc" checked/>
			
			</c:when>
			<c:otherwise>
				<input type="checkbox" name="searchType" value="efilesrc"/>
			</c:otherwise>
		</c:choose>
		파일명
		<input type="text" name="sk" value="${resk }" style="width 150px;" maxlength="50"/>
		<input type="submit" value="검색"/>
	</div>
</form>
	<a href="bannerwriteview">등록</a>
	<table>
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>첨부파일명</td>
			<td>작성날짜</td>
			<td>상세보기</td>
		</tr>
		<c:forEach items="${list}" var="list">
			<c:if test="${list.event.deleted ne 'yes'}">
				<tr>
					<td>${list.bannerno }</td>
					<td>${list.etitle }</td>
					<td>${list.efilesrc }</td>
					<td>${list.eregdate }</td>
					<td><a href="bannerdetail?bannerno=${list.bannerno }">상세보기</a>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<hr />
	<c:if test="${searchVO.page>1 }">
		<a href="list?page=1" style="text-decoration: none;">처음</a>
		<a href="list?page=${searchVO.page-1 }" style="text-decoration: none;">이전</a>
	</c:if>
	<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }"
		var="i">
		<c:choose>
			<c:when test="${i eq searchVO.page }">
				<span style="color: red; font-weight: bold;">${i }</span>
			</c:when>
			<c:otherwise>
				<a href="list?page=${i }" style="text-decoration: none;">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${searchVO.page < searchVO.totPage }">
		<a href="list?page=${searchVO.page+1 }" style="text-decoration: none;">다음</a>
		<a href="list?page=${searchVO.totPage }"
			style="text-decoration: none;">마지막</a>
	</c:if>
</body>
</html>