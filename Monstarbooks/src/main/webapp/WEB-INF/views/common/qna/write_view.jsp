<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../resources/css/nstyle.css" /> -->
<!-- <style>
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
   text-align:left
}
.top  td{

   /* text-align: left; */
   border-top: 2px solid #ddd;
   
}

.left{
   background-color: #eee;
   width: 150px;
}

table.toClass tr:hover {
   /*  background-color: #eee; */
}

table.toClass th, td.non-line{
  border-bottom: 0px solid #ddd;
}
input[type="button"] {
    background-color: var(--color-white);
    font-weight: var(--weight-bold);
    color: var(--color-main);
    border-color: var(--color-main);
    display: inline-block;
}

.pl{
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 0px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 1px solid white;
    box-sizing: border-box;
    border-radius: 0px;
    outline: 1px solid #000d82; /*  #F8E4FF */
    border-radius: 0px;
}

.pl2{
    border: 1px solid #d9d9d9;
 

}
.pl2:focus{

    border: 1px solid white;
    outline: 1px solid #000d82; /*  #F8E4FF */
}
.top{
   border-top: 1px solid #ddd;
}
form {
    width: 100%;
    text-align: center;
    /* display: inline-block; */
}
.disableExp{
background-color: #f4f6f9;
cursor:default;
}
</style> -->
</head>
<body>
	<article class="mypage-wrap">
		<section class="mypage-section-wrap">
			<jsp:include page="/WEB-INF/views/tiles/include/mypageMenu.jsp"></jsp:include>
			<div class="mypage-content-box">
				<div class="mypage-title">
					<h3>1:1문의 작성</h3>
				</div>
				<form action="write" method="post" enctype="multipart/form-data"
					onsubmit="return writeCheck();" name="writeForm">
					<div class="mypage-content">
						<input type="hidden" name="memberno" value="${memberno}">
						<table>
						<colgroup>
							<col width="100px"/>
						</colgroup>
							<tr>
								<th>질문유형</th>
								<td>
									<div class="select-group">
										<select name="qcategory" class="form-select">
											<option value="상품" selected>상품</option>
											<option value="주문">주문</option>
											<option value="배송">배송</option>
											<option value="환불">환불</option>
											<option value="기타">기타</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" name="qtitle" value="" /></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" name="mid" value="${mname}" readonly /></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="qcontent" rows="10" cols="145"></textarea></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><input type="file" name="qfilesrc"></td>
							</tr>
						</table>
					</div>
					<section class="cart-btn-box order-btn-box">
					
					<div class="btn-wrap" style="margin-top:20px;">
						<input type="submit" value="등록" />
					</div>
					</section>
				</form>
				<!-- mypage-content -->
			</div>
			<!-- "mypage-content-box -->
		</section>
	</article>
	<script>
		function writeCheck() {
			var frm = document.writeForm;

			if (frm.qtitle.value == "") {
				alert('제목을  입력하세요');
				frm.qtitle.focus();
				return false;

			}

			if (frm.qcontent.value == "") {
				alert('내용을  입력하세요');
				frm.qcontent.focus();
				return false;

			}
		}
	</script>
</body>
</html>