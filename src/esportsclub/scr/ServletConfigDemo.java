package esportsclub.scr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletConfigDemo
 */
@WebServlet(
		urlPatterns = { "/ServletConfigDemo" }, 
		initParams = { 
				@WebInitParam(name = "clr", value = "blue"), 
				@WebInitParam(name = "email", value = "Deepak@gmail.com")
		})
public class ServletConfigDemo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletConfigDemo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		ServletConfig sc= getServletConfig();
		String color=sc.getInitParameter("clr");
		String em=sc.getInitParameter("email");
		PrintWriter out=response.getWriter();
		out.println("<body bgcolor="+color+">");
		out.println("<h1 align='center'>"+em+"</h1>");
		    		   
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

}
