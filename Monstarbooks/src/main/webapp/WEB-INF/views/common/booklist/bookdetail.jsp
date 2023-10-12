<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$().ready(function(){
/* 수량조절 */
	var i = 1;
	var stock = Number($("#bstock").val()); 
	$(".plus_btn").click(function(){
		console.log($("#cnt").val());
		if(Number($("#cnt").val()) < stock){//수량이 재고보다 적을때
			$("#cnt").val(++i);		
		}else{//수량이 재고보다 많을때
			alert("재고를 초과하는 주문은 처리할 수 없습니다. 주문 수량을 확인해주세요.");
		}
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
function add_cart(bookno,memberno){
	if(memberno != 0){
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
	}else{
		alert("로그인이 필요합니다.");
		location.href="../login";
	}
}
/* 바로 주문 */
function go_order(memberno){
	if(memberno != 0){
		$(".order_form").submit();				
	}else{
		alert("로그인이 필요합니다.");
		location.href="../login";
	}
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

var btitle = "${list.btitle}";
console.log("btitle: " + btitle);
</script>
</head>
<body onload="javascript:reviewPage('1')">
	<article class="book-list-wrap">
		<!-- 카테고리 분류 -->
		<section class="breadcrumb-wrap">
			<ul>
				<li><a href="../"> <i class="fa-solid fa-house"></i>
				</a></li>
				<li><a href="">${list.category.bcategory1 } </a></li>
				<li><a href="">${list.category.bcategory2 } </a></li>
			</ul>
		</section>

		<%
    String btitle = request.getParameter("btite");
    %>

		<!-- 책 상단 -->
		<section class="book-section-wrap">
			<!-- book-detail-content -->
			<div class="book-detail-content">
				<!-- 책 상세 시작 -->
				<div class="product-card-image">
					<img
						src="${pageContext.request.contextPath}/resources/assets/imgs/product/${list.detail.bimg }"
						alt="책 썸네일 이미지" />
				</div>
				<!-- 책이미지 -->
				<div class="book-info">
					<div class="book-info-box">
						<!-- 태그 -->
						<div class="book-badge">
							<i class="fa-solid fa-crown"></i> ${list.detail.badge }
						</div>
						<div class="product-card-title">
							<h3>${list.btitle }</h3>
							<c:if test="${list.bsubtitle }">
								<h4>${list.bsubtitle }</h4>
							</c:if>
						</div>
						<strong aria-label="저자 / 출판사" class="product-card-author">${list.bwriter }
							· ${list.bpublisher }</strong>
						<div class="book-price">
							<strong class="discount"> ${list.bdiscount }% </strong> <strong
								class="sell"> <fmt:formatNumber
									value="${list.bpricesell }" pattern="#,###" />원
							</strong> <span class="price"> <fmt:formatNumber
									value="${list.bprice }" pattern="#,###" />원
							</span>
						</div>
						<!-- 책가격 -->

						<div class="book-detail-info">
							<c:if test=" ${list.btranslator ne null} ">
								<p>
									<strong> <span>번역</span> ${list.btranslator }
									</strong>
								</p>
							</c:if>
							<p>
								<strong> <span>출간일</span> <fmt:formatDate
										value="${list.bpdate }" pattern="yyyy.MM.dd" />
								</strong>
							</p>
							<p>
								<strong> <span>쪽수</span> ${list.detail.bpage }p
								</strong>
							</p>
							<p>
								<strong> <span>ISBN</span> ${list.bisbn }
								</strong>
							</p>
						</div>
						<!-- 책 디테일 info -->
						<div class="book-review">
							<!-- 평점, 리뷰수 -->

							<!-- ${list.starAvg } (${list.reviewCnt}개의 리뷰) -->
							<p class="book-star">
								${avg } <span> (${reCnt }개의 리뷰) </span>
							</p>
							<!-- 별점 시작 -->
							<div class="star-rating">
								<div class="star-back">
									<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<div class="star-front" style="width:${avg*20.6}%">
										<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</div>
								</div>
							</div>
							<!-- 별점끝 -->
						</div>
						<!-- book-review -->
						<!-- 배송 예정 날짜 -->
						<div class="book-order">
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />
							<fmt:formatDate value="${list.bpdate }" pattern="yyyyMMdd"
								var="pDate" />

							<c:if test="${nowDate < pDate }">
								<span class="aqua">배송일정</span>
								<strong> <fmt:formatDate value="${list.bpdate }"
										pattern="yyyy년 MM월 dd일" />
								</strong>
								<p>출고예정</p>
							</c:if>
							<c:if test="${nowDate >= pDate }">
								<span>배송일정</span>
								<c:set var="twoDayAfter"
									value="<%=new Date(new Date().getTime()+60*60*24*1000*2) %>" />
								<strong> <fmt:formatDate value="${twoDayAfter}"
										pattern="MM월 dd일 (E)" />
								</strong>
								<p>도착예정</p>
							</c:if>
						</div>

					</div>
					<!-- book-info-box -->
					<form action="../goOrder" method="post" class="order_form">
						<c:choose>
							<c:when test="${list.bstock == 0 }">
								<!-- 재고가 0일때 -->
								<div class="book-soldout">
									<span>품절되었습니다.</span>
								</div>
							</c:when>
							<c:otherwise>
								<!-- 재고가 0이 아닐때 -->
								<div class="book-btn-wrap">
									<div class="book-count">
										<button class="minus_btn">
											<i class="fa-solid fa-minus"></i>
										</button>
										<input type="text" id="cnt" name="ccount" value="1" readonly />
										<button class="plus_btn">
											<i class="fa-solid fa-plus"></i>
										</button>
									</div>
									<input type="hidden" name="bookno" value="${list.bookno }" />
									<input type="hidden" id="bstock" value="${list.bstock }" />
									<!-- 장바구니 담기 -->
									<button type="button" class="cartto-btn"
										onclick="add_cart(${list.bookno},${memberno })">ADD
										TO CART</button>

									<button type="button" onclick="go_order(${memberno })">
										ORDER</button>
								</div>
								<!-- 책 버튼 -->
							</c:otherwise>
						</c:choose>
					</form>
				</div>
				<!-- 책 박스 -->
			</div>
			<!-- book-detail-content -->
		</section>
		<section class="book-section-wrap book-intro-wrap">
			<!-- 책 상세정보 -->
			<div class="book-intro">
				<h3>책소개</h3>
				<div>
					<h4>카테고리 분류</h4>
					<p>${list.category.bcategory1 } &gt; ${list.category.bcategory2 }
					</p>
				</div>
			</div>
			<!-- 책 상세 정보 끝 -->

			<div class="book-info-table-wrap">
				<h4>책 정보</h4>
				<table class="book-info-table">
					<tbody>
						<tr>
							<th scope="row">ISBN</th>
							<td>${list.bisbn }</td>
						</tr>
						<tr>
							<th scope="row">발행(출시)일자</th>
							<td><fmt:formatDate value="${list.bpdate }"
									pattern="yyyy년 MM월 dd일" /></td>
						</tr>
						<tr>
							<th scope="row">쪽수</th>
							<td>${list.detail.bpage }쪽</td>
						</tr>
						<tr>
							<th scope="row">크기</th>
							<td>${list.detail.bsize }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="book-recommend-wrap">
				<h3>키워드픽</h3>
				<ul>
					<!--
					<c:forEach var="item"  begin="0" end="4" step="1" varStatus="status">
						<li>
							<div class='product-card'>
								<div class='product-card-image'>
									<img
										src='https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791165796396.jpg'
										alt=''>
								</div>
								<div class='product-card-title'>
									<h3>아기 판다 푸바오아기 판다 푸바오 아기 판다 푸바오</h3>
								</div>
								<strong aria-label='저자 / 출판사' class='product-card-author'>
									에버랜드 외 · 시공주니어</strong>
							</div>
						</li>
					</c:forEach>
					-->
					<c:forEach var="item" begin="0" end="4" step="1" varStatus="status">
						<li>
							<div class='product-card'>
								<div class='product-card-image'>
									<img
										src="${pageContext.request.contextPath}/resources/assets/imgs/product/${recbooklist[item].detail.bimg }"
										alt=''>
								</div>
								<div class='product-card-title'>
									<h3>
										<a
											href="bookdetail?btitle5=${recbooklist[item].btitle } &bookno=${recbooklist[item].bookno }">
											${recbooklist[item].btitle }</a>
									</h3>
								</div>
								<strong aria-label='저자 / 출판사' class='product-card-author'>
									${recbooklist[item].bwriter } · ${recbooklist[item].bpublisher }</strong>
							</div>
						</li>
					</c:forEach>

					<%-- <c:forEach var="item" items="${recbooklist }" varStatus="status">
						<li>
							<div class='product-card'>
								<div class='product-card-image'>
									<img
										src='https://contents.kyobobook.co.kr/sih/fit-in/458x0/pdt/9791165796396.jpg'
										alt=''>
								</div>
								<div class='product-card-title'>
									<h3>${item.btitle }</h3>
								</div>
								<strong aria-label='저자 / 출판사' class='product-card-author'>
									에버랜드 외 · 시공주니어</strong>
							</div>
						</li>
					</c:forEach> --%>
				</ul>
			</div>
			<!-- 키워드픽 종료 -->
			<div class="book-info-img">
				<img
					src="${pageContext.request.contextPath}/resources/assets/imgs/product/${list.detail.bimgdetail }"
					alt="상세 이미지">
			</div>
			<div class="book-info-text">
				<pre>${list.detail.bdescription }</pre>
			</div>


			<!-- 리뷰 -->
			<div class="book-review-wrap">
				<h3>
					리뷰 <strong> ${reCnt } </strong>
				</h3>
				<div class="review-scoreboard">
					<div class="score-summary">

						<h5>사용자 총점</h5>
						<div class="score-star">
							<!-- 별점 시작 -->
							<div class="star-rating">
								<div class="star-back">
									<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
									<i class="fa-solid fa-star"></i>
									<div class="star-front" style="width: ${avg*20.6}%">
										<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
										<i class="fa-solid fa-star"></i>
									</div>
								</div>
							</div>
							<!-- 별점끝 -->
							<strong class="average-score" aria-label="평점"> ${avg } </strong>
						</div>
						<!-- score-star -->
					</div>
					<!-- score-summary -->
					<div class="score-detail">
						<dl class="score-stats-list">
							<c:set var="totalStarCnt" value="0" />
							<c:forEach items="${arr}" var="item">
								<c:set var="totalStarCnt" value="${totalStarCnt + item.starCnt}" />
							</c:forEach>
							<c:forEach items="${arr}" var="item">
								<c:set var="oneStarRatio"
									value="${totalStarCnt != 0 ? (item.starCnt / totalStarCnt) * 100 : 0}" />
								<div class="score-stats-item">
									<dt>${item.star}점</dt>
									<dd>
										<div class="bar-graph" aria-hidden>
											<div class="active-bar" style="width: ${oneStarRatio}%"></div>
										</div>
										<strong class="count">${item.starCnt}</strong>
									</dd>
								</div>
							</c:forEach>

						</dl>
					</div>
					<!--score-detail-->
				</div>
				<!-- review-scoreboard -->

				<!-- 리뷰 목록 -->
				<div id="reviewPage"></div>


			</div>
			<!-- 리뷰 끝 -->

			<!-- 반품 / 교환 -->
			<!-- 교환 반품 안내 -->
			<div class="book-return-title">
				<h3>반품/교환 안내</h3>
				<div class="book-return-btn">
					<a href="">교환/반품 신청</a> <a href="">1:1문의</a>
				</div>
			</div>
			<div class="book-return-item">
				<h4>반품/교환 가능 기간</h4>
				<p>
					변심반품의 경우 수령 후 7일 이내,<br> 상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내
				</p>
			</div>
			<div class="book-return-item">
				<h4>반품/교환 비용</h4>
				<p>변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담</p>
			</div>
			<div class="book-return-item">
				<h4>반품/교환 불가 사유</h4>
				<pre>
1&#41; 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우
(단지 확인을 위한 포장 훼손은 제외)
2&#41; 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우
예&#41; 화장품, 식품, 가전제품(악세서리 포함) 등
3&#41; 복제가 가능한 상품 등의 포장을 훼손한 경우
예&#41; 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집
4&#41; 소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)
5&#41; 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우
6&#41; 시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우
7&#41; 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우</pre>
			</div>
			<div class="book-return-item">
				<h4>상품 품절</h4>
				<p>공급사(출판사) 재고 사정에 의해 품절/지연될 수 있으며, 품절 시 관련 사항에 대해서는 이메일과 문자로
					안내드리겠습니다.</p>
			</div>
			<div class="book-return-item">
				<h4>소비자 피해보상 환불 지연에 따른 배상</h4>
				<p>
					1&#41; 상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁 해결 기준
					(공정거래위원회 고시)에 준하여 처리됨<br> 2&#41; 대금 환불 및 환불지연에 따른 배상금 지급 조건,
					절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리함
				</p>
			</div>
			<!-- 반품 / 교환 종료 -->
		</section>
	</article>
	<!-- 리스트 종료 -->

	<!-- 도서 상세 테이블 -->
	<%-- <div align="center">
	<table>
	
		
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
								jArray[0].starCnt === 0 ? undefined : jArray[0].starCnt,
								jArray[1].starCnt === 0 ? undefined : jArray[1].starCnt,
								jArray[2].starCnt === 0 ? undefined : jArray[2].starCnt,
								jArray[3].starCnt === 0 ? undefined : jArray[3].starCnt,
								jArray[4].starCnt === 0 ? undefined : jArray[4].starCnt
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
		
		
		
</div> --%>
	<script>
	document.title = "몬스타북스 :: 도서 상세 페이지"; 
</script>
</body>
</html>