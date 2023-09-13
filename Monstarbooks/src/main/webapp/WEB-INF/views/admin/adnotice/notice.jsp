<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 관리</title>
<script>
	// 공지등록 버튼을 누를 시 나오는 팝업창
	function insertNotice(){
		if(confirm("새 공지를 작성하시겠습니까?")){
			location.href = "./noticeInsert";
		}else{
			return;
		}
	}
	
</script>
</head>
<body>
<h2>공지사항 관리</h2>
<!-- 검색 -->
<form action="notice" method="post">
    <div>
        <select name="searchType" id="searchType">
            <option value="ntitle" ${ntitle ? 'selected' : ''}>제목</option>
            <option value="ncontent" ${ncontent ? 'selected' : ''}>내용</option>
        </select>
        <input type="text" name="sk" value="${resk }" style="width: 150px;" maxlength="50"/>
        <input type="submit" value="검색"/>
    </div>
</form>
<button onclick="insertNotice();">공지등록</button> <br />
<table width="700" border="1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성날짜</td>
		<td>상세보기</td>
	</tr>
<c:forEach items="${notice }" var="dto">
	<tr>
		<td>${dto.noticeno }</td>
		<td>${dto.ntitle }</td>
		<td>${dto.nwriter }</td>
		<td>${dto.nregdate }</td>
		<td>
			<button>
				<a href="./noticeDetail?noticeno=${dto.noticeno }">상세보기</a>
			</button>
		</td>
	</tr>
</c:forEach>
</table>

<hr />

<!-- paging -->
<form action="notice" method="post">
	<!-- 첫번째 페이지일때, 버튼 비활성화 -->
	<c:if test="${searchVo.page==1 }">
		<button disabled>처음으로</button>
		<button disabled>이전으로</button>
	</c:if>
	
	<!-- 현재페이지 수가 1보다 클 때 / 첫 페이지가 아닐 때 -->
	<c:if test="${searchVo.page>1 }">
		<button><a href="notice?page=1&sk=${sk }&ntitle=${ntitle==true?'ntitle':''}
		&ncontent=${ncontent==true?'ncontent':''}">처음으로</a></button>
		<button><a href="notice?page=${searchVo.page-1 }&sk=${sk}&ntitle=${ntitle==true?'ntitle':''}
		&ncontent=${ncontent==true?'ncontent':''}">이전으로</a></button>
	</c:if>
	
	<!-- 페이지 수 표시 및 클릭 시 이동 -->
	<c:forEach begin="${searchVo.pageStart }" end="${searchVo.pageEnd }" var="i">
		<c:choose>
			<c:when test="${i eq searchVo.page }">
				<span style="color:skyblue; font-weight:bold;">${i }</span>
			</c:when>
			<c:otherwise>
				<a href="notice?page=${i }&sk=${sk}&ntitle=${ntitle==true?'ntitle':''}
				&ncontent=${ncontent==true?'ncontent':''}"
				 style="text-decoration:none;">${i }</a> 
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<!-- 현재 페이지 수가 마지막 페이지 수보다 작을때 / 마지막 페이지가 아닐 때 -->
	<c:if test="${searchVo.page < searchVo.totPage }">
		<button><a href="notice?page=${searchVo.page+1 }&sk=${sk}&ntitle=${ntitle==true?'ntitle':''}
		&ncontent=${ncontent==true?'ncontent':''}">다음으로</a></button>
		<button><a href="notice?page=${searchVo.totPage }&sk=${sk}&ntitle=${ntitle==true?'ntitle':''}
		&ncontent=${ncontent==true?'ncontent':''}">끝으로</a></button>
	</c:if>
	
	<!-- 현재페이지가 마지막페이지일때, 버튼 비활성화 -->
	<c:if test="${searchVo.page==searchVo.totPage }">
		<button disabled>다음으로</button>
		<button disabled>끝으로</button>
	</c:if> <br />		
</form>
</body>
</html>