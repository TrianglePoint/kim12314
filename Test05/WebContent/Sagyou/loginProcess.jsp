<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 아이디 비번이 디비에 있으면 메인으로 감</title>
</head>
<body>
<%
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	Connection conn = null; 
	String sql = "select * from test where id = ?"; 	
	PreparedStatement pt = null;
	ResultSet re = null;
	
	try {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();

		pt = conn.prepareStatement(sql);
		pt.setString(1, id);
		re = pt.executeQuery();

		if(re.next()){
			if(pw.equals(re.getString("pw"))){
				session.setAttribute("id", id);
				out.print("<script>");
				out.print("location.href='Main.jsp'");
				out.print("</script>");
			}
		}
		
		out.println("<script>");
		out.println("alert('없는 회원입니다.')");
		out.println("if(confirm('회원가입하시겠습니까?') == true){");
		out.println("location.href='joinForm.jsp'");
		out.println("}else");
		out.println("location.href='loginForm.jsp'");
		out.print("</script>");
	
	}catch(Exception e){
		out.print("<h3>실망이야</h3>");
		e.printStackTrace();
	
	}finally{
		try{
			if(pt!=null){pt.close(); pt = null;}  //닫아줌
			if(conn!=null){conn.close(); conn = null;}  //닫아줌
		}catch(Exception e){
			e.printStackTrace();
		}
	}


%>
</body>
</html>