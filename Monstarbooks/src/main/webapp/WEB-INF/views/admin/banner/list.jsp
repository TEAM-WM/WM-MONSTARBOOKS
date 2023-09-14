<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    // 검색 결과가 없을 때 알림창을 표시하는 함수
    function showNoResultsAlert() {
        alert("검색 결과가 없습니다.");
    }

    // 페이지 로딩 시 검색 결과 여부를 확인하고 알림창을 표시
    window.onload = function() {
        var resultContainer = document.getElementById("resultContainer");
        if (resultContainer.getElementsByTagName("tr").length <= 1) { // 첫 번째 행은 테이블 헤더이므로 길이가 1 이하면 검색 결과 없음
            showNoResultsAlert();
        }
    }
</script>
</head>
<body>
<h1>배너목록</h1>
<form action="list" method="post">
    <div style="display: inline-block; margin-right: 10px;">
        <select name="searchType" id="searchType">
            <option value="etitle" ${etitle ? 'selected' : ''}>제목</option>
            <option value="efilesrc" ${efilesrc ? 'selected' : ''}>파일명</option>
        </select>
    </div>
    <div style="display: inline-block; margin-right: 10px;">
        <input type="text" name="sk" value="${resk}" style="width: 150px;" maxlength="50"/>
    </div>
    <div style="display: inline-block;">
        <input type="submit" value="검색"/>
    </div>
</form>
<%-- 	<form action="bannerwriteview" method="post">
	    <input type="hidden" name="e_etitle" value="${list.e_etitle}">
	    <input type="submit" value="등록"> 
	</form> --%>
	<a href="bannerwriteview">등록</a>
	<div id="resultContainer">
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
					<td><fmt:formatDate value="${list.eregdate}" pattern="yy-MM-dd" /></td>
					<td><a href="bannerdetail?bannerno=${list.bannerno }">상세보기</a>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	</div>
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