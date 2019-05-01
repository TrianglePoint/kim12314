<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

 	   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null; 
	String sql = "select * from student"; 	
	
	try {
		Context init = new InitialContext();
    	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
    	conn = ds.getConnection();
 
    	PreparedStatement pt = conn.prepareStatement(sql);
		ResultSet rs = pt.executeQuery();
		
		while(rs.next()){
			out.println(
					rs.getInt(1)+"번은"+
					rs.getString(2)
					);
		}
	}catch(Exception e){
		out.print("<h3>실망이야</h3>");
		e.printStackTrace();
		
  }
%>
</body>
</html>