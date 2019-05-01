<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지 입니다.</title>
<style type="text/css">

   
   body{
	 text-align:center;
     background-image: url("1313.jpg");
     background-repeat: no-repeat;
     background-size: cover;
     font-size:3rem;
   }
   
   
   
</style>
</head>
<body>
<br><br><br>
<%
	if(session.getAttribute("id").equals("admin")){%>
		<%=session.getAttribute("id")%>님 환영합니다.<br>
		<a href = "Member_list.jsp">관리자모드 접속(회원 목록보기)</a>
	<%}else{%>
		<%=	session.getAttribute("id")%>님 환영합니다.
	<%} %>


</body>
</html>