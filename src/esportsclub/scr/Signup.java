package esportsclub.scr;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import esports.dbinfo.CrudOperation;
/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement pslogin,psreg=null;
	private ResultSet rs=null;  //select * from ...
	private int flag = 0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("====== ENTER ==> doGet of Signup ====");
		System.out.println("======(ENTER) flag: "+flag+"====");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String uid=request.getParameter("ui");
		con=CrudOperation.createConnection();
		try
		{
			String str="select * from logininfo where id=?";
			pslogin=con.prepareStatement(str);
			pslogin.setString(1,uid);
			rs=pslogin.executeQuery();
			
			if(rs.next())  //either rs have true or false
			{
				flag=1;//  flag sets to 1 shows this block has been executed
				System.out.println("======="+flag+"==============");
				out.println("user id already exists ");
				System.out.println("====== "+rs.next()+" =====");
			}
		}
		catch(SQLException a)
		{
			a.printStackTrace();
		}		
		System.out.println("=======(EXIT) flag: "+flag+"==============");
		System.out.println("======EXIT==> doGet of Signup ====");		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("======ENTER==> doPost of Signup ====");	
		System.out.println("=======(ENTER) flag: "+flag+"==============");
		if(flag==1)
		{		
			request.setAttribute("reset-message","Form gets reset. Please! don't ignore warning next time");
			System.out.println("=== signup page gets resets=====");
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/signup.jsp");
			rd.forward(request,response);
			//response.sendRedirect("/esportsclub/jsp/signup.jsp");	
		}
		else
		{

			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
		
			String name,email,id,pass,phone,city,gen=null;
			
			name=request.getParameter("name");
			email=request.getParameter("email");
			id=request.getParameter("id");
			pass=request.getParameter("pass");
			gen=request.getParameter("gen");
			city=request.getParameter("city");
			phone=request.getParameter("phone");
			
			String[] hobby=request.getParameterValues("hobby");
			String hob="";
			if(hobby==null) //fixing null pointer exception error
			{
				hob="no hobby selected";
			}
			else
			{
				for(String hb1:hobby)
				{
					hob=hob+hb1+",";
				}
			}
			
			con=CrudOperation.createConnection();
			try
			{
				con.setAutoCommit(false);
				
				String logininsert="insert into logininfo values(?,?,?)";
				String reginsert="insert into signup (id,name,email,phone,gender,hobby,city) values(?,?,?,?,?,?,?)";
				
				pslogin=con.prepareStatement(logininsert);//<-
				psreg=con.prepareStatement(reginsert);//<-
				
				pslogin.setString(1, id);
				pslogin.setString(2, pass);
				pslogin.setString(3, "member");
				
				System.out.println(pslogin);
				int rw=pslogin.executeUpdate();
				
				psreg.setString(1, id);
				psreg.setString(2, name);
				psreg.setString(3, email);
				psreg.setLong(4,Long.parseLong(phone));
				psreg.setString(5, gen);
				psreg.setString(6, hob);
				psreg.setString(7, city);
				
				System.out.println(psreg);
				int rw1=psreg.executeUpdate();
				if(rw>0&&rw1>0)
				{
					con.setAutoCommit(true);
					System.out.println("reg done successfuly");
					response.sendRedirect("/esportsclub/jsp/login.jsp");
				}		
			}
			catch(SQLException se)
			{
				System.out.println(se);
			}
			finally
			{
				try
				{
					if(pslogin!=null)
						pslogin.close();
					if(psreg!=null)
						psreg.close();
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
			}		
		}
		System.out.println("=======(EXIT) flag: "+flag+"==============");
		System.out.println("======EXIT==> doPost of Signup ====");	
	}

}
