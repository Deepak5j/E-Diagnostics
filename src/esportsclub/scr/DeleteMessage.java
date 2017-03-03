package esportsclub.scr;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import esports.dbinfo.*;

/**
 * Servlet implementation class DeleteMessage
 */
@WebServlet("/DeleteMessage")
public class DeleteMessage extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private static Connection con=null;
	private static PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessage() {
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
		System.out.println("==deletion starts here==");
		String[] chkmsg = request.getParameterValues("chkbox");
		con=CrudOperation.createConnection();
		String choice = request.getParameter("choice");
		String str=null;
		if(choice.equals("inbox"))
		{
			str="update message set receiverstatus=? where msgid=?";
		}
		if(choice.equals("senditem"))
		{
			str="update message set senderstatus=? where msgid=?";
		}
		try
		{
			ps=con.prepareStatement(str);
			for(int i=0;i<chkmsg.length;i++)
			{
				ps.setInt(1, Integer.parseInt("0"));
				ps.setInt(2, Integer.parseInt(chkmsg[i]));
				ps.addBatch();								
			}
			ps.executeBatch();
			if(choice.equals("inbox"))
				response.sendRedirect("/esportsclub/jsp/inbox.jsp");
			if(choice.equals("senditem"))
				response.sendRedirect("/esportsclub/jsp/senditem.jsp");
		}
		catch(SQLException s)
		{
			try
			{
				con.rollback();
				if(choice.equals("inbox"))
					response.sendRedirect("/esportsclub/jsp/inbox.jsp");
				if(choice.equals("senditem"))
					response.sendRedirect("/esportsclub/jsp/senditem.jsp");
			}
			catch(Exception a)
			{
				a.printStackTrace();
			}
		}
		System.out.println("==deletion ends here==");
	}

}
