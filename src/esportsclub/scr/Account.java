package esportsclub.scr;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import esports.dbinfo.*;
import java.sql.*;

/**
 * Servlet implementation class Account
 */
@WebServlet("/Account")
public class Account extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement pslogin=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("txt/html");
		String upass,uid,utype=null;
		
		upass=request.getParameter("pass");
		uid=request.getParameter("id");
		utype=request.getParameter("type");
		
		con=CrudOperation.createConnection();
		
		try 
		{
			con.setAutoCommit(false);
			
			String accinsert="insert into logininfo values(?,?,?)";
			
			pslogin=con.prepareStatement(accinsert);
			
			pslogin.setString(1, uid);
			pslogin.setString(2, upass);
			pslogin.setString(3, utype);
			
			int rw=pslogin.executeUpdate();
			
			if(rw>0)
			{
				con.setAutoCommit(true);
				System.out.println("user account created!");
				response.sendRedirect("/esportsclub/jsp/account.jsp");				
			}
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
		}
		finally
		{
			try 
			{
				if(pslogin!=null)
					pslogin.close();
			} 
			catch (Exception e2) 
			{
				e2.printStackTrace();
			}
		}
	}
}
