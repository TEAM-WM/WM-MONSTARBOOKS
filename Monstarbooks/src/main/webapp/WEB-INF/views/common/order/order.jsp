<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
table{
	width: 1200px;
	border-top: 2px solid #ccc;
	border-bottom: 2px solid #ccc;
	border-collapse: collapse;
	text-align: center;
}
td {
	padding: 0px 10px;
}
.under_line{
	border-bottom: 2px solid #ccc;
}
#addr_btn{
	width : 100%;
	height: 50px;
	border : 2px solid #ccc;
	border-radius: 5px;
}
#coupon{
	width : 100%;
	height: 50px;
	border : 2px solid #ccc;
	border-radius: 5px;
}
input[type="radio"] {
	display: inline;
	width: 20px;
}
label{
	display: inline;
}
#pay_btn{
	width:40%;
	background-color: #00084f;
	color:white;
}
#addr{
	display: none;
}
input:read-only {
	background-color: white;
}  
</style>
<script>
function addr_write(){
	sample6_execDaumPostcode();
}
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }
            var addr_layer = document.getElementById('addr');
            addr_layer.style.display ='block';

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
/* 보유 쿠폰 확인 */
function coupon_check(){
	let popOption = "width=600px, height=600px, top=300px, left=300px,scrollbars=yes";
	let openUrl = 'mycoupon'
	window.open(openUrl,'pop',popOption);
}
/* function orderList(){
	$.ajax({
		type:"get",
		url:"/orderList",
		success : function(result){
			$("#orderList").html(result);	
		}
	});
} */
</script>
</head>
<body>
	<h1 align="left">주문 / 결제</h1>
	
		<!-- 주문 단계 -->
	<div align="right">
		<span style="color: lightgray;">장바구니 <i class="fa-solid fa-circle-chevron-right" style="color: lightgray;"></i></span> 
		<b>주문/결제</b> <i class="fa-solid fa-circle-chevron-right"></i>
			<span style="color: lightgray;">결제완료</span>
	</div>

	<br />
	<br />
	
	<!-- 배송지 정보 -->
	<table>
		<tr>
			<th width="30%" height="150px">배송지 정보</th>
			<td><i class="fa-solid fa-location-dot"></i>
				<b style="color:#00084f;">&nbsp;배송지를 등록해주세요.</b> <br /><br />
				<button id="addr_btn" onclick="addr_write()"><i class='fa-solid fa-pen-to-square'></i>&nbsp;배송지 입력</button>
				<div id="addr">
					<input type="text" id="sample6_postcode" placeholder="우편번호" readonly>
					<input type="text" id="sample6_address" placeholder="주소" style="width:50%;display: inline;" readonly>
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="width:49%;display: inline;"readonly>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요">
					<input type="text" placeholder="받는 분 성함" style="width:50%;display: inline;"/>
					<input type="text" placeholder="받는 분 연락처" style="width:49%;display: inline;"/>
				</div>
			</td>
		</tr>
	</table>
	
	<br /><br /><br />
	
	<!-- 주문 상품 정보 -->
	<!-- <div id="orderList"></div> -->
	<table>
		<colgroup>
			<col width="10%">
			<col width="20%">
			<col width="40%">
			<col width="15%">
			<col width="15%">
		</colgroup>
		<tr height="50px" class="under_line">
			<th colspan="2">주문상품</th>
			<td colspan="3">총 ${cnt }개</td>
		</tr>
		<c:forEach items="${dto }" var="list">
		<tr height="150px" class="under_line">
			<td><img src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg}" 
				alt="책 썸네일 이미지" width="70%"/></td>
			<td colspan="2" align="left">
			<b style="font-size: large">[${list.category.bcategory1}도서] 
				${list.list.btitle } </b> <br /><br /> 
				<b><span style="color: orange">${list.list.bdiscount }%</span> 
				<fmt:formatNumber value="${list.list.bprice }" pattern="#,###" />원</b></td>
			<td>${list.ccount }개</td>
			<td><fmt:formatNumber value="${list.list.bpricesell * list.ccount}" 
				pattern="#,###,###" />원</td>
		</tr>
		</c:forEach>
	</table>
	
	<br /><br /><br />
	
	<!-- 할인쿠폰 -->
	<table>
		<tr>
			<th width="30%" height="150px">할인쿠폰</th>
			<td><button id="coupon" onclick="coupon_check()">
				<i class="fa-solid fa-money-check-dollar"></i>&nbsp;보유 쿠폰 확인</button></td>
		</tr>
	</table>
	
	<br /><br /><br />
	
	<!-- 결제 정보 -->
	<table>
		<colgroup>
			<col width="30%">
			<col width="70%">
		</colgroup>
		<tr height="50px" class="under_line">
			<th>결제 정보</th>
			<td></td>
		</tr>
		<tr height="40px">
			<th>상품금액</th>
			<td align="left"><fmt:formatNumber value="${totPrice}" 
				pattern="#,###,###" />원</td>
		</tr>
		<tr height="40px">
			<th>쿠폰할인</th>
			<td align="left">- ###,###원</td>
		</tr>
		<tr height="40px">
			<th>배송비</th>
			<td align="left">+ 2,500원</td>
		</tr>
		<tr height="40px">
			<th>총 결제금액</th>
			<td align="left"><b><fmt:formatNumber value="${totPrice + 2500}" 
				pattern="#,###,###" />원</b></td>
		</tr>
		<tr>
			<th>결제 방법</th>
			<td align="left">
				<label for="pay_1"><input type="radio" name="payment" value="pay_1" id="pay_1"/> 
					계좌이체</label>
				<label for="pay_2"><input type="radio" name="payment" value="pay_2" id="pay_2"/> 
					신용/체크카드</label>
				<label for="pay_3"><input type="radio" name="payment" value="pay_3" id="pay_3"/> 
					휴대폰</label>
				<label for="pay_4"><input type="radio" name="payment" value="pay_4" id="pay_4"/> 
					무통장입금(가상계좌)</label>
			</td>
		</tr>
	</table>
	
	<br /><br /><br />
	
	<!-- 할인쿠폰 -->
	<table>
		<tr>
			<th width="30%" height="150px">주문 상품 정보 동의</th>
			<td align="left"> 주문할 상품의 상품명, 가격, 배송정보 등을 최종 확인하였으며, 구매에 동의합니다. <br />
			(전자상거래법 제 8조 2항)</td>
			<td width="20%"><input type="checkbox" id="order_agree" name="order_agree" />
				<label for="order_agree"></label></td>
		</tr>
	</table>
	
	<br /><br /><br />
	
	<!-- 결제하기 -->
	<div align="center">
		<input type="button" value="결제하기" id="pay_btn"/>
	</div>
	
	<script>
	document.title = "몬스타북스 :: 주문하기"; 
</script>
</body>
</html>