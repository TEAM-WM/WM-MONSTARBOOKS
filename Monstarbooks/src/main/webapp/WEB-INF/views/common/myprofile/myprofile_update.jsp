<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myprofile_update</title>
<!-- <style>
tr, td {
	padding: 10px 0px 5px 0px;
}

form {
	width: 500px;
	align: center;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}

table {
	width: 500px;
	align: center;
	text-align: left;
	margin-left: auto;
	margin-right: auto;
}
.relist {
	margin-left: auto;
	margin-right: auto;
	display: block;
	height: 50px;
	text-align: center;
	vertical-align: middle;
	padding-top: 15px;
	border-radius: 5px;
	border: 1px solid #d9d9d9;
	color: #767676;
	background-color: var(- -color-white);
	font-weight: var(- -weight-bold);
	color: var(- -color-main);	
}

.content {
	display:flex;
	text-align: left;
	justify-content:space-between;
    overflow: hidden; /* 사이드바와 테이블이 겹치지 않도록 처리 */
}

</style> -->
</head>
<body>
<article class="mypage-wrap">
	<form action="profileupdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="mid" value="${myprofile_view.mid }" />
		<section class="mypage-section-wrap">
			<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp">
				<jsp:param name="name" value="${myprofile_view.mname }" />
				<jsp:param name="img" value="${myprofile_view.mprofileimg }" />
				<jsp:param name="id" value="${myprofile_view.mid }" />
			</jsp:include>
			<div class="mypage-content-box">
				<div class="mypage-title">
					<h3>프로필변경</h3>
				</div>
				<div class="mypage-content">
					<table>
						<tr>
							<th>이름</th>
							<td>
								${myprofile_view.mname }님
							</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
								${myprofile_view.mid }님
							</td>
						</tr>
						<tr>
							<th>프로필 이미지</th>
							<td>
								<div class="profile-img-box">
									<a <c:if test="${not empty myprofile_view.mprofileimg }">href='download?p=resources/assets/upload/&f=${myprofile_view.mprofileimg }&mid=${myprofile_view.mid }' </c:if> class="btn-profile">
										<span class="thumb-box imgup">
										<c:if test="${not empty myprofile_view.mprofileimg }">
											<img src="${pageContext.request.contextPath}/resources/assets/upload/${myprofile_view.mprofileimg }" alt="프로필이미지"/>
										</c:if>
										</span>
									</a>
									<div>
										<input type="file" name="mprofileimg" accept=".jpg, .png, .gif" id="fileUpload" value="${myprofile_view.mprofileimg }"/>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="cart-btn-box" style="margin-top:40px;">
					<button type="submit" class="btn-a">수정하기</button>
				</div>
			</div>
		</section>
		</form>
	</article>
<%-- 	<br /><br />
    <div class="content">
        <!-- 왼쪽에 myprofile.jsp 내용 추가 -->
        <div id="myprofile-sidebar">
            <%@ include file="myprofile.jsp" %>
        </div>

<form action="profileupdate" method="post" enctype="multipart/form-data">
	<input type="hidden" name="mid" value="${myprofile_view.mid }" />

	
	<div align="center" class="card" style="height: 700px;">
			<br /><br />
		<h2>My Profile Update</h2>
	<br />
	<br />
	<table>
				<c:choose>
			<c:when test="${not empty myprofile_view.mprofileimg}">
				<tr>
					<td class="center" colspan=2>
						<div align="center" class="image-container">
							<img
								src="${pageContext.request.contextPath}/resources/assets/upload/${myprofile_view.mprofileimg }"
								alt="프로필사진" style="width: 200px; height: 200px;" />
						</div>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td class="left" colspan=2>
						<div align="center" class="image-container">
							<img
								src="${pageContext.request.contextPath}/resources/assets/imgs/mypage/profile.png"
								alt="기본이미지" style="max-width: 40%; height: auto;">
						</div>
					</td>
				</tr>
			</c:otherwise>
		</c:choose>
			<tr>
			<td> </td>
		</tr>
				<tr>
					<td class="center" colspan="2">ID : &nbsp;${myprofile_view.mid }</td>
				</tr>
				<tr>
			<td class="center" colspan="2">이름 : &nbsp;${myprofile_view.mname }&nbsp;님</td>
			</tr>
			<tr>
			<td> </td>
		</tr>		
				<tr>
					<td class="center" colspan="2"><input type="file" name="mprofileimg" accept=".jpg, .png, .gif" 
					onchange="imageChoose(this)" value="${myprofile_view.mprofileimg }"/>
					</td>
				</tr>
				<tr>
					<td class="left" colspan="2">
					<input type="submit" value="update" />
				<a href="list" class="relist">LIST</a>
					</td>
				</tr>
		</table>
		</div>
	</form>
	        </div> --%>

	
<script>
	document.title = "몬스타북스 :: 마이페이지 :: 프로필수정"; 
	
	
	// 파일 업로드 input 요소를 가져옵니다.
	var fileUpload = document.getElementById('fileUpload');

	// 파일을 선택했을 때 실행될 함수를 정의합니다.
	fileUpload.addEventListener('change', function(event) {
		// 선택한 파일을 가져옵니다.
		var selectedFile = event.target.files[0];

		// 이미지 파일인지 확인합니다.
		if (selectedFile.type.match('image.*')) {
			// FileReader 객체를 생성합니다.
			var reader = new FileReader();

			// 파일 읽기가 완료되었을 때 실행될 함수를 정의합니다.
			reader.onload = function(e) {
				// 이미지를 표시할 <img> 요소를 가져옵니다.
				var imageElement = document.createElement('img');
				imageElement.src = e.target.result; // 이미지 데이터를 설정합니다.
				imageElement.alt = '프로필이미지';

				// <span class="thumb-box"> 요소를 찾아서 이미지를 추가합니다.
				var thumbBox = document.querySelector('.imgup');
				thumbBox.innerHTML = ''; // 기존 내용을 지웁니다.
				thumbBox.appendChild(imageElement);
			};

			// 파일을 읽어옵니다.
			reader.readAsDataURL(selectedFile);
		} else {
			// 이미지 파일이 아닌 경우에 대한 처리를 추가할 수 있습니다.
			alert('이미지 파일만 업로드 가능합니다.');
			// 파일 업로드 input을 초기화합니다.
			fileUpload.value = '';
		}
	});
</script>
</body>
</html>