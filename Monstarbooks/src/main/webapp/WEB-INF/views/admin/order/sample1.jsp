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
	<h1>sample1.jsp</h1>
	
	<c:forEach items="${dto }" var="dto">
		${dto.exno }
		${dto.extitle }
    	${dto.excontent }
    	${dto.exregdate }
    	${dto.deleted } <br/>
	</c:forEach>
<script>
	document.title = "몬스타북스' 주문관리자"; 
</script>
</body>
</html>