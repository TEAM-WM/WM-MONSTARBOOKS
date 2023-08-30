<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
</head>
<body>
	<h2>공지 수정</h2>
	
	<form action="noticeUpdate2">
	<input type="hidden" name="noticeno" value="${noticeDetail.noticeno }" />
	<table>
		<tr>
			<td>번호</td>
			<td>${noticeDetail.noticeno }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${noticeDetail.nwriter }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${noticeDetail.nregdate }</td>
		</tr>
		<tr>
			<td>삭제여부</td>
			<td><input type="text" name="deleted" value="${noticeDetail.deleted }" /></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="ntitle" value="${noticeDetail.ntitle }" /></td>
		</tr>
		<tr>
			<td>공지내용</td>
			<td><input type="text" name="ncontent" value="${noticeDetail.ncontent }" /></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>${noticeDetail.nfilesrc }</td>
		</tr>
		<tr>
			<td><input type="submit" value="수정완료" /></td>
			<td>
				<button><a href="./notice">취소</a></button>
			</td>
		</tr>
	</table>
	</form>
	
	
</body>
</html>