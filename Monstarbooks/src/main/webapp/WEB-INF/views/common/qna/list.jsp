<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 리스트</title>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>
.fa-solid{
	color:#333;
	
}

.fa-solid:hover{
	color:orange;
	
}
table.toClass{
   border-collapse: collapse;
   width: 100%;
}

table.toClass th{
   background-color: :#f4f6f9;
}

table.toClass th, td{
   padding: 20px;
   /* text-align: left; */
   border-bottom: 1px solid #ddd;
}

.left{
   background-color: #eee;
   width: 150px;
}

table.toClass tr:hover {
     background-color: #eee;
     cursor:pointer;
}

table.toClass th, td.non-line{
  border-bottom: 0px solid #ddd;
}
.nocursor:hover {
    // cursor:pointer;
     background-color: white;
}
form {
    width: 100%;
    text-align: center;
    /* display: inline-block; */
}
</style> -->

</head>

<article class="mypage-wrap">
	<section class="mypage-section-wrap">
		<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp"></jsp:include>
		<div class="mypage-content-box">
			<div class="mypage-title space">
				<h3>1:1문의 내역</h3>
				<input type="button" value="글쓰기"
					onclick="location.href='./write_view'" class="btn-a w100 mn height0" />
			</div>
			<div class="mypage-content">
				<div class="mypage-table">
					<table>
					<colgroup>
						<col width="8%;"/>
						<col width="auto"/>
						<col width="10%;"/>
						<col width="13%;"/>
						<col width="15%;"/>
					
					</colgroup>
						<tr>
							<th>번호</th>
							<!-- 1 -->
							<th>제목</th>
							<!-- 2 -->
							<th>문의유형</th>
							<!-- 3 -->
							<th>처리상태</th>
							<!-- 4 -->
							<th>등록일</th>
							<!-- 5 -->
						</tr>

						<c:forEach items="${list }" var="dto">
							<tr>
								<td><c:set var="listNum" value="${listNum-1}" />${listNum}</td>
								<!-- 1 -->
								<td class="left"><a href="content_view?qnano=${dto.qnano }">${dto.qtitle }</a></td>
								<!-- 2 -->
								<td><span class="btn-a" style="padding:5px 10px;">${dto.qcategory }</span></td>
								<!-- 3 -->
								<td><span class="text-back"> ${dto.qstatus } </span></td>
								<!-- 4 -->
								<td><fmt:formatDate value="${dto.qregDate }"
										pattern="yy-MM-dd" /></td>
								<!-- 5 -->
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- mypage-content -->
			<%-- totcnt: ${totRowCnt } <br /> 현재페이지/토탈페이지:${searchVO.page }/${searchVO.totPage } --%>

			<form action="list" method="post" onsubmit="return searchCheck();"
				name="searchForm">
				<section class="chk-search-wrap">
				<div class="chk-search-form">
					<div class="chk-search">
					<c:choose>
						<c:when test="${qtitle }">
							<input type="checkbox" id="searchType1" name="searchType"
								value="qtitle" checked />
						</c:when>
						<c:otherwise>
							<input type="checkbox" id="searchType1" name="searchType"
								value="qtitle" />

						</c:otherwise>
					</c:choose>
					<label for="searchType1"></label>
					제목
					<c:choose>
						<c:when test="${qcontent }">
							<input type="checkbox" id="searchType2" name="searchType"
								value="qcontent" checked />
						</c:when>
						<c:otherwise>
							<input type="checkbox" id="searchType2" name="searchType"
								value="qcontent" />

						</c:otherwise>
					</c:choose>

					<label for="searchType2"></label>
					<span>내용</span>
					</div>
					<input type="text" name="sk" value="${resk }" />
					<input type="submit" value="검색" />
					<!-- <input type="button" value="리스트" onclick="javascript:location.href='./list'" /> -->
				</div>
				</section>
				<!-- pagination-wrap -->
				<div class="pagination-wrap">
					<!-- pagination -->
					<div class="pagination">
						<ol>
							<c:choose>
								<c:when test="${searchVO.page>1}">
									<li><a href="list?page=1"><i
											class="fa-solid fa-angles-left"></i></a></li>
									<li><a href="list?page=${searchVO.page-1 }"><i
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
										<li><a
											href="list?page=${i }&sk=${resk}&qtitle=${qtitle==true?'qtitle':''}&qtitle=${qcontent==true?'qcontent':''}">${i }</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${searchVO.page < searchVO.totPage}">
									<li><a href="list?page=${searchVO.page+1 }"><i
											class="fa-solid fa-angle-right"></i></a></li>
									<li><a href="list?page=${searchVO.totPage }"><i
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
			</form>
		</div>
		<!-- "mypage-content-box -->
	</section>
</article>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:if test="${param.iResult eq 1 }">
	<script>
		alert('등록 되었습니다');
	</script>
</c:if>
<c:if test="${param.result eq 1 }">
	<script>
		alert('수정 되었습니다');
	</script>
</c:if>
<c:if test="${param.dResult eq 1 }">
	<script>
		alert('삭제 되었습니다');
	</script>
</c:if>
<script>
	//검색폼 쳄크 자바스크립트
	function searchCheck() {
		var frm = document.searchForm;

		var test1Result = document.getElementById('searchType1').checked;

		var test2Result = document.getElementById('searchType2').checked;
		//console.log(test1Result+":"+test2Result);
		//return false;
		if (test1Result == false && test2Result == false) {
			alert("제목 이나 내용을 선택하세요");
			return false;
		}

		if (frm.sk.value.length < 1) {
			alert("검색어를 입력하세요");
			frm.sk.focus();

			return false;
		}

	}
</script>
</body>
</html>