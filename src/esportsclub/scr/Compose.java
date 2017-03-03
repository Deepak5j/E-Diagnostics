package esportsclub.scr;

import java.io.IOException;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import esports.dbinfo.*;
/**
 * Servlet implementation class Compose
 */
@WebServlet("/Compose")
public class Compose extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compose() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("#################   message sending STARTS  ###############");
		//******take values from form
		String receiverid=request.getParameter("receiver");
		String subtext=request.getParameter("subject");
		String msgtext=request.getParameter("message");
		
		System.out.println("\n\nreceiver id:"+receiverid);
		System.out.println("\nsubject:"+subtext);
		System.out.println("\nmessage:"+msgtext);
		
		//dig out uid and utype from session
		HttpSession hs=request.getSession();
		String senderid=(String)hs.getAttribute("uinfo");
		String sendertype=(String)hs.getAttribute("uinfotype");
		
		//get date
		java.util.Date dt=new java.util.Date();
		java.sql.Date sd= new java.sql.Date(dt.getTime());
		
		System.out.println("\n\ndt:"+dt);
		System.out.println("\nsd: "+sd+"\n");
		
		//inserting into table
		con=CrudOperation.createConnection();
		System.out.println("\n\ncon: "+con);
		try
		{
			con.setAutoCommit(false);			
			
			String strsql="insert into message(senderid,receiverid,msgtext,subject,senderstatus,receiverstatus,date) value(?,?,?,?,?,?,?)";
			System.out.println("\n\nstrsql: "+strsql);
			
			ps=con.prepareStatement(strsql);
						
			ps.setString(1, senderid);					
			ps.setString(2, receiverid);					
			ps.setString(3, msgtext);									
			ps.setString(4, subtext);					
			ps.setBoolean(5, true);					
			ps.setBoolean(6, true);					
			ps.setDate(7, sd);					
			
			int rw=ps.executeUpdate();
			System.out.println("\n\nrw: "+rw);
			
			if(rw>0)
			{	//redirecting to required page
				con.setAutoCommit(true);
				if(sendertype.equals("admin"))
					response.sendRedirect("/esportsclub/jsp/admin.jsp");
				if(sendertype.equals("coach"))
					response.sendRedirect("/esportsclub/jsp/coach.jsp");
				if(sendertype.equals("manager"))
					response.sendRedirect("/esportsclub/jsp/manager.jsp");
				if(sendertype.equals("member"))
					response.sendRedirect("/esportsclub/jsp/member.jsp");
			}
		}
		catch(SQLException s)
		{
			s.printStackTrace();
		}
		
		System.out.println("#################   message sending ENDS  ###############");
	}
}
