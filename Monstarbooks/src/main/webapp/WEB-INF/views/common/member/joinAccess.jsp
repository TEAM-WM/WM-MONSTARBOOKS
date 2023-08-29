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
	<div class="join-success">
		<i class="fa-solid fa-circle-check"></i>
		<h2>회원가입이 완료되었습니다.</h2>
		<h4>
			<strong>
				${dto.mname }
			</strong>
			님 가입을 환영합니다.
		</h4>
		<h6>
			MONSTARBOOKS의 회원이 되신 것을 환영합니다!<br>
			로그인하시면 더욱 다양한 서비스와 혜택을 제공받으실 수 있습니다.
		</h6>
		<div class="btn-wrap">
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/'">
				메인으로
			</button>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/login'">
				로그인
			</button>
		</div>
	</div>
</body>
</html>