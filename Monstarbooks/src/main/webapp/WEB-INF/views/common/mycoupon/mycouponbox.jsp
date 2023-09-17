<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 쿠폰함</title>
<style>
  /* 스타일을 적용할 div 요소의 클래스 및 스타일 설정 */
  .coupon-item {
    display: flex;
    /* align-items: center; */
	align-items: flex-start; /* Align items at the top */
    padding: 10px;
    padding-left: 100px;
    margin-bottom: 15px;
  /* border: 1px solid #ddd;  */
	border-bottom: 1px solid black;
  }

  .coupon-image {
    width: 350px;
    height: auto;
    margin-right: 80px;
  }

  .coupon-details {
    flex-grow: 1;
  }

  .coupon-name {
    font-size: 17px;
    font-weight: bold;
    margin-bottom: 15px;
  }

  .coupon-price {
    color: #33322e;
    font-weight: bold;
    margin-bottom: 7px;
  }

</style>
</head>
<body>
  <article class="mypage-wrap">
    <section class="mypage-section-wrap">
      <jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp"></jsp:include>
      <div class="mypage-content-box">
        <div class="mypage-title">
          <h3>나의 쿠폰함</h3>
        </div>
        <div class="mypage-content bn">
          <div class="coupon-list">
            <c:forEach var="mycp" items="${mcoupon}" varStatus="loop">

              <div class="coupon-item">
                <c:choose>
                   <c:when test="${mycp.cpstatus eq 'N' && mycp.coupon.cpstatus eq 'FALSE' && mycp.coupon.cpname eq '신규가입 할인쿠폰'}">
                    <img class="coupon-image" src="${pageContext.request.contextPath}/resources/assets/imgs/coupon/coupon0.png" alt="쿠폰이미지">
                    <div class="coupon-details">
                      <div class="coupon-name">${mycp.coupon.cpname}</div>
                      <div class="coupon-price">${mycp.coupon.cpprice} 원</div>
                      <div class="coupon-dates">
                        <fmt:formatDate value="${mycp.cprdate}" pattern="yyyy.MM.dd" /> - 
                        <fmt:formatDate value="${mycp.coupon.cpvalid}" pattern="yyyy.MM.dd" />
                      </div>
                     <div>
              			<input type="hidden" name="cpstatus" value="${mycp.cpstatus }" />
              			<input type="hidden" name="cpstatus" value="${mycp.coupon.cpstatus }" />
                     </div>
                    </div>
                  </c:when>
                  <c:when test="${mycp.cpstatus eq 'N' && mycp.coupon.cpstatus eq 'FALSE' && mycp.coupon.cpname eq 'WMBOOK 개업 이벤트'}">
                    <img class="coupon-image" src="${pageContext.request.contextPath}/resources/assets/imgs/coupon/coupon1.png" alt="쿠폰이미지">
                    <div class="coupon-details">
                      <div class="coupon-name">${mycp.coupon.cpname}</div>
                      <div class="coupon-price">${mycp.coupon.cpprice} 원</div>
                      <div class="coupon-dates">
                        <fmt:formatDate value="${mycp.cprdate}" pattern="yyyy.MM.dd" /> - 
                        <fmt:formatDate value="${mycp.coupon.cpvalid}" pattern="yyyy.MM.dd" />
                      </div>
                     <div>
              			<input type="hidden" name="cpstatus" value="${mycp.cpstatus }" />
              			<input type="hidden" name="cpstatus" value="${mycp.coupon.cpstatus }" />
                     </div>
                    </div>
                  </c:when>
                  <c:when test="${mycp.cpstatus eq 'N' && mycp.coupon.cpstatus eq 'FALSE' && mycp.coupon.cpname eq '가을은 독서 이벤트'}">
                    <img class="coupon-image" src="${pageContext.request.contextPath}/resources/assets/imgs/coupon/coupon2.png" alt="쿠폰이미지">
                    <div class="coupon-details">
                      <div class="coupon-name">${mycp.coupon.cpname}</div>
                      <div class="coupon-price">${mycp.coupon.cpprice} 원</div>
                      <div class="coupon-dates">
                        <fmt:formatDate value="${mycp.cprdate}" pattern="yyyy.MM.dd" /> - 
                        <fmt:formatDate value="${mycp.coupon.cpvalid}" pattern="yyyy.MM.dd" />
                      </div>
                     <div>
              			<input type="hidden" name="cpstatus" value="${mycp.cpstatus }" />
              			<input type="hidden" name="cpstatus" value="${mycp.coupon.cpstatus }" />
                     </div>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <!-- 다른 경우에 대한 처리를 여기에 추가 -->
                  </c:otherwise>
                </c:choose>
              </div>
            </c:forEach>
          </div>
        </div>
<!-- mypage-content -->
      <!-- pagination-wrap -->
				<div class="pagination-wrap">
					<!-- pagination -->
					<div class="pagination">
						<ol>
							<c:choose>
								<c:when test="${searchVO.page>1}">
									<li><a href="mycouponbox?page=1"><i
											class="fa-solid fa-angles-left"></i></a></li>
									<li><a href="mycouponbox?page=${searchVO.page-1 }"><i
											class="fa-solid fa-angle-left"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a> <i
											class="fa-solid fa-angles-left"></i>
									</a></li>
									<li class="disabled"><a> <i
											class="fa-solid fa-angle-left"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 14 -->
							<c:forEach begin="${searchVO.pageStart }"
								end="${searchVO.pageEnd }" var="i">
								<c:choose>
									<c:when test="${i eq searchVO.page }">
										<!-- 내가 클릭한 페이지의 숫자랑 같냐 -->
										<li class="current-page"><a> ${i } </a></li>
									</c:when>
									<c:otherwise>
										<li><a href="mycouponbox?page=${i }">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${searchVO.page < searchVO.totPage}">
									<li><a href="mycouponbox?page=${searchVO.page+1 }"><i
											class="fa-solid fa-angle-right"></i></a></li>
									<li><a href="mycouponbox?page=${searchVO.totPage }"><i
											class="fa-solid fa-angles-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="disabled"><a> <i
											class="fa-solid fa-angle-right"></i>
									</a></li>
									<li class="disabled"><a> <i
											class="fa-solid fa-angles-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</div>
					<!-- pagination -->
				</div>
				<!-- pagination-wrap -->
      </div>
    </section>
  </article>
  <script>
    document.title = "몬스타북스 :: 마이페이지 :: 마이쿠폰";
  </script>
</body>
</html>
