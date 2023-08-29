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
	<div class="step-list">
		<ul>
			<li>약관동의</li>
			<li>정보입력</li>
			<li class="active">가입완료</li>
		</ul>
	</div>
	<i class="fa-solid fa-door-open"></i>
	<h2>회원가입이 완료되었습니다.</h2>
	${dto.mname }님 가입을 환영합니다.
</body>
</html>