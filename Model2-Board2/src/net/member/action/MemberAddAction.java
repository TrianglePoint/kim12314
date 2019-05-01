package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.spi.protocol.ForwardException;

import net.action.Action;
import net.action.ActionForward;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberAddAction implements Action{
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean memberbean = new MemberBean();
		request.setCharacterEncoding("euc-kr");

		String arr[] = request.getParameterValues("inter");
		int temp = arr.length;
		String inter="";
		for(int i = 0;i<temp;i++) {
			inter = inter+arr[i]+" ";
		}


		memberbean.setId(request.getParameter("id"));
		memberbean.setPw(request.getParameter("pw"));
		memberbean.setEmail(request.getParameter("email"));
		memberbean.setName(request.getParameter("name"));
		memberbean.setJumin(request.getParameter("jumin")+"-"+request.getParameter("jumin2"));
		memberbean.setBirth(request.getParameter("year")+"."+request.getParameter("month")+"."+request.getParameter("day"));
		memberbean.setIntro(request.getParameter("intro"));
		memberbean.setInter(inter);

		if(!memberdao.memberInsert(memberbean)) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('123')");
			out.print("</script>");
			return null;
		}	

		ActionForward forward = new ActionForward();

		forward.setRedirect(true);

		forward.setPath("MemberLoginForm.mo");
		memberdao.connClose();
		return forward;
	 }
}

