<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form {
width: 500px;
align: center;
text-align: left;
}
table {
width: 500px;
align: center;
text-align: left;
}

tr, td {
	padding: 10px 0px 10px 0px;
	
.relist {
	margin-left: auto;
	margin-right: auto;
	display: block;
	width: 100%;
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
</style>
</head>

<body>
	<br />
	<br />
<h3>Review</h3>
	<br />
	<br />
<form action="reviewinsert" method="post" enctype="multipart/form-data">
	<table>

		 <!-- Load BCDTO -->
<%--         <tr>
            <td class="left">Load BCDTO</td>
            <td>
                ${bcdto.bcategory1} ${bcdto.bcategory2}</td>
        </tr>
        <!-- Load BDTO -->
        <tr>
            <td class="left">Load BDTO</td>
            <td>
                ${bdto.bookno} ${bdto.btitle}</td>
        </tr> --%>
		<tr>
			<td class="left">제목</td>
			<td><input type="text" name="rtitle" value="제목" />
			</td>
		</tr>
		<tr>
			<td class="left">별점</td>
			<td><input type="text" name="rstar" value="5"/>
			<label>숫자 1,2,3,4,5 중 1가지를 입력하세요</label></td>
		</tr>
		<tr>
			<td class="left">후기</td>
			<td><textarea type="text" name="rcontent" placeholder="후기를 입력하세요." rows="10"></textarea></td>
		</tr>
		<tr>
			<td class="left">첨부</td>
			<td><input type="file" name="refilesrc" /></td>
		</tr>
		
		<tr>			
			<td colspan="2">
			
mid: <input type="text" name="mid" value="${myreview_list.mid }" />
				<input type="submit" value="save" />
				<a href="myreview_list" class="relist">LIST</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>