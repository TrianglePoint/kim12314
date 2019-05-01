package net.member.action;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.Action;
import net.action.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberLoginAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean memberbean = new MemberBean();
		request.setCharacterEncoding("euc-kr");
		
	
		memberbean.setId(request.getParameter("id"));
		memberbean.setPw(request.getParameter("pw"));
		

		if(!memberdao.idCheck(memberbean.getId(), memberbean.getPw())) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 잘못되었습니다.')");
			out.println("location.href='./MemberLoginForm.mo';");
			out.println("</script>");
			out.close();
			System.out.println("7");
			return null;
		}
		
		session.setAttribute("id", memberbean.getId());
		ActionForward forward= new ActionForward();
		forward.setRedirect(true);
   		forward.setPath("./BoardList.bo");
   		memberdao.connClose();
		return forward;
	 }
}
