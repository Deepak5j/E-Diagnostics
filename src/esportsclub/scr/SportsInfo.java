package esportsclub.scr;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import esports.dbinfo.CrudOperation;
import java.sql.*;

/**
 * Servlet implementation class SportsInfo
 */
@WebServlet("/SportsInfo")
public class SportsInfo extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private static Connection con=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SportsInfo() {
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
		
		
		String id=request.getParameter("vi");
		con=CrudOperation.createConnection();
		try
		{
			String str="select * from sports where id=?";
			ps=con.prepareStatement(str);
			ps.setString(1,id);
			rs=ps.executeQuery();
			
			System.out.println("======55555555555555555 =====");
			
			if(rs.next())  //either rs have true or false
			{/*
				String name = rs.getString("name");
				String info = rs.getString("info");
				String[] inf = info.split("\n");
				*/	
				System.out.println("======kkkk=====");
				
				out.println("<h1><center><u>");
				out.println(rs.getString("name"));
				out.println("</u></h1><br><div style='color:yellow;text-align:justify;padding:0px;padding-left:30px;padding-right:30px;'>");
				
				out.println(rs.getString("info"));
				
				out.println("</div><br></center>");
				/*
				for(int i=0;i<inf.length;i++)
				{
					out.println(inf[i]);
					System.out.println(i+". "+inf[i]);
					
				}*/
				
				
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
