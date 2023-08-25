<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 상세</title>
</head>
<body>
	<h3>공지 상세</h3>
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
			<td>첨부파일</td>
			<td>${noticeDetail.nfilesrc }</td>
		</tr>
		<tr>
			<td>
				<button><a href="./noticeUpdate?noticeno=${noticeDetail.noticeno }">공지 수정</a></button>
				<button><a href="./notice">목록</a></button>
			</td>
		</tr>
	</table>
	
		
</body>
</html>