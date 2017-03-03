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

/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private static Connection con=null;
	private static PreparedStatement ps=null;       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
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
		String em=request.getParameter("email");
		String ph=request.getParameter("phone");
		String strsql="update signup set email=?, phone=? where id=?";
				
		
		HttpSession hs=request.getSession(false);
		String uid=(String)hs.getAttribute("uinfo");
		
		
		
		
		try
		{
			con=CrudOperation.createConnection(); //create connection with dB
			ps=con.prepareStatement(strsql);  // querry preparation
			ps.setString(1, em); //settting values
			ps.setString(2, ph);
			ps.setString(3, uid);
			int rw=ps.executeUpdate();  //query execution
			if(rw>0)
			{
				response.sendRedirect("/esportsclub/jsp/viewprofile.jsp");
			}
			System.out.println("=*****===>"+uid+"<=****===");
		}
		catch(SQLException s)
		{
			try
			{
				if(con!=null)
					con.close();
				if(ps!=null)
					ps.close();
					
			}
			catch(SQLException se)
			{
				se.printStackTrace();
			}
		}
		
	}

}
