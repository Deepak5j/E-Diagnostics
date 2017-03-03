package esportsclub.scr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import esports.dbinfo.CrudOperation;
import java.sql.*;

/**
 * Servlet implementation class SportsForm
 */
@WebServlet("/SportsForm")
public class SportsForm extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private static Connection con=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SportsForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("====== ENTER ==> doGet of Sports ====");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String id=request.getParameter("fi");
		con=CrudOperation.createConnection();
		try
		{
			String str="select * from forminfo where id=?";
			ps=con.prepareStatement(str);
			ps.setString(1,id);
			rs=ps.executeQuery();
			
			System.out.println("======55555555555555555 =====");
			
			if(rs.next())  //either rs have true or false
			{
				System.out.println("======kkkk=====");
				
				
				out.println(rs.getString("name")+"z");
				
				out.println(rs.getString("hour")+"z");
				
				out.println(rs.getString("charge"));
				
				
				System.out.println("======ddddddddddddddddddddddd=====");
			}
			System.out.println("======6666666666666666=====");
		}
		catch(SQLException a)
		{
			a.printStackTrace();
		}		
		
		System.out.println("======EXIT==> doGet of Sports ====");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

}
