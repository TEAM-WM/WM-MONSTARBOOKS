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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
table,tr, td {
	width: 1000px;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
	border-collapse: collapse;
	padding:10px;
}
.right_line{
	border-right: 2px solid #ccc;
}
#cnt {
	margin: 0 30px;
	width: 30px;
	padding: 0;
	text-align: center;
	display: inline;
}
input:read-only {
	background-color: white;
} 
#cart_btn{
	cursor: pointer;
}
#order_btn{
	cursor: pointer;
	background-color: #00084f;
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
/* 수량조절 */
$().ready(function(){
	var i = 1;
	$(".plus_btn").click(function(){
		$("#cnt").val(++i);
		//form submit 막기
		$(".order_form").submit(function(e){
			e.preventDefault();
			$(".order_form").unbind();
		})
	});
	$(".minus_btn").click(function(){
		var cnt = $("#cnt").val();
		if(cnt > 1){
			$("#cnt").val(--i);	
		}
			//form submit 막기
			$(".order_form").submit(function(e){
				e.preventDefault();
				$(".order_form").unbind();
			})
	});
});
/* 장바구니 담기 */
function add_cart(bookno){
	var cnt = $("#cnt").val();
	$.ajax({
		url:'../addCart',
		type:'post',
		data : {
			'memberno' : 1,
			'bookno' : bookno,
			'cnt' : cnt
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
function go_order(){
	$(".order_form").submit();
}
/* 리뷰 페이징 */
function reviewPage(num){
	$.ajax({
		type:"get",
		url:"${pageContext.request.contextPath}/booklist/reviewPage?bookno=${list.bookno}&page="+num,
		success : function(result){
			$("#reviewPage").html(result);	
		}
	});
}
</script>
</head>
<body onload="javascript:reviewPage('1')">
	<!-- 카테고리 분류 -->
	<div align="left">
		<a href="../"><i class="fa-solid fa-house"></i></a> / 
		<a href=""> ${list.category.bcategory1 }</a> / 
		<a href="">${list.category.bcategory2 }</a>
	</div>
	<br /> <br />
	
<!-- 도서 상세 테이블 -->
<div align="center">
	<table>
	
		<tr>
			<td rowspan="7" class="right_line" width="300px">
			<img src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg }"
				alt="책 썸네일 이미지" /></td>
			<td colspan="3"><i class="fa-solid fa-crown" style="color:orange"></i> ${list.detail.badge }</td>
		</tr>
		<tr>
			<td colspan="3"><h2>${list.btitle }</h2>
			<h4>${list.bsubtitle }</h4></td>
		</tr>
		<tr>
			<td colspan="3"><i class="fa-solid fa-star" style="color:orange"></i>
			 ${avg }(${reCnt }개의 리뷰)
			 <span class="star">
		      	  ★★★★★
		        <span id="star2" style="width:${avg*20}%">★★★★★</span>
		        <input type="range" value="1" step="1" min="0" max="5">
			</span>
			 </td>
		</tr>
		<form action="../goOrder" method="post" class="order_form">
		<tr>
			<td class="right_line" align="center" height="70px">	
				<!-- 수량조절버튼 -->
				<b><button class="minus_btn"><i class="fa-solid fa-minus"></i></button>
			
				<input type="text" id="cnt" name="ccount" value="1" readonly/>
				<input type="hidden" name="bookno" value="${list.bookno }"/>
				
				<button class="plus_btn"><i class="fa-solid fa-plus"></i></button></b></td>		
			
			<!-- 장바구니 담기 -->	
			<td class="right_line" id="cart_btn" align="center" onclick="add_cart(${list.bookno})">
				<b>ADD TO CART</b>
			</td>	
			
			<!-- 주문하기 -->
			<td align="center" id="order_btn" onclick="go_order()"><b style="color:#fefefe;">ORDER</b></td>
		</tr>
		 </form>
		<tr>
			<td colspan="3">
			<b style="font-size: 17px; color:orange;">${list.bdiscount }% </b> 
			<b style="font-size: 20px;"><fmt:formatNumber value="${list.bpricesell }" pattern="#,###"/>원</b>
			<span style="text-decoration:line-through; ">
					<fmt:formatNumber value="${list.bprice }" pattern="#,###"/>원 </span></td>
		</tr>
		<tr>
			<td colspan="3">저자 <b>${list.bwriter }</b>  
			| 출판사 <b> ${list.bpublisher }</b> 
			<c:if test=" ${list.btranslator ne null} "> 
				| 번역 <b>${list.btranslator } </b>
			</c:if>
			<br /> 
			<fmt:formatDate value="${list.bpdate }" pattern="yyyy.MM.dd"/> 
			| ${list.detail.bpage }p | ISBN ${list.bisbn }</td>
		</tr>
		<tr>
			<td colspan="3">
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />
			<fmt:formatDate value="${list.bpdate }" pattern="yyyyMMdd" var="pDate" />
			<c:if test="${nowDate < pDate }">
				<fmt:formatDate value="${list.bpdate }" pattern="yyyy년 MM월 dd일"/> 출고예정 		
			</c:if>
			<c:if test="${nowDate >= pDate }">	
				<c:set var="twoDayAfter" value="<%=new Date(new Date().getTime()+60*60*24*1000*2) %>"/>
				<fmt:formatDate value="${twoDayAfter}" pattern="MM월 dd일 (E)"/>
				도착예정 		
			</c:if>
			
			
			</td>
		</tr>
		<tr height="60px">
			<td></td>
		</tr>
		
		<!-- 카테고리 분류 -->
		<tr>
			<td height="100px"><h2>카테고리 분류</h2></td>
			<td><a href="">${list.category.bcategory1 }</a> > 
				<a href="">${list.category.bcategory2 }</a></td>
		</tr>
		
		<!-- 책 정보 -->
		<tr>
			<td><h2>책 정보</h2></td>
			<td align="right" colspan="3">
				<!-- 책 정보 안 테이블 -->
				<table border="1" style="width:500px; height:200px;">
					<tr>
						<td style="background-color:#eee">ISBN</td>
						<td>${list.bisbn }</td>
					</tr>
					<tr>
						<td style="background-color:#eee">발행(출시)일자</td>
						<td><fmt:formatDate value="${list.bpdate }" pattern="yyyy년 MM월 dd일"/></td>
					</tr>
					<tr>
						<td style="background-color:#eee">쪽수</td>
						<td>${list.detail.bpage }쪽</td>
					</tr>
					<tr>
						<td style="background-color:#eee">크기</td>
						<td>${list.detail.bsize }</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="4">${list.detail.bdescription }</td>
		</tr>
		
		<!-- 키워드 픽 -->
		<tr>
			<td><h2>키워드 픽</h2></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<table style="width:950px">
					<tr height="200px" align="center">
						<td class="right_line">추천책1</td>
						<td class="right_line">추천책2</td>
						<td class="right_line">추천책3</td>
						<td class="right_line">추천책4</td>
						<td>추천책5</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<!-- 도서상세 이미지 -->
		<tr>
			<td colspan="4"><img width="800px"
				src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimgdetail }"
				alt="도서 상세 이미지" /></td>
		</tr>
		
		<!-- 독자 리뷰 -->
		<tr>
			<td colspan="4"><h2>독자 리뷰(${reCnt })</h2></td>
		</tr>
			<tr>
				<td colspan="2" height="300px" align="center">
				
				<!-- 차트 -->
				<div style="width:300px; height:200px">		
					<canvas id="starChart"></canvas>
				</div>
				<script>
				var jArray = new Array();
				jArray = '${arr}';
				jArray = JSON.parse(jArray);

				const ctx = document.getElementById('starChart').getContext('2d');
				
				const myChart = new Chart(ctx,{
					type : 'bar',
					data : {
						labels : [
							jArray[0].star,
							jArray[1].star,
							jArray[2].star,
							jArray[3].star,
							jArray[4].star
							],
						datasets : [{
							label : '구매자 별점',
							data : [
								jArray[0].starCnt,
								jArray[1].starCnt,
								jArray[2].starCnt,
								jArray[3].starCnt,
								jArray[4].starCnt
								],
							backgroundColor : [
								'rgba(255, 99, 132, 0.2)',
						       	'rgba(255, 159, 64, 0.2)',
						       	'rgba(54, 162, 235, 0.2)',
						       	'rgba(75, 192, 192, 0.2)',
						       	'rgba(153, 102, 255, 0.2)'
							], 
							borderColor : [
								'rgb(255, 99, 132)',
						     	'rgb(255, 159, 64)',
						     	'rgb(54, 162, 235)',
						     	'rgb(75, 192, 192)',
						     	'rgb(153, 102, 255)'
							],
							borderWidth:3
						}],
					},
					options: {
					    indexAxis: 'y',
					  },
				});
				</script>
				</td>
				<td colspan="2" align="center">
				<b>구매자 총점 ${avg }</b> <br />
				<span class="star">
			      	  ★★★★★
			        <span id="star2" style="width:${avg*20}%">★★★★★</span>
			        <input type="range" value="1" step="1" min="0" max="5">
				</span>
				</td>
			</tr>
		</table>
		
		
		<!-- 댓글 목록 -->
		<div id="reviewPage"></div>
		
			
		<!-- 교환/반품 안내 -->
		<table>	
		<tr>
			<td class="right_line"><h2>교환/반품 안내</h2></td>
			<td class="right_line" align="center"><a href="">교환/반품 신청</a></td>
			<td align="center"><a href="">1:1문의</a></td>			
		</tr>
		<tr>
			<td colspan="4"><b>반품/교환 가능 기간</b> <br /><br />
				변심반품의 경우 수령 후 7일 이내, <br />
				상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내
			</td>
		</tr>
		<tr>
			<td colspan="4"><b>반품/교환 비용</b> <br /><br />
				변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담
			</td>
		</tr>
		<tr>
			<td colspan="4"><b>반품/교환 불가 사유</b> <br /><br />
				1) 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우 <br />
				(단지 확인을 위한 포장 훼손은 제외)<br />
				2) 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우<br />
				예) 화장품, 식품, 가전제품(악세서리 포함) 등<br />
				3) 복제가 가능한 상품 등의 포장을 훼손한 경우<br />
				예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집<br />
				4) 소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)<br />
				5) 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우<br />
				6) 시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우<br />
				7) 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우<br />
			</td>
		</tr>
		<tr>
			<td colspan="4"><b>상품 품절</b> <br /><br />
				공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 
				품절 시 관련 사항에 대해서는 이메일과 문자로 안내드리겠습니다.
			</td>
		</tr>
		<tr>
			<td colspan="4"><b>소비자 피해보상 환불 지연에 따른 배상</b> <br /><br />
				1) 상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁 해결 기준 
				(공정거래위원회 고시)에 준하여 처리됨 <br />
				2) 대금 환불 및 환불지연에 따른 배상금 지급 조건, 
				절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리함
			</td>
		</tr>
	</table>
</div>
	
<script>
	document.title = "몬스타북스 :: 도서 상세 페이지"; 
</script>
</body>
</html>