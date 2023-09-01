<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>
</head>
<body>
	<h2>공지 등록</h2>
	<hr />
	
	<form action="noticeInsert2" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>공지제목</td>
				<td>
					<input type="text" name="ntitle" size="30" maxlength="225" placeholder="제목을 입력하세요" />
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td></td>
				<td>작성날짜</td>
				<td></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea type="text" name="ncontent" rows="10" cols="40" maxlength="1000"
					 placeholder="공지할 내용을 작성하세요(최대 1000자)" style="resize: none"></textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="nfilesrc" />
				</td>
			</tr>
			<tr>
				<td>
					<button><a href="./notice">취소</a></button>
					<input type="submit" value="등록" />
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>