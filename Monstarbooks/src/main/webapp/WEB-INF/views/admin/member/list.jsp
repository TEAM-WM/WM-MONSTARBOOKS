<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="admin-count">
		<strong>${totRowcnt }</strong>건 
	</div>
	<table>
		<colgroup>
			<col width="80px">
		</colgroup>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>권한</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입날짜</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${dto }" var="dto">
				<tr>
					<td>${dto.memberno }</td>
					<td>
						<strong>${dto.mauthority }</strong><br>
						<form action="list/status" method="post" style="width:auto">
							<input type="hidden" name="no" value="${dto.memberno }"/>
							<select name="status" id="userStatus">
								<option value="관리자" <c:if test="${dto.mauthority eq '관리자' }">selected</c:if>>관리자</option>
								<option value="사용자" <c:if test="${dto.mauthority eq '사용자' }">selected</c:if>>사용자</option>
							</select>
							<button type="submit">수정</button>
						</form>
					</td>
					<td>${dto.mid }</td>
					<td>${dto.mname }</td>
					<td>${dto.memail }</td>
					<td>${dto.to_regdate }</td>
					<td><a href="detail?memberNo=${dto.memberno}">상세보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<form action="list" method="post" class="admin">
		<div class="search-wrap">
			<div class="search-box">
				<select name="searchType" id="searchType">
					<option value="mid" <c:if test="${mid eq true }">selected</c:if>>아이디</option>
					<option value="mname" <c:if test="${mname eq true }">selected</c:if>>이름</option>
				</select>
				<input type="text" name="sk" maxlength="50" value="${searchKey }" placeholder="검색어를 입력해주세요."/>
				<button type="submit" class="search-icon"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
		</div>
		<!-- pagination-wrap -->
        <div class="pagination-wrap">
            <!-- pagination -->
            <div class="pagination">
                <ol>
				<c:choose>
					<c:when test="${searchVO.page>1}">
						<li><a href="list?page=1"><i class="fa-solid fa-angles-left"></i></a></li>
						<li><a href="list?page=${searchVO.page-1 }"><i class="fa-solid fa-angle-left"></i></a></li>
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
								<a href="list?page=${i }&sk=${searchKey }&mid=${mid==true?'mid':''}&mname=${mname==true?'mname':''}">${i }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${searchVO.page < searchVO.totPage}">
						<li><a href="list?page=${searchVO.page+1 }"><i class="fa-solid fa-angle-right"></i></a></li>
						<li><a href="list?page=${searchVO.totPage }"><i class="fa-solid fa-angles-right"></i></a></li>
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
	</form>
</body>
</html>