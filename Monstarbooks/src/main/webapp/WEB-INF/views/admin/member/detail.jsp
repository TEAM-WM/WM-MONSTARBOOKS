<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
</head>
<body>
	<article class="admin-table">
		<table>
			<colgroup>
		        <col width="150px">
		    </colgroup>
			<tr>
				<th>회원번호</th>
				<td>${dto.memberno }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${dto.mid }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>${dto.mpw }</td>
			</tr>
			<tr>
				<th>
					이름
				</th>
				<td>
				${dto.mname }
				</td>
			</tr>
			<tr>
				<th>생일</th>
				<td>
					<fmt:formatDate value="${dto.mbirth }" pattern="yy-MM-dd" />
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${dto.memail }</td>
			</tr>
			<tr>
				<th>
					번호
				</th>
				<td>
					${dto.mtel }
				</td>
			</tr>
			<tr>
				<th>
					가입일
				</th>
				<td>
					<fmt:formatDate value="${dto.mregdate }" pattern="yy-MM-dd" />
				</td>
			</tr>
			<tr>
				<th>
					프로필 이미지
				</th>
				<td>
				<c:choose>
					<c:when test="${empty dto.mprofileimg }">
						프로필 사진이 없습니다.
					</c:when>
					<c:otherwise>
						${dto.mprofileimg }
					</c:otherwise>
				</c:choose>
					
				</td>
			</tr>
			<tr>
				<th>
					권한
				</th>
				<td>
					${dto.mauthority }
				</td>
			</tr>
			<tr>
				<th>
					쿠폰
				</th>
				<td>
					<button type="button" onclick="openModal('adminCouponModal')">
						<i class="fa-solid fa-ticket"></i> 보유 쿠폰 확인
					</button>
				</td>
			</tr>
			<tr>
				<th>
					탈퇴여부
				</th>
				<td>
					<c:choose>
						<c:when test="${dto.deleted eq 'yes' }">
							탈퇴한 회원입니다.
						</c:when>
						<c:otherwise>
							활동중인 회원입니다.
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<th>
					선호장르
				</th>
				<td>
					<div class="favorite-box" style="margin-bottom:0">
						<c:forEach items="${favorite }" var="favorite">
							<c:choose>
								<c:when test="${empty favorite  }">
				           			선호장르가 없습니다.
				         		</c:when>
								<c:otherwise>
									<input type="checkbox" name="favorite" value="${favorite }"
										checked disabled="disabled" />
									<label for="favorite01">${favorite }</label>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
		<div class="admin-btn-wrap">
			<div class="btn-wrap">
				<button type="button" onclick="location.href='../member/update?memberNo=${dto.memberno}'">수정</button>
				<c:choose>
					<c:when test="${dto.deleted eq 'yes' }">
						<button type="button" onclick="location.href='../member/restore?memberNo=${dto.memberno}'">회원복구</button>
					</c:when>
					<c:otherwise>
						<button type="button" onclick="location.href='../member/delete?memberNo=${dto.memberno}'">탈퇴처리</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="btn-wrap">
				<button type="button" class="btn-gray" onclick="location.href='../member/list'">목록</button>
			</div>
		</div>
	</article>
	<article>
		<c:choose>
			<c:when test="${totRowcnt > 0}">
				<div class="mypage-title bn space">
					<h3>${dto.mname }회원님의 주문 내역입니다.</h3>
					<p>
						<strong>${totRowcnt}</strong>건의 주문이 존재합니다.
					</p>
				</div>
				<section class="cart-table-wrap">
					<c:set var="prevOrderNo" value="" />
					<c:forEach var="order" items="${orderList}">
						<c:set var="currentOrderNo" value="${order.orderNo}" />
							<c:if test="${currentOrderNo ne prevOrderNo}">
								<div class="order-item" style="justify-content: space-between; border-top: 1px solid #000; border-bottom:1px solid #000">
									<div>
										<h3>주문상품&nbsp;&nbsp;&nbsp;
										<span>
										<fmt:formatDate
												value="${order.orderDate}" pattern="yy-MM-dd" />
										</span>
										</h3>
										
									</div>
									<p>
										<a class="btn-a gray"
											href="${pageContext.request.contextPath}/admin/order/detail?orderNo=${order.orderNo}">주문
												상세보기</a> 
									</p>
								</div>
								<c:set var="prevOrderNo" value="${currentOrderNo}" />
							</c:if>
							<table class="bn">
								
								<tr>
									<!-- 상품 정보 -->
									<td class="cart-table-image">
										<div class="product-card-image">
											<img
												src="${pageContext.request.contextPath}/resources/assets/imgs/product/${order.productImage}"
												alt="책 썸네일 이미지" />
										</div>
									</td>
									<td class="left">
										<div class="book-info">
											<div class="book-price">
											<p>${order.productName} </p>
												<span class="price"> ${order.productPrice}원 </span>
											</div>
										</div>
									</td>
									<!-- 갯수 -->
									<td class="cart-table-price">
										<p>${order.productCount}개</p>
									</td>
									<!-- 가격 -->
									<td class="cart-table-price"><span>
											${order.totalAmount} </span>원</td>
									<td class="right">
										<span class="text-back">
											${order.orderStatus}
										</span>
									</td>
								</tr>
								<c:set var="prevOrderNo" value="${currentOrderNo}" />
							</table>
					</c:forEach>
						</section>
			</c:when>
			<c:otherwise>
				<div class="warning">
					<p>주문이 없습니다.</p>
				</div>
			</c:otherwise>
		</c:choose>

	<c:if test="${totRowcnt>0}">
		<!-- pagination-wrap -->
		<div class="pagination-wrap">
			<!-- pagination -->
			<div class="pagination">
				<ol>
					<c:choose>
						<c:when test="${searchVo.page>1}">
							<li><a
								href="<c:url value='/admin/member/detail'>]
								<c:param name="memberNo" value="${dto.memberno}" />
								<c:param name='page' value='1'/>
								</c:url>">
								<i
									class="fa-solid fa-angles-left"></i></a></li>
							<li><a
								href="<c:url value='/admin/member/detail'>
									<c:param name="memberNo" value="${dto.memberno}" />
									<c:param name='page' value='${searchVo.page - 1}'/>
									</c:url>">
									<i class="fa-solid fa-angle-left"></i>
							</a></li>
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

					<!-- 페이지 갯수 표시 -->
					<c:forEach begin="${searchVo.pageStart}" end="${searchVo.pageEnd}"
						var="i">
						<c:choose>
							<c:when test="${i eq searchVo.page}">
								<li class="current-page"><a> ${i } </a></li>
							</c:when>
							<c:otherwise>
								<!-- 페이지 번호 링크 -->
								<li><a
									href="<c:url value='/admin/member/detail'>
									<c:param name="memberNo" value="${dto.memberno}" />
									<c:param name='page' value='${i}'/>
									</c:url>">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 다음 페이지 링크 -->
					<c:choose>
						<c:when test="${searchVo.page < searchVo.totPage}">
							<li><a
								href="<c:url value='/admin/member/detail'>
								<c:param name="memberNo" value="${dto.memberno}" />
								<c:param name='page' value='${searchVo.page + 1}'/>
								</c:url>">
									<i class="fa-solid fa-angle-right"></i>
							</a></li>
							<li><a
								href="<c:url value='/admin/member/detail'>
								<c:param name="memberNo" value="${dto.memberno}" />
								<c:param name='page' value='${searchVo.totPage }'/>
								</c:url>">
									<i class="fa-solid fa-angles-right"></i>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="disabled"><a> <i
									class="fa-solid fa-angles-right"></i>
							</a></li>
							<li class="disabled"><a> <i
									class="fa-solid fa-angle-right"></i>
							</a></li>
						</c:otherwise>
					</c:choose>
				</ol>
			</div>
			<!-- pagination -->
		</div>
		<!-- pagination-wrap -->
	</c:if>
	</article>
	<!-- 모달 -->
	
	<div id="adminCouponModal" class="modal coupon-modal">
        <section class="modal-content-wrap">
            <div class="modal-title left">
	        	<button class="closeModalBtn" onclick="closeModal('adminCouponModal')"><i class="fa-solid fa-xmark"></i></button>
                <h3>
                    ${dto.mname }님의 쿠폰 내역입니다.
                </h3>
            </div>
            <div class="modal-content">
                <div class="modal-content-text left">
                    <c:choose>
                    	<c:when test="${empty couponList }">
                    		쿠폰내역이 없습니다.
                    	</c:when>
                    	<c:otherwise>
                    		<table>
			                    <colgroup>
							        <col width="50px">
							        <col width="auto">
							        <col width="auto">
							        <col width="80px"/>
							        <col width="90px"/>
							        <col width="90px"/>
							        <col width="90px"/>
							        <col width="80px"/>
							        <col width="80px"/>
							        
							    </colgroup>
			                    	<tr>
			                    		<th>
			                    			번호
			                    		</th>
			                    		<th>
			                    			쿠폰이름
			                    		</th>
			                    		<th>
			                    			쿠폰설명
			                    		</th>
			                    		<th>
			                    			할인률
			                    		</th>
			                    		<th>
			                    			생성일
			                    		</th>
			                    		<th>
			                    			유효기간
			                    		</th>
			                    		<th>
			                    			다운날짜
			                    		</th>
			                    		<th>
			                    			쿠폰상태
			                    		</th>
			                    		<th>
			                    			사용유무
			                    		</th>
			                    	</tr>
			                    	<c:forEach items="${couponList }" var="dto">
										<tr>
											<td>
												${dto.cpno }
											</td>
											<td>
												${dto.cpname }
											</td>
											<td>
												${dto.cpdescription }								
											</td>
											<td>
												${dto.cpprice }%
											</td>
											<td>
												<fmt:formatDate value="${dto.cpcreated }" pattern="yy-MM-dd" />
											</td>
											<td>
												<fmt:formatDate value="${dto.cpvalid }" pattern="yy-MM-dd" />
											</td>
											<td>
												<fmt:formatDate value="${dto.cpMember.cprdate }" pattern="yy-MM-dd" />
											</td>
											<td>
												${dto.cpstatus }
											</td>
											<td>
												${dto.cpMember.cpstatus }
											</td>
										</tr>
									</c:forEach>
			                    </table>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>
    </div>
    <!-- 모달 스크립트 -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal.js"></script>
</body>
</html>
