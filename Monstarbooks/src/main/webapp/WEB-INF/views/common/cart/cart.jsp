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
<style>
table, tr {
	width: 1200px;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
	border-collapse: collapse;
	text-align: center;
}
td {
	padding: 10px;
}
#cnt {
	margin: 0 30px;
	width: 30px;
	padding: 0;
	text-align: center;
	display: inline;
}
#btn2 {
	width: 100px;
	height: 40px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #e7e7e7;
	font-weight: bold;
}
.cart_price {
	border: 2px solid #000d82;
	border-radius: 10px;
	height: 100px;
	display: flex;
	justify-content: center;
	align-items: center;
	width:1200px;
}
input:read-only {
	background-color: white;
} 
</style>
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
	<h1 align="left" style="margin: 30px;">장바구니(${cnt })</h1>

	<!-- 주문 단계 -->
	<div align="right">
		<b>장바구니</b> <i class="fa-solid fa-circle-chevron-right"></i> <span
			style="color: lightgray;">주문/결제 <i
			class="fa-solid fa-circle-chevron-right" style="color: lightgray;"></i>
			결제완료
		</span>
	</div>

	<br />
	<br />
	<!-- 장바구니 테이블 -->
	<div align="left">
	<form action="./order" method="post" class="order_form">
		<c:choose>
			<c:when test="${cartCnt == 0 }">
				<div style="height: 250px; width: 1200px">
					<h2> <br /> 장바구니가 비었습니다. <br /> <br /> </h2>
						<i class="fa-regular fa-face-sad-tear fa-5x"></i>
				</div>
				<div align="center" class="cart_price">
					<h3>
						총 0개의 상품금액 0원 &nbsp;<i class="fa-solid fa-plus"></i> &nbsp; 배송비 0원
						&nbsp; <i class="fa-solid fa-equals"></i> &nbsp; 결제 예정 금액 0원
					</h3>
				</div>
				<br />
				
				<!-- 주문 버튼 -->
				<div align="right" style="width: 1200px" >
					<input type="button" value="선택상품 주문" onclick="cart_empty_sel()"
						style="width: 200px; display: inline;" /> 
						<input type="button" value="전체상품 주문" onclick="cart_empty_all()"
						style="width: 200px; display: inline; color: white; background-color: #00084f" />
				</div>
			</c:when>

			<c:otherwise>
				<table>
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="50%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<tr height="50px">
						<th><input type="checkbox" id="all_select" name="all_select" onclick="all_select()" checked />
							<label for="all_select"></label></th>
						<th colspan="2">상품 정보</th>
						<th>수량</th>
						<th>가격</th>
					</tr>
					
				<!-- 재고가 0일때 -->
				<c:forEach items="${dto }" var="list">
					<c:choose>
						<c:when test="${list.list.bstock eq 0}">
								<tr>
									<td><input type="checkbox" id="${list.cartno }" name="soldout" value="${list.cartno }" />
										<label for="${list.cartno }"></label></td>
									
									<!-- 상품 정보 -->
									<td><img
										src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg}"
										alt="책 썸네일 이미지" /></td>
									<td align="left"><b style="font-size: large">[${list.category.bcategory1}도서]
											${list.list.btitle }</b> <br /> <br /> <b><span
											style="color: orange">${list.list.bdiscount }%</span> 
											<fmt:formatNumber value="${list.list.bprice }" pattern="#,###" />원</b></td>
		
									<!-- 품절 안내 -->
									<td colspan="2">일시품절</td>
								</tr>
						</c:when>

						<c:otherwise>						
						<tr>
							<!-- 체크박스 -->
							<td><input type="checkbox" id="${list.cartno }" name="chk" value="${list.cartno }"
								checked onclick="check_sel(${cnt})"/>
								<label for="${list.cartno }"></label></td>

							<!-- 상품 정보 -->
							<td><img
								src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg}"
								alt="책 썸네일 이미지" /></td>
							<td align="left"><b style="font-size: large"><a href="booklist/bookdetail?bookno=${list.bookno }">
									[${list.category.bcategory1}도서] ${list.list.btitle }</a></b> <br /> <br /> 
									<b> <span style="color: orange">${list.list.bdiscount }%</span> 
									<fmt:formatNumber value="${list.list.bprice }" pattern="#,###" />원</b></td>
									
									
							<!-- 수량조절 -->
							<td><b><button class="minus_btn_${list.cartno}"
										onclick="count_down(${list.cartno},${list.list.bpricesell })">
										<i class="fa-solid fa-minus"></i>
									</button> <input type="text" class="cnt_${list.cartno}" id="cnt"
									name="ccount" value="${list.ccount }" readonly/>

									<input type="hidden" id="bstock" value="${list.list.bstock }"/>
									<input type="hidden" id="bpricesell_${list.cartno}" value="${list.list.bpricesell }"/>
									
									<button class="plus_btn_${list.cartno}"
										onclick="count_up(${list.cartno},${list.list.bpricesell })">
										<i class="fa-solid fa-plus"></i>
									</button></b></td>
									
							<!-- 가격 -->
							<td>
							<span class="totPrice_${list.cartno }"><fmt:formatNumber value="${list.list.bpricesell * list.ccount }" 
								pattern="#,###" /></span>원</td>
						</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</table>
			</form>
	</div>
	<br />

	<!-- 쇼핑계속하기, 선택상품 삭제 -->
	<div align="right">
		<button type="button" id="btn2" onclick="history.back()"
			style="background-color: #f7f7f7; color: gray;">
			<i class="fa-solid fa-chevron-left" style="color: gray;"></i> 쇼핑 계속하기
		</button>
		<button type="button" id="btn2" onclick="cart_delete()">선택상품
			삭제</button>
	</div>

	<br />
	<br />

	<!-- 총 결제 정보 -->
	<div align="center" class="cart_price">
		<h3>
			총 <span id="product_cnt">${cartCnt }</span>개의 상품금액 
			<span class="product_price"><fmt:formatNumber value="${totPrice}" pattern="#,###,###" /></span>
			원 &nbsp;	<i class="fa-solid fa-plus"></i> &nbsp; 배송비 2,500원 &nbsp; 
			<i class="fa-solid fa-equals"></i> &nbsp; 결제 예정 금액 
			<span class="tot_price"><fmt:formatNumber value="${totPrice + 2500}" pattern="#,###,###" /></span>원
		</h3>

	</div>
	
	<br />

	<!-- 주문 버튼 -->
	<div align="right">
		<input type="button" value="선택상품 주문" onclick="go_order_sel()" class="go_order_sel"
			style="width: 200px; display: inline;" /> <input type="button"
			value="전체상품 주문" onclick="go_order_all(${cartCnt })"
			style="width: 200px; display: inline; color: white; background-color: #00084f" />
	</div>

	</c:otherwise>
	</c:choose>
	
	<script>
	document.title = "몬스타북스 :: 장바구니"; 
</script>
</body>
</html>