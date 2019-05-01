package net.member.db;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pt = null;
	ResultSet re = null;
	request.setCharacterEncoding("euc-kr");
	
	public MemberDAO() {
		try{
			Context init = new InitialContext();
	  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	  		conn = ds.getConnection();
		}catch(Exception ex){
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	//로그인시 아이디와 비번이 맞는지 확인
	public boolean idCheck(String id, String pw) {
		String sql = "select pw from test where id = ?"; 
		try {
			pt = conn.prepareStatement(sql);
			pt.setString(1, id);
			re = pt.executeQuery();
			if(re.next()) {
				if(re.getString("pw").equals(pw)) {
					return true;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pt!=null){pt.close(); pt = null;}  //닫아줌
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return false;
	}
	
	//회원정보 삭제 
	public boolean memberDelete(String id) {
		String sql = "delete from test where id=?";
		try{
			pt=conn.prepareStatement(sql);
			pt.setString(1, id);
			pt.executeUpdate();
			return true;
		}catch(Exception e){
		    e.printStackTrace();
		}finally{
			try{
				if(pt!=null){pt.close(); pt = null;}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return false;
	}
	
	//회원가입 정보 입력
	public boolean memberInsert(MemberBean memberbean) throws SQLException {

		String sql = "insert into test values(?,?,?,?,?,?,?,?)"; 	
	    try{
	       pt = conn.prepareStatement(sql); //생성한 쿼리 입력
	
	       pt.setString(1, memberbean.getId());
	       pt.setString(2, memberbean.getPw());
	       pt.setString(3, memberbean.getEmail());
	       pt.setString(4, memberbean.getName());
	       pt.setString(5, memberbean.getJumin());
	       pt.setString(6, memberbean.getBirth());
	       pt.setString(7, memberbean.getIntro());
	       pt.setString(8, memberbean.getInter());

	       pt.executeUpdate(); //쿼리 실행


	       return true;
	      
	       
	       
	    }catch(RuntimeException | SQLException er){

			conn.rollback(); //오류시 롤백
		}finally{
			try{
				if(pt!=null){pt.close(); pt = null;}  //닫아줌
			}catch(Exception e){
				e.printStackTrace();
			}
		}

	    return false;
	}
	
	//회원정보 가져오기
	public MemberBean getMemDetail(String id) throws SQLException {
		String sql = "select * from test where id = ?";
		try{	   
	  		pt = conn.prepareStatement(sql);
	  		pt.setString(1, id);
	  		re = pt.executeQuery();
	  		
	  		if(!re.next()) {return null;}
	  		
	  		
		  	MemberBean memberbean = new MemberBean();
	  		memberbean.setId(re.getString("id"));
	  		memberbean.setPw(re.getString("pw"));
	  		memberbean.setEmail(re.getString("email"));
	  		memberbean.setName(re.getString("name"));
	  		memberbean.setJumin(re.getString("jumin"));
	  		memberbean.setBirth(re.getString("birth"));
	  		memberbean.setInter(re.getString("inter"));
	  		memberbean.setIntro(re.getString("intro"));
	  		
	  		return memberbean;
	  		
	  		
		}catch(SQLException se) {
			se.printStackTrace();
		}finally {
			try{
				if(pt!=null){pt.close(); pt = null;}  //닫아줌
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return null;
	}
	
	//회원정보 리스트용
	public List getMemberList() throws SQLException {
		List list = new ArrayList();
		try{	   
	  		pt = conn.prepareStatement("select * from test where id != 'admin'");
	  		re = pt.executeQuery();
	  		while(re.next()) {
		  		MemberBean memberbean = new MemberBean();
	  			memberbean.setId(re.getString("id"));
	  			memberbean.setPw(re.getString("pw"));
	  			memberbean.setEmail(re.getString("email"));
	  			memberbean.setName(re.getString("name"));
	  			memberbean.setJumin(re.getString("jumin"));
	  			memberbean.setBirth(re.getString("birth"));
	  			memberbean.setInter(re.getString("inter"));
	  			memberbean.setIntro(re.getString("intro"));
	  			list.add(memberbean);
	  		}
	  		
	  		return list;
	  		
		}finally{
			try{
				if(pt!=null){pt.close(); pt = null;}  //닫아줌
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	//커넥션을 닫는다
	public void connClose() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}


