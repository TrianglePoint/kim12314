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
	String info_id=request.getParameter("id");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn=ds.getConnection();
   
  		pstmt = conn.prepareStatement("select * from test where id=?");
  		pstmt.setString(1, info_id);
  		rs = pstmt.executeQuery();
	    rs.next();
	}catch(Exception e){
   		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세보기</title>
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
	}
	
	
	 body{
      background-image: url("1313.jpg");
      background-repeat: no-repeat;
      background-size: cover;
      
   }

</style>
<script type="text/javascript">

	function back(){
		window.history.back();
	}

</script>
</head>
<body>
<center>
<br><br><br><br><br><br><br><br><br><br><br>
   <table border=1 width=300>
      <tr>
         <td class="aa"><center>ID</center> </font></td>
         <td><%=rs.getString("id") %></td>
      </tr>
      <tr>
          <td class="aa"><center>PASS</center> </font></td>
          <td><%=rs.getString("pw") %></td>
      </tr>
      <tr>
          <td class="aa"><center>E-MAIL</center> </font></td>
          <td><%=rs.getString("email") %></td>
      </tr>
      <tr>
          <td class="aa"><center>NAME</center> </font></td>
          <td ><%=rs.getString("name") %></td>
      </tr>
      <tr>
          <td class="aa"><center>IDENTIFICATION NUM</center> </font></td>
         <td><%=rs.getString("jumin") %></td>
      </tr>
      <tr>
         <td class="aa"><center>BIRTH</center> </font></td>
         <td><%=rs.getString("birth") %></td>
      </tr>
      <tr>
         <td class="aa"><center>INTEREST</center> </font></td>
         <td><%=rs.getString("inter") %></td>
      </tr>
      <tr>
        <td class="aa"><center>MEMO</center> </font></td>
         <td><%=rs.getString("intro") %></td>
      </tr>
      <tr>
         <td colspan=2 align = "center">
         <input type = "button" value = "BACK" onclick="back()"style="width:80pt; height:30pt; font-size:18pt; background-color:transparent;"/></td>
      </tr>
   </table>
</center>
<%
	try{
		if(conn!=null){conn.close(); conn = null;}  //닫아줌
	}catch(Exception e){
		e.printStackTrace();
	}

	%>
</body>
</html>