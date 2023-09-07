<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>1:1문의상세</h1>
	<form action="qnadetailmodform" method="post">
		<table border="1" width="500">
			<tr>
				<td>${qnadetail.qstatus }</td>
				<td>${qnadetail.qcategory }</td>
				<td>${qnadetail.qtitle }</td>
			</tr>
			<tr>
				<td>${qnadetail.member.mid }</td>
				<td>${qnadetail.member.mname }</td>
				<td><fmt:formatDate value="${qnadetail.qregdate }" pattern="yy-MM-dd" /></td>
			</tr>
			<tr>
				<td colspan="3">${qnadetail.qcontent }</td>
			</tr>
			<tr>
				<td colspan="3"><img alt="aa" src="/books/resources/assets/imgs/qna/aaa.png"></td>
			</tr>
			 <tr>
				<td colspan="3">
					${qnadetail.qanswer }
				</td>
			</tr>
			<input type="hidden" name="qnano" value="${qnadetail.qnano}">
		</table>
		<button type="submit">답변달기</button>
		<button><a href="list">목록</a></button>
	</form>
</body>
</html>
