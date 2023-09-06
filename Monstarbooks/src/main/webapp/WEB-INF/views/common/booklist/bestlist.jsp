<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#btn1 {
	width: 120px;
	height: 50px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin : 10px;
	font-size: 15px;
}
table {
	width: 1000px;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
	border-collapse: collapse;
}
td{
	padding:10px;
}
#line {
	border-bottom: 1px solid #ccc;
}
#btn2 {
	width: 100px;
	height: 40px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #e7e7e7;
	font-weight: bold;
}
#btn3 {
	width: 100px;
	height: 40px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #00084f;
	color: white;
	font-weight: bold;
}
.star {
	position: relative;
	font-size: 2rem;
	color: #ddd;
}
.star input {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	opacity: 0;
	cursor: auto;
}
.star span {
	width: 0;
	position: absolute; 
	left: 0;
	color: orange;
	overflow: hidden;
	
}
</style>
<script>
/* 체크박스 전체선택 */
$().ready(function(){
	$("#all_select").click(function(){
		if($("#all_select").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});
});
/* 체크박스 선택 장바구니 담기 */
function cart_add_check(){
	var cnt = $("input[name=chk]:checked").length;
	var arr = new Array();
	$("input[name=chk]:checked").each(function(){
		arr.push($(this).attr('id'));
	});

	 if(cnt == 0){
		alert("선택된 상품이 없습니다.");
	}
	 else{
		$.ajax({
			url : '../addCartCheck',
			type: 'post',
			data: {
				'memberno' : 1,
				'chbox' : arr,
				'cnt' : cnt
				},
			success:function(result){
				if(confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?")){
					location.href='../cart';
				}else{
					return;
				}
			}
		});
	}
}
/* 하나라도 체크해제되면 전체체크박스도 해제 */
function checkbox(c){
	if($("input[name=chk]:checked").length == c){
		$('#all_select').prop('checked',true); 
	}else{
		$('#all_select').prop('checked',false); 
	}
}
/* 장바구니 담기 */
function add_cart(bookno){
	$.ajax({
		url:'../addCart',
		type:'post',
		data : {
			'memberno' : 1,
			'bookno' : bookno,
			'cnt' : 1
			},
		success : function(result){
			if(confirm("장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?")){
				location.href='../cart';
			}else{
				return;
			}
		}
	})
}
/* 바로 주문 */
function go_order(bno){
	$("#bookno").attr("value",bno);
	$(".order_form").submit();
}
</script>
</head>

<body>
<form action="../goOrder" class="order_form" method="post">
	<input type="hidden" name="bookno" id="bookno" value="0"/>
	<input type="hidden" name="ccount" value="1"/>
</form>
	<!-- 카테고리 분류 -->
	<div align="left">
		<a href="../"><i class="fa-solid fa-house"></i></a> / 
		<a href="">베스트셀러</a>
	</div>
	<div align="center">
		<h1>베스트셀러</h1>

		<!-- 전체선택,장바구니 버튼 -->
		<div align="right">
			<input type="checkbox" id="all_select" name="all_select" />
			<label for="all_select"></label> <span>전체선택</span>
			<button type="button" id="btn1" onclick="cart_add_check()">
			<img width="25px" 
				src="${pageContext.request.contextPath}/resources/assets/imgs/icon_cart.svg" alt="장바구니" />
				<b>장바구니</b></button>
				
		<!-- 리스트 테이블 -->
		<table>
			<c:forEach items="${dto }" var="list">
				<tr>
					<td rowspan="5" id="line" width="50px" align="center">
						<input type="checkbox" id="${list.bookno }" name="chk" onclick="checkbox(${totRowCnt})" /> <label for="${list.bookno }"></label>
					</td>
					<td rowspan="5" id="line" align="center" width="150px"><img width="auto" height="200px" 
						src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg }"
						alt="책 썸네일 이미지" /></td>
					<td>순위</td>
					
					<!-- 배송예정일 -->
					<td rowspan="5" id="line" align="center">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />
						<fmt:formatDate value="${list.bpdate }" pattern="yyyyMMdd" var="pDate" />
						<c:if test="${nowDate < pDate }">
							<span style="background-color: lightblue; border-radius: 5px; padding:2px;">예약판매</span> <br />
							<b><fmt:formatDate value="${list.bpdate }" pattern="MM월 dd일 (E)"/></b> <br /> 
							출고예정 		
						</c:if>
						<c:if test="${nowDate >= pDate }">	
							<c:set var="twoDayAfter" value="<%=new Date(new Date().getTime()+60*60*24*1000*2) %>"/>
							<span style="background-color: pink; border-radius: 5px; padding:2px;">배송일정</span> <br />
							<b><fmt:formatDate value="${twoDayAfter}" pattern="MM월 dd일 (E)"/></b> <br />
							도착예정 		
						</c:if>
					
					</td>
					
					<!-- 장바구니, 바로구매 -->
					<td rowspan="5" id="line" align="center">
						<button type="button" id="btn2" onclick="add_cart(${list.bookno})">장바구니</button>
						<br /> <br />
						
						<button type="button" id="btn3" onclick="go_order(${list.bookno})">바로구매</button>
					</td>
				</tr>
				<tr>
					<td><h3>
							<a href="bookdetail?bookno=${list.bookno }">${list.btitle }</a>
						</h3></td>
				</tr>
				<tr>
					<td>${list.bwriter }/${list.bpublisher }</td>
				</tr>
				<tr>
					<td><span style="text-decoration: line-through;">
					<fmt:formatNumber value="${list.bprice }" pattern="#,###"/>원 </span> 
					<b><fmt:formatNumber value="${list.bpricesell }" pattern="#,###"/>원</b>
						(${list.bdiscount }%)</td>
				</tr>
				<tr>
					<td id="line">
					<!-- 평점, 리뷰수 -->
					<i class="fa-solid fa-star" style="color:orange"></i>
					${list.starAvg } (${list.reviewCnt}개의 리뷰)
					 / 
					<!-- 태그 -->
					 ${list.detail.badge }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
	<br />
	
	<!-- 페이징 -->
	<a href=""><i class="fa-solid fa-circle-chevron-left"></i></a>
	
	<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i"> 
		<c:choose>
			<c:when test="${i eq searchVO.page }">
				<span style="font-weight:bold;">${i }</span>
			</c:when>
			<c:otherwise>
				<a href="list?page=${i }" style="text-decoration: none;">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>	
	
	<a href=""><i class="fa-solid fa-circle-chevron-right"></i></a>

	<script>
	document.title = "몬스타북스 :: 베스트셀러";  
	</script>
</body>
</html>