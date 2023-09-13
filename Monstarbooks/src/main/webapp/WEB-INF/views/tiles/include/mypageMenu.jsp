<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<aside class="aside-wrap">
	<h2>마이페이지</h2>
	<div class="profile-thumb-box">
	    <a href="${pageContext.request.contextPath}/myprofile/list" class="btn-profile">
	        <span class="thumb-box">
	        	<c:if test="${not empty param.img }">
	            	<img src="${pageContext.request.contextPath}/resources/assets/upload/${param.img }" alt="프로필이미지"/>
	            </c:if>
	        </span>
	        </a>
	        <h4>
	            <strong>${param.name }</strong>
	            님
	        </h4>
	    </div>
	    <nav>
	        <ul>
	            <li class="aside-sub">
	                <a href="${pageContext.request.contextPath}/myprofile/list">내 정보 관리</a>
	            </li>
	            <li>
	                <a href="">회원정보 수정</a>
	            </li>
	            <li>
	                <a href="${pageContext.request.contextPath}/myprofile/view?mid=${param.id }">프로필 변경</a>
	            </li>
	            <li class="aside-sub">
	                <a href="${pageContext.request.contextPath}/myprofile/myprofile_order">주문/배송목록</a>
	            </li>
	            <li class="aside-sub">
	                <a href="${pageContext.request.contextPath}/myreview/list">리뷰</a>
	            </li>
	            <li class="aside-sub">
	                <a href="${pageContext.request.contextPath}/mycoupon/couponbox">쿠폰함</a>
	            </li>
	            <li class="aside-sub">
	                <a href="${pageContext.request.contextPath}/qna/list">1:1문의</a>
	            </li>
	        </ul>
	    </nav>
	</aside>
</body>
</html>