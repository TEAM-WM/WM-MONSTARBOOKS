<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<td>${dto.mbirth }</td>
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
					${dto.mregdate }
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
			<button type="button" onclick="location.href='../member/list'">목록</button>
		</div>
	</article>
</body>
</html>
