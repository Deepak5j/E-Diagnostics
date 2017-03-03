package esportsclub.scr;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import esports.dbinfo.CrudOperation;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() 
    {
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
		System.out.println("==================sports club starts here====================");
		String uid=request.getParameter("txtid");
		String upass=request.getParameter("txtpass");
		
		con=CrudOperation.createConnection();
		String strsql="select * from logininfo where id=? and pass=?";//table column
		
		try 
		{
			ps=con.prepareStatement(strsql);
			ps.setString(1, uid);
			ps.setString(2, upass);
			System.out.println("------------>"+ps+"<------------");
			rs=ps.executeQuery();
			if(rs.next())
			{
				
				HttpSession hs=request.getSession();
				hs.setAttribute("uinfo",uid);
				hs.setAttribute("uinfotype",rs.getString("type"));
				
				String utype=rs.getString("type");
				if(utype.equals("admin"))//table column
				{
					response.sendRedirect("/esportsclub/jsp/admin.jsp");
				}
				if(utype.equals("member"))//table column
				{
					response.sendRedirect("/esportsclub/jsp/member.jsp");
				}
				if(utype.equals("manager"))//table column
				{
					response.sendRedirect("/esportsclub/jsp/manager.jsp");
				}
				if(utype.equals("coach"))//table column
				{
					response.sendRedirect("/esportsclub/jsp/coach.jsp");
				}
			}
			
			else
			{
				response.sendRedirect("/esportsclub/jsp/login.jsp");
			}	
		}
		catch (SQLException se) 
		{
			System.out.println(se);
		}
		finally 
		{
			try 
			{
				if(ps!=null)
					ps.close();
				if(rs!=null)
					rs.close();
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
		System.out.println("==================sports club ends here====================");
	}
}
