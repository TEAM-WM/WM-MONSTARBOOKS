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
<h1>이벤트 상세보기</h1>
<table>
    <tr>
    	<td>${eventdetail.etitle }</td>
    	<td>${eventdetail.eregdate }</td>
    	<td><a href="">수정</a></td>
    	<td><a href="eventdelete?eventno=${eventdetail.eventno }">삭제</a></td>
    	<td><a href="event">목록</a></td>
    </tr>
    <tr>
    	<td colspan="5">${eventdetail.econtent }</td>
    </tr>
    <tr>
    	<td colspan="5"><img alt="11" src="/books/resources/assets/imgs/coupon/${eventdetail.efilesrc }"></td>
   	</tr>
</table>
</body>
</html>