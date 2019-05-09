<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "net.product.db.ProductBean" %>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<script type="text/javascript">
	function preview(){
		document.getElementById("img").value = document.getElementById("image").value;
	}
	
	function afterview(value){
		document.getElementById("img").value = value;
		
	}
</script>
</head>
<body>
<h2>상품등록</h2>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>

<form method="post" action="ProductUpdateAction.po" name = "modifyForm" onload = "preview()">
<table border="1">
	<tr>
		<td>상품코드</td><td colspan="5"><input type="text" name="code" id="code" value =<%=((ProductBean)session.getAttribute("detailProduct")).getProduct_code()%> readonly/></td>
	</tr>
	<tr>
		<td>상품분류</td><td colspan="5"><input type="text" name="category" id="category" value =<%=((ProductBean)session.getAttribute("detailProduct")).getProduct_category()%> ></td>
		
	</tr>
	<tr>
		<td>상품이름</td><td colspan="5"><input type="text" name="name" id="name" value =<%=((ProductBean)session.getAttribute("detailProduct")).getProduct_name()%> ></td>
	</tr>
	<tr>
		<td>원가</td><td><input type="text" name="cost" id="cost" value =<%=((ProductBean)session.getAttribute("detailProduct")).getProduct_cost()%> ></td>
		<td>판매가</td><td><input type="text" id="price" name="price" value =<%=((ProductBean)session.getAttribute("detailProduct")).getProduct_price()%> ></td>
		<td>순수익</td><td><%=((ProductBean)session.getAttribute("detailProduct")).getProduct_price()-((ProductBean)session.getAttribute("detailProduct")).getProduct_cost()%></td>
	</tr>
	<tr>
		<td colspan="6">상품상세 설명</td>
	</tr>
	<tr>
		<table border=0 width=490 height=50 style="table-layout:fixed">
				<tr>
      				<td colspan="6"><textarea rows="10" cols="110" name="detail" id="detail"><%=((ProductBean)session.getAttribute("detailProduct")).getProduct_detail()%></textarea></td>
   				</tr>
			</table>
	</tr>
	<tr>
		<td>이미지</td><td colspan="5">
					<input type="file" oninput = "afterview(<%=request.getParameter("image") %>)" size=40 id="image" name="image" value = "<%=((ProductBean)session.getAttribute("detailProduct")).getProduct_image()%>">
			<br><br>
		</td>
	<tr>
		<td><img id="img"/></td>
	</tr>
	<tr>
		<td>수량</td><td colspan="3"><input type="text" id="count" name="count" value = <%=((ProductBean)session.getAttribute("detailProduct")).getProduct_count() %>></td><td>상품등록일</td>
		<td>
			<input type="text" name="date" id="date" value="${date }" readonly>
		</td>
	</tr>
	<tr align="center">
		<td><input type="submit" value="확인" ></td>
	</tr>
</table>
</form>
</body>
</html>