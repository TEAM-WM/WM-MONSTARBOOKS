<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
</head>
<body>
	<article>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성날짜</th>
					<th>삭제여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${dto }" var="dto">
					<tr>
						<td>${dto.exno }</td>
						<td>${dto.extitle }</td>
						<td>${dto.excontent }</td>
						<td>${dto.exregdate }</td>
						<td>${dto.deleted }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</article>

	<script>
		document.title = "몬스타북스' 관리자";
	</script>
</body>
</html>