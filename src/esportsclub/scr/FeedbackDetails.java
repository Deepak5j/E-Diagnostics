package esportsclub.scr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FeedbackDetails
 */
@WebServlet("/FeedbackDetails")
public class FeedbackDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackDetails() {
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
		/*response.setContentType("text/html");*/
		PrintWriter out = response.getWriter();
		String x = (String) request.getAttribute("info");
		String[] arr = x.split(",");
		out.println("<body bgcolor='black'><br/><br/><br/><center><span style='font-size:40px; color:aqua'>");
		out.println("<span style='font-size: 46px; color:red'><b>"+arr[0]+"</span></b> your feedback is "
				+ "<span style='font-size: 46px; color:lime'><b>'"+arr[2]+"'</span></b> "+ " Soon we will contact you on given phone no. "
						+ "<span style='font-size: 46px; color:blue'><b>"+arr[1]+"</span></b>");
	}

}
