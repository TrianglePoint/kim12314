<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script type="text/javascript">
	if(confirm("정말삭제 하시겠습니까?")==false){
		history.back();
	}
</script>
</head>
<body>
<%
	String id= null;

	if((session.getAttribute("id")==null) || (!((String)session.getAttribute("id")).equals("admin"))){
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	String delete_id = request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn=ds.getConnection();
   
		pstmt=conn.prepareStatement("delete from test where id=?");
		pstmt.setString(1, delete_id);
		pstmt.executeUpdate();
   
		out.println("<script>");
		out.println("location.href='Member_list.jsp'");
		out.println("</script>");
	}catch(Exception e){
	    e.printStackTrace();
	}finally{
		try{
			if(conn!=null){conn.close(); conn = null;}  //닫아줌
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>