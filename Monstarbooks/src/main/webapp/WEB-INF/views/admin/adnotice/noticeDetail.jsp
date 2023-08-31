<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세</title>
<script>
	function updateNotice(){
		if(confirm("공지를 수정하시겠습니까?")){
			location.href = "./noticeUpdate?noticeno=${noticeDetail.noticeno }";
		}else {
			return;
		}
	}
</script>
</head>
<body>
	<h3>공지 상세</h3>
	<hr />
	
	<table>
		<tr>
			<td>번호</td>
			<td>${noticeDetail.noticeno }</td>
			<td>제목</td>
			<td>${noticeDetail.ntitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${noticeDetail.nwriter }</td>
			<td>작성날짜</td>
			<td>${noticeDetail.nregdate }</td>
		</tr>

		<tr>
			<td>삭제여부</td>
			<td>${noticeDetail.deleted }</td>
		</tr>
		<tr>
			<td>공지내용</td>
			<td>${noticeDetail.ncontent }</td>
		</tr>
		<tr>
			<td rowspan="2">첨부파일</td>
			<td>
				<c:if test="${noticeDetail.nfilesrc ne null }">
					<img border="1" width="75" height="75"
					 src="../../resources/assets/upload/${noticeDetail.nfilesrc }" alt="${noticeDetail.nfilesrc }" />
				</c:if>
			</td>
		</tr>
		<tr> </tr>
		<tr>
			<td>
				<button onclick="updateNotice();">공지 수정</button>
				<button><a href="./notice">목록</a></button>
			</td>
		</tr>
	</table>
	
	<hr />
	
	<%-- <button>
		<a href="./noticeDetail?noticeno=${noticeDetail.noticeno -1}">이전 글</a>
	</button>
	<button>
		<a href="./noticeDetail?noticeno=${noticeDetail.noticeno +1}">다음 글</a>
	</button> --%>
		
</body>
</html>