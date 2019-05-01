<%@page import="java.util.List"%>
<%@page import="net.member.db.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 보기</title>
<style type="text/css">

  table{
		width:1000px;
			
	}
	
	td{
		text-align:center;
		font-weight : bold;
		font-size: 2rem;
	}
	
	.aa{
		font-size:3rem;
		color:black;
	}
	
	.b{
		font-size:4rem;
	
	}
	
	
	 body{
      background-image: url("./Sagyou/1313.jpg");
      background-repeat: no-repeat;
      background-size: cover;
      
   }
</style>
</head>
<body>

  <br><br><br><br><br><br><br><br><br><br><br>
   <table border=1 width=300 style="margin : auto">
      <tr><td class="b" colspan=2 >Member List</td></tr>
   <%List<MemberBean> beans = (List<MemberBean>)session.getAttribute("memberbean");
   for(MemberBean bean : beans){ %>
   <tr>
      <td class = "aa" style = "color:black;">
         <a href="MemberInfoAction.mo?id=<%=bean.getId() %>">
         <%=bean.getId() %>
         </a>
      </td>
         <td style = "color:black;"><a href="MemberDeleteAction.mo?id=<%=bean.getId()%>">Delete</a></td>
   </tr>
   <%}%>
</table>

</body>
</html>