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
 * Servlet implementation class AdminDelete
 */
@WebServlet("/AdminDelete")
public class AdminDelete extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private static Connection con=null;
	private static PreparedStatement ps=null;       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String[] uid=request.getParameterValues("chkbox");
		String strsql="delete from logininfo where id=?";
		con=CrudOperation.createConnection();
		try
		{
			ps=con.prepareStatement(strsql);
			for(int i=0;i<uid.length;i++)
			{
				ps.setString(1, uid[i]);//here order not matters//---------------->>setNString(1,uid[i])<<--------
				ps.addBatch();
			}
			ps.executeBatch();
			response.sendRedirect("/esportsclub/jsp/admindelete.jsp");
		}
		catch(SQLException s)
		{
			try
			{
				con.rollback();
				response.sendRedirect("/esportsclub/admindelete.jsp");
			}
			catch(SQLException se)
			{
				se.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}

}
