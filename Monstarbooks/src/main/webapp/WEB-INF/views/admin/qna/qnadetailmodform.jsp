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
	<form action="qnadetailview" method="post">
		<table border="1" width="500">
			<tr>
				<td>
					<select name="qstatus">
						<option value="준비중" ${qnadetail.qstatus == '준비중' ? 'selected' : ''}>준비중</option>
						<option value="답변완료" ${qnadetail.qstatus == '답변완료' ? 'selected' : ''}>답변완료</option>
					</select>
				</td>
				<td>${qnadetail.qcategory }</td>
				<td>${qnadetail.qtitle }</td>
			</tr>
			<tr>
				<td>${qnadetail.member.mid }</td>
				<td>${qnadetail.member.mname }</td>
				<td>${qnadetail.qregdate }</td>
			</tr>
			<tr>
				<td colspan="3">${qnadetail.qcontent }</td>
			</tr>
			<tr>
				<td colspan="3"> 
					<c:if test="${not empty qnadetail.qfilesrc }">
	 	                <img alt="${qnadetail.qfilesrc }" src="${pageContext.request.contextPath}/resources/assets/imgs/qna/${qnadetail.qfilesrc }">
	            	</c:if>
				</td>
				
			</tr>
			<tr>
				<td colspan="3">
					<textarea name="qanswer" cols="50" rows="10">답변을 입력하시요.</textarea>
				</td>
			</tr>
			<input type="hidden" name="qnano" value="${qnadetail.qnano}">
		</table>
		<button type="submit"value="qnadetailview?qnano=${dto.qnano }">수정</button>
		<a href="qnadelete?qnano=${qnadetail.qnano }">문의삭제</a>
	</form>
</body>
</html>
