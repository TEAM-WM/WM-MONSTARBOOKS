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
<c:choose>
		<c:when test="${isSuccess }">
			<script>
				alert("로그인 되었습니다.");
				location.href="${url }";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("아이디와 비밀번호를 다시 확인해주세요.");
				location.href="${pageContext.request.contextPath }/login?url=${encodedUrl }";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>