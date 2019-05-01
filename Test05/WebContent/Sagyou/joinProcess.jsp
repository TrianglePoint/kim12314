<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입정보를 디비에 넣기</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String jumin = request.getParameter("jumin")+"-"+request.getParameter("jumin2");
	String birth = request.getParameter("year")+"."+request.getParameter("month")+"."+request.getParameter("day");
	String intro = request.getParameter("intro");
	String[] arr = request.getParameterValues("inter");
	
	int temp = arr.length;
	String inter = "";
	for(int i = 0; i<temp;i++){
		inter = inter+arr[i]+",";
	}
	
	Connection conn = null; 
	String sql = "insert into test values(?,?,?,?,?,?,?,?)"; 	
	String sql1= "select id from test";
	PreparedStatement pt = null;
	ResultSet rs = null;
    try{
       Context init = new InitialContext();
       DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
       conn= ds.getConnection();
       
       pt= conn.prepareStatement(sql1);
       rs= pt.executeQuery();
       
       while(rs.next()){
          String id1 = rs.getString(1);
          if (id.equals(id1)){
             out.println("<script>alert('아이디가 중복됩니다.');history.back(); </script>");
          }
       }
       
		pt = conn.prepareStatement(sql); //생성한 쿼리 입력
		
		pt.setString(1, id);
		pt.setString(2, pw);
		pt.setString(3, email);
		pt.setString(4, name);
		pt.setString(5, jumin);
		pt.setString(6, birth);
		pt.setString(7, inter);
		pt.setString(8, intro);

		pt.executeUpdate(); //쿼리 실행
		
		
		out.println("<script>");
		out.println("alert('회원가입이 완료되었습니다.')");
		out.println("location.href='loginForm.jsp'");
		out.print("</script>");
		
		
		
		conn.commit(); //커밋
		
		
	
	}catch(RuntimeException | SQLException er){

		conn.rollback(); //오류시 롤백
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