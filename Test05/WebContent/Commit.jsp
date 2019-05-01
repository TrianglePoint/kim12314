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
	PreparedStatement pt = null;
	ResultSet re = null;
	String sql1 = "insert into student(num,name) values(12,'Nogi')";
	String sql2 = "select * from student where num=11";
	
	try {
		Context init = new InitialContext();
    	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
    	conn = ds.getConnection();
 		
    	conn.setAutoCommit(false);
    	
    	pt = conn.prepareStatement(sql1);
    	pt.executeUpdate();
    	pt.close();
    	
    	pt = conn.prepareStatement(sql2);
    	re = pt.executeQuery();
    	if(!re.next()){
    		conn.rollback();
    		out.println("<h3>데이터 삽입에 문제가 발생하여 롤백함</h3>");
    	}else{
    		conn.commit();
    		out.println("<h3>데이터 삽입 오케이</h3>");
    	}
    	pt.close();
    	conn.setAutoCommit(true);
	}catch(Exception e){
		out.print("<h3>데이터 삽입에 실패</h3>");
		e.printStackTrace();
		
  }
%>
</body>
</html>