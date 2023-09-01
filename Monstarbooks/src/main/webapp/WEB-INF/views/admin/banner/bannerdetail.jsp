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
<h1>배너 상세보기</h1>
<table>
	<tr>
		<td>${bannerdetail.etitle }</td>
	</tr>
	<tr>
		<td><img alt="aa" src=""></td>
	</tr>
</table>
<a href="">수정</a>
<a href="bannerdelete?bannerno=${bannerdetail.bannerno }">삭제</a>
</body>
</html>