package esportsclub.scr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Company;

/**
 * Servlet implementation class ContexDemo
 */
@WebServlet("/ContextDemo")
public class ContextDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContextDemo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		ServletContext sc=getServletContext();
		String info=sc.getInitParameter("msg");
		PrintWriter out=response.getWriter();
		out.println("<h1 align='center'>"+info+"</h1>");
		
		Company c1 = (Company) sc.getAttribute("cinfo");
		out.print("Company---"+c1.getName());
		out.print("Company---"+c1.getPhone());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
	}

}
