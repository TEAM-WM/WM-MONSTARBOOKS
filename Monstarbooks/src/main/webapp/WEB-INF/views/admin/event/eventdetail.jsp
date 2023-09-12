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
<h1>eventdetail</h1>
<table>
    <tr>
    	<td>${eventdetail.etitle }</td>
    	<td>${eventdetail.econtent }</td>
    	<td>${eventdetail.efilesrc }</td>
    	<td>${eventdetail.eregdate }</td>
    	<td><a href="eventdelete?eventno=${eventdetail.eventno }">삭제</a></td>
   	</tr>
</table>
</body>
</html>