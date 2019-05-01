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
	String sql = "insert into student(num,name) values(?,?)"; 	
	
	try {
		Context init = new InitialContext();
    	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
    	conn = ds.getConnection();
 
    	PreparedStatement pt = conn.prepareStatement(sql);
		String[] arr = {"沙耶香","悠里","麻優","ひかる"};
		
		for(int i= 7;i<=10;i++){
			pt.setInt(1, i);
			pt.setString(2, arr[i-7]);
			if(pt.executeUpdate() != 0){
				out.println(i+"번 레코드를 등록했음");
			}
		}
	}catch(Exception e){
		out.print("<h3>실망이야</h3>");
		e.printStackTrace();
		
  }
%>
</body>
</html>