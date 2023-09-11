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
<script>
/* 체크박스 전체선택 */
$().ready(function(){
	$("#all_select").click(function(){
		if($("#all_select").is(":checked")) $("input[name=chk]").prop("checked", true);
		else $("input[name=chk]").prop("checked", false);
	});
});
/* 체크박스 선택 장바구니 담기 */
function cart_add_check(memberno){
	if(memberno != 0){
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
	}else{
		alert("로그인이 필요합니다.");
		location.href="../login";
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
function add_cart(bookno,memberno){
	if(memberno != 0){
		$.ajax({
			url:'../addCart',
			type:'post',
			data : {
				'memberno' : memberno,
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
	}else{
		alert("로그인이 필요합니다.");
		location.href="../login";
	}
}
/* 바로 주문 */
function go_order(bno,memberno){
	if(memberno != 0){
		$("#bookno").attr("value",bno);
		$(".order_form").submit();				
	}else{
		alert("로그인이 필요합니다.");
		location.href="../login";
	}
}
</script>
</head>
<body>
	<article class="book-list-wrap">
        <!-- 카테고리 분류 -->
        <section class="breadcrumb-wrap">
            <ul>
                <li>
                    <a href="../">
                        <i class="fa-solid fa-house"></i>
                    </a>
                </li>
                <li>
                    <a href="">베스트셀러 </a>
                </li>
                <li>
                    <a href="">종합 베스트 </a>
                </li>
            </ul>
        </section>
		<section class="book-section-wrap">
		<jsp:include page="/WEB-INF/views/tiles/include/listMenu.jsp">
			<jsp:param name="asideTitle" value="베스트셀러" />
		</jsp:include>
		<form action="../goOrder" class="order_form" method="post">
			<input type="hidden" name="bookno" id="bookno" value="0" />
			<input type="hidden" name="ccount" value="1" />
		</form>
		
		<!-- book-list-content -->
        <div class="book-list-content">
            <!-- 전체선택,장바구니 버튼 -->
            <div class="book-item-group">
                <div class="all-select">
                    <input type="checkbox" id="all_select" name="all_select" />
                    <label for="all_select"></label>
                    <span>전체선택</span>
                </div>
                <button type="button" onclick="cart_add_check(${memberno })" class="cart-btn">
                    장바구니
                </button>
            </div><!-- book-item-content -->
            <!-- 리스트 시작 -->
            <ul class="book-list">
            	<c:forEach items="${dto }" var="list">
                <li>
                    <div class="book-check">
                        <input type="checkbox" id="${list.bookno }" name="chk"
                                onclick="checkbox(${totRowCnt})" />
                        <label for="${list.bookno }"></label>
                    </div><!-- 체크박스 -->
                    <div class="product-card-image">
                    	<img
						src="${pageContext.request.contextPath}/resources/assets/imgs/book/${list.detail.bimg }"
						alt="책 썸네일 이미지" />
                    </div><!-- 책이미지 -->
                    <div class="book-info">
                        <span class="rank">순위???</span>
                        <div class="product-card-title">
                            <h3>
                                <a href="bookdetail?bookno=${list.bookno }">${list.btitle }</a>
                            </h3>
                        </div>
                        <strong aria-label="저자 / 출판사" class="product-card-author">${list.bwriter } · ${list.bpublisher }</strong>
                        <div class="book-price">
                            <strong class="discount">
                                ${list.bdiscount }%
                            </strong>
                            <strong class="sell">
                                <fmt:formatNumber value="${list.bpricesell }" pattern="#,###" />원
                            </strong>
                            <span class="price">
                                <fmt:formatNumber value="${list.bprice }" pattern="#,###" />원
                            </span>
                        </div>
                        <div class="book-review">
                            <!-- 평점, 리뷰수 -->
                            
                            <!-- ${list.starAvg } (${list.reviewCnt}개의 리뷰) -->
                            <p class="book-star">
                                ${list.starAvg }
                                <span>  
                                    (${list.reviewCnt}개의 리뷰)
                                </span>
                            </p>
                            <!-- 태그 -->
                            <div class="book-badge">
                                ${list.detail.badge }
                            </div>
                        </div>
                    </div><!-- 책 박스 끝 -->
                    <!-- 재고가 0일때 -->
					<c:choose>
						<c:when test="${list.bstock == 0 }">
						<div class="book-order">
							<strong class="red">    
	                            일시품절
	                        </strong>
	                    </div>
						</c:when>
						<c:otherwise>
						
						<!-- 재고가 0이 아닐때 -->	
						<!-- 배송예정일 -->
						<div class="book-order">
							<jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate" />
							<fmt:formatDate value="${list.bpdate }" pattern="yyyyMMdd" var="pDate" />
							<c:if test="${nowDate < pDate }">
								<span>예약판매</span>
		                        <strong>
		                            <fmt:formatDate value="${list.bpdate }" pattern="MM월 dd일 (E)"/>
		                        </strong>
		                        <p>
		                            출고예정
		                        </p>		
							</c:if>
							<c:if test="${nowDate >= pDate }">	
								<c:set var="twoDayAfter" value="<%=new Date(new Date().getTime()+60*60*24*1000*2) %>"/>	
								<span>배송일정</span>
		                        <strong>
		                            <fmt:formatDate value="${twoDayAfter}" pattern="MM월 dd일 (E)"/>
		                        </strong>
		                        <p>
		                            도착예정
		                        </p>
							</c:if>
						</div>
						<!-- 장바구니, 바로구매 -->
						<div class="book-btn-wrap">
	                        <button type="button" 
	                        onclick="add_cart(${list.bookno},${memberno })">
	                            장바구니
	                        </button>
	
	                        <button type="button" 
	                        onclick="go_order(${list.bookno},${memberno })">
	                            바로구매
	                        </button>
	                    </div>
						</c:otherwise>
					</c:choose>
                </li>
                </c:forEach>
            </ul>
            <!-- 리스트 끝 -->
        </div><!-- book-list-content -->
		</section>
	</article>
	<%-- <!-- 카테고리 분류 -->
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
			<button type="button" id="btn1" onclick="cart_add_check(${memberno })">
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
					
				<!-- 재고가 0일때 -->
				<c:choose>
					<c:when test="${list.bstock == 0 }">
						<td rowspan="5">일시품절</td>
						<td rowspan="5"></td>
					</c:when>
					<c:otherwise>
					
				<!-- 재고가 0이 아닐때 -->	
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
						<button type="button" id="btn2" onclick="add_cart(${list.bookno},${memberno })">장바구니</button>
						<br /> <br />
						
						<button type="button" id="btn3" onclick="go_order(${list.bookno},${memberno })">바로구매</button>
					</td>
					</c:otherwise>
				</c:choose>
					
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
						<b style="color:orange">${list.bdiscount }%</b></td>
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
	<br /> --%>
	
	<!-- pagination-wrap -->
    <div class="pagination-wrap">
        <!-- pagination -->
        <div class="pagination">
            <ol>
			<c:choose>
				<c:when test="${searchVO.page>1}">
					<li><a href="bestlist?page=1"><i class="fa-solid fa-angles-left"></i></a></li>
					<li><a href="bestlist?page=${searchVO.page-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a>
							<i class="fa-solid fa-angles-left"></i>
						</a>
					</li>
					<li class="disabled">
						<a>
							<i class="fa-solid fa-angle-left"></i>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
			<!-- 14 -->
			<c:forEach begin="${searchVO.pageStart }" end="${searchVO.pageEnd }" var="i">
				<c:choose>
					<c:when test="${i eq searchVO.page }">
						<!-- 내가 클릭한 페이지의 숫자랑 같냐 -->
						<li class="current-page">
							<a>
								${i }
							</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="bestlist?page=${i }">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${searchVO.page < searchVO.totPage}">
					<li><a href="bestlist?page=${searchVO.page+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
					<li><a href="bestlist?page=${searchVO.totPage }"><i class="fa-solid fa-angles-right"></i></a></li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a>
							<i class="fa-solid fa-angle-right"></i>
						</a>
					</li>
					<li class="disabled">
						<a>
							<i class="fa-solid fa-angles-right"></i>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
            </ol>
        </div>
        <!-- pagination -->
    </div>
    <!-- pagination-wrap -->
	<script>
	document.title = "몬스타북스 :: 베스트셀러";  
	</script>
</body>
</html>