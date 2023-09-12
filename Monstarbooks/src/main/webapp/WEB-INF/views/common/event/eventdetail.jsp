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
<table>
	<tr>
		<td><h1>${eventdetail.etitle }</h1></td>
	</tr>
	<tr>
		<td>${eventdetail.eregdate }</td>
	</tr>
	<tr>
		<td> <img alt="${eventdetail.efilesrc }" src="/books/resources/assets/imgs/coupon/${eventdetail.efilesrc }"> </td>
	</tr>
</table>
<script>
	document.title = "몬스타북스 :: 샘플페이지"; 
</script>
</body>
</html>