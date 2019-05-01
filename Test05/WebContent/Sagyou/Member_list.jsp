<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String id= null;
	if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet re = null;

	try{
  	    Context init = new InitialContext();
    	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
    	conn=ds.getConnection();
   
  		pstmt = conn.prepareStatement("select * from test where id != 'admin'");
  		re = pstmt.executeQuery();
   
	}catch(Exception e){
 	  	e.printStackTrace();
	}
%>
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
      background-image: url("1313.jpg");
      background-repeat: no-repeat;
      background-size: cover;
      
   }
</style>
</head>
<body>
<center>
  <br><br><br><br><br><br><br><br><br><br><br>
   <table border=1 width=300>
      <tr><td class="b" colspan=2 >Member List</td></tr>
   <%while(re.next()){ %>
   <tr>
      <td class = "aa" style = "color:black;">
         <a href="Member_info.jsp?id=<%=re.getString("id") %>">
         <%=re.getString("id") %>
         </a>
      </td>
         <td style = "color:black;"><a href="Member_delete.jsp?id=<%=re.getString("id") %>">Delete</a></td>
   </tr>
   <%}try{
		if(conn!=null){conn.close(); conn = null;}  //닫아줌
	}catch(Exception e){
		e.printStackTrace();
	} %>
</table>
</center>

</center>
</body>
</html>