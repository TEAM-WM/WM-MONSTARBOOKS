<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
/* 전체체크박스 */
$().ready(function(){
	$("#all_select").click(function(){
		if($("#all_select").is(":checked")){
			$("input[type='checkbox']").prop("checked", true);
		}
		else {
			$("input[type='checkbox']").prop("checked", false);
			$(".product_price").text(0);
			$(".tot_price").text(0);
			$("#product_cnt").text(0);
		}
	});
});
/* 수량조절 */
function count_up(n,p){
	var cnt = Number($(".cnt_"+n).val()); //수량
	var stock = Number($("#bstock").val()); //재고
	if(cnt < stock){//수량이 재고보다 적을때
		$(".cnt_"+n).attr("value",++cnt);
		$.ajax({
			url:'cntUpdate',
			type:'post',
			data : {
				'ccount': $(".cnt_"+n).val(),
				'cartno' : n	
			},success : function(result){
				$(".totPrice_"+n).text((cnt*p).toLocaleString());
				check_sel();
			}
		}); 
	}else{//수량이 재고보다 많을때
		alert("재고를 초과하는 주문은 처리할 수 없습니다. 주문 수량을 확인해주세요.");
	}
	//form submit 막기
	$(".order_form").submit(function(e){
		e.preventDefault();
		$(".order_form").unbind();
	});
} 
function count_down(n,p){
	var cnt = $(".cnt_"+n).val();
	if(cnt > 1){
		$(".cnt_"+n).attr("value",--cnt);
		$.ajax({
			url:'cntUpdate',
			type:'post',
			data : {
				'ccount': $(".cnt_"+n).val(),
				'cartno' : n
			},success : function(result){
				$(".totPrice_"+n).text((cnt*p).toLocaleString());
				check_sel();
			}
		});
	}
	//form submit 막기
	$(".order_form").submit(function(e){
		e.preventDefault();
		$(".order_form").unbind();
	})
}
/* 체크항목의 가격 합계 */
function check_sel(amount){
	var cnt = $("input[name=chk]:checked").length;
	var arr = new Array(); 
	var priceSum = 0;
	var cntSum = 0;
	$("input[name=chk]:checked").each(function(){
		arr.push($(this).val());
	});
	for ( var i in arr) {
		priceSum += Number($(".cnt_"+arr[i]).val())*Number($("#bpricesell_"+arr[i]).val());
		cntSum += Number($(".cnt_"+arr[i]).val());
	}
	$(".product_price").text(priceSum.toLocaleString());
	$(".tot_price").text((priceSum+2500).toLocaleString());
	$("#product_cnt").text(cntSum);
	
	// 하나라도 체크해제되면 전체체크박스도 해제
	if($("input[name=chk]:checked").length == amount){
		$('#all_select').prop('checked',true); 
	}else{
		$('#all_select').prop('checked',false); 
	}
}
/* 선택상품 삭제 */
function cart_delete(){
	var cnt = $("input[type='checkbox']:checked").length;
	var arr = new Array();
	$("input[type='checkbox']:checked").each(function(){
		arr.push($(this).attr('id'));
	});

	 if(cnt == 0){
		alert("선택된 상품이 없습니다.");
	}else {
		$.ajax({
			url : 'cartDelete',
			type: 'post',
			data: {
				'chbox' : arr,
				'cnt' : cnt
				},
			success:function(result){
				location.reload();
			}
		});
	}
}
/* 선택상품 주문 */
function go_order_sel(){
	var cnt = $("input[type='checkbox']:checked").length;
	var cntSum = $("#product_cnt").text();
	if(cnt == 0){
		alert("선택된 상품이 없습니다.");
	}else {
		 if(confirm(cntSum+"개의 상품을 주문하시겠습니까?")){
			 $(".order_form").submit();
		}else{
			return;
		} 
	} 
}  
/* 전체상품 주문 */
function go_order_all(cntSum){
	$("input[name=chk]").prop("checked", true);
	
	if(confirm(cntSum+"개의 상품을 모두 주문하시겠습니까?")){
		 $(".order_form").submit();
	}else{
		return;
	} 
} 
/* 장바구니가 비었을 시 선택상품 주문버튼 누를때 */
function cart_empty_sel(){
	alert('선택된 상품이 없습니다.')
}
/* 장바구니가 비었을 시 전체상품 주문버튼 누를때 */
function cart_empty_all(){
	alert('장바구니에 담긴 상품이 없습니다.')
}
</script>
</head>
<body>
	<article class="cart-wrap">
		<section class="cart-title">
			<h2>장바구니(${cnt })</h2>
			<!-- 주문 단계 -->
			<div class="step-list">
				<ul>
					<li class="active">장바구니</li>
					<li>주문/결제</li>
					<li>결제완료</li>
				</ul>
			</div>
		</section>
		<!-- 장바구니 테이블 -->
		
		<c:choose>
			<c:when test="${cartCnt == 0 }">
				<div class="warning">장바구니가 비었습니다.</div>
				<div class="cart-price">
					<p>
						총 <strong id="product_cnt">0</strong>개의 상품금액 <strong>0</strong>원
					</p>
					<i class="fa-solid fa-plus"></i>
					<p>
						배송비 <strong>0</strong>원
					</p>
					<i class="fa-solid fa-equals"></i>
					<p>
						결제 예정 금액 <strong>0</strong>원
					</p>
				</div>

				<!-- 주문 버튼 -->
				<div class="cart-btn-box">
					<div class="btn-wrap">
						<input type="button" value="선택상품 주문" onclick="cart_empty_sel()" />
						<input type="button" value="전체상품 주문" onclick="cart_empty_all()" />
					</div>
				</div>
			</c:when>
			<c:otherwise>
			<form action="./order" method="post" class="order_form">
				<section class="cart-table-wrap">
					<table>
						<tr>
							<th class="left" colspan="5"><input type="checkbox"
								id="all_select" name="all_select" checked /> <label
								for="all_select"></label> <span>전체선택</span></th>
						</tr>
					<c:forEach items="${dto }" var="list">
					<c:choose>
						<c:when test="${list.list.bstock eq 0}">
							<tr>
								<!-- 체크박스 -->
								<td class="cart-table-checkbox"><input type="checkbox"
									id="${list.cartno }" name="soldout" value="${list.cartno }"/>
									<label for="${list.cartno }"></label>
								</td>
								<!-- 상품 정보 -->
								<td class="cart-table-image">
									<div class="product-card-image">
										<!-- <img
											src="https://contents.kyobobook.co.kr/sih/fit-in/pdt/9788954699075.jpg"
											alt="책 썸네일 이미지" /> -->
										<img
											src="${pageContext.request.contextPath}/resources/assets/imgs/product/${list.detail.bimg}"
											alt="책 썸네일 이미지" />
									</div> 
								</td>
								<!-- 상품 정보 -->
								<td class="left">
									<div class="book-info">
										<div class="product-card-title">
											<h3>
												[${list.category.bcategory1}] 
												<a href="booklist/bookdetail?bookno=${list.bookno }">${list.list.btitle }</a>
											</h3>
										</div>
										<div class="book-price">
											<strong class="discount"> ${list.list.bdiscount }% </strong>
											<span class="price"><fmt:formatNumber value="${list.list.bprice }" pattern="#,###" />원 </span>
										</div>
									</div>
								</td>
								
								<!-- 품절 안내 -->
								<td colspan="2" class="cart-table-price">
									<span class="red">일시품절</span>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
						<tr>
							<!-- 체크박스 -->
							<td class="cart-table-checkbox">
							<input type="checkbox"
									id="${list.cartno }" 
									name="chk" 
									value="${list.cartno }" 
									checked
									onclick="check_sel(${cnt})" /> 
									<label for="${list.cartno }"></label>
							</td>
							<!-- 상품 정보 -->
							<td class="cart-table-image">
								<div class="product-card-image">
									<!-- <img
										src="https://contents.kyobobook.co.kr/sih/fit-in/pdt/9788954699075.jpg"
										alt="책 썸네일 이미지" /> -->
									<img
										src="${pageContext.request.contextPath}/resources/assets/imgs/product/${list.detail.bimg}"
										alt="책 썸네일 이미지" />
								</div> 
							</td>
							<td class="left">
								<div class="book-info">
									<div class="product-card-title">
										<h3>
											[${list.category.bcategory1}] <a href="booklist/bookdetail?bookno=${list.bookno }">${list.list.btitle }</a>
										</h3>
									</div>
									<div class="book-price">
										<strong class="discount"> ${list.list.bdiscount }% </strong>
										<span class="price"><fmt:formatNumber value="${list.list.bprice }" pattern="#,###" />원 </span>
									</div>
								</div>
							</td>
							<!-- 수량조절 -->
							<td class="cart-table-count">
								<div class="book-count">
									<button class="minus_btn_${list.cartno}"
										onclick="count_down(${list.cartno},${list.list.bpricesell })">
										<i class="fa-solid fa-minus"></i>
									</button>
									<input type="text" class="cnt_${list.cartno}" id="cnt"
										name="ccount" value="${list.ccount }" readonly /> <input
										type="hidden" name="bookno" value="${list.bookno }" />
									<button class="plus_btn_${list.cartno}"
										onclick="count_up(${list.cartno},${list.list.bpricesell })">
										<i class="fa-solid fa-plus"></i>
									</button>
								</div>
							</td>
							<!-- 가격 -->
							<td class="cart-table-price">
								<span class="totPrice_${list.cartno }">
									<fmt:parseNumber value="${list.list.bpricesell * list.ccount}"/>
								</span>원
							</td>
						</tr>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					</table>
				</section>
			</form>
		<!-- 쇼핑계속하기, 선택상품 삭제 -->
		<div class="cart-btn-wrap">
			<button type="button" onclick="location.href='./'">쇼핑 계속하기</button>
			<button type="button" onclick="cart_delete()">선택상품 삭제</button>
		</div>
		
		<!-- 총 결제 정보 -->
		<div class="cart-price">
			<p>
				총 <strong id="product_cnt">${cartCnt }</strong>
				개의 상품금액 <strong class="product_price"><fmt:formatNumber value="${totPrice}" pattern="#,###,###" /></strong>원
			</p>
			<i class="fa-solid fa-plus"></i>
			<p>
				배송비 <strong>2,500</strong>원
			</p>
			<i class="fa-solid fa-equals"></i>
			<p>
				결제 예정 금액 <strong><fmt:formatNumber value="${totPrice + 2500}" pattern="#,###,###" /></strong>원
			</p>
		</div>
		
		<!-- 주문 버튼 -->
		<div class="cart-btn-box">
			<div class="btn-wrap">
				<input type="button" value="선택상품 주문" onclick="go_order_sel()" class="go_order_sel"/>
				<input type="button" value="전체상품 주문" onclick="go_order_all(${cartCnt })" />
			</div>
		</div>
		</c:otherwise>
		</c:choose>
	</article>
	<script>
	document.title = "몬스타북스 :: 장바구니"; 
</script>
</body>
</html>