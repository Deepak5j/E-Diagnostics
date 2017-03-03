package esportsclub.scr;

import java.io.File;    //57

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat; //94
import java.util.Enumeration; //72

import esports.dbinfo.CrudOperation;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;  //64
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
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
		System.out.println("#######################  Execution of upload.java STARTS here  ################################");
		//*********geting id from session
		HttpSession hs=request.getSession(false);
		System.out.println("\n---->Session="+hs+"<----\n");
		String uid=(String)hs.getAttribute("uinfo");
		
		//*********geting path via servlet context
		ServletContext scx=getServletContext();
		String path=scx.getRealPath("/");
		System.out.println("\n--->path="+path+"<---\n");
		
		String newpath=path+uid;
		
		//creating directory
		File f=new File(newpath);
		if(!f.exists())
		{
			f.mkdir();
			System.out.println("--->new directory created<----");
		}
		else
		{
			System.out.println("--->NO new directory created<----");
		}
		
		//****************storing image at the path
		//MultipartRequest mpt=new MultipartRequest(request,newpath,6*1024*1024);<<--will make replacement of older file with same name
		//---line:80 will store image at the location
		MultipartRequest mpt=new MultipartRequest(request,newpath,6*1024*1024,new DefaultFileRenamePolicy());
		System.out.println("-->image uploaded successfuly<---");
	
		//*****************getting values from form of upload.jsp by mpt
		//String desc=request.getParameter("description");<<-- will always return null.....so do not use if entype="" is used
		String desc=mpt.getParameter("description");
		String date=mpt.getParameter("dob");
		System.out.println("\n--->upload description="+desc+"<---\n--->date="+date+"<----\n");
		
		//*****************geting information about the uploaded file
		//Enumeration<?>   <------interface use to dig values from collection
		//getFileNames   <----- return the reference of collection of data uploaded
		Enumeration<?> e=mpt.getFileNames(); //gets all files in directory refer by obj 'e'
		File fileobj=null;
		String filename=null;
		String ctrlname=null;
		if(e!=null)
		{
			while(e.hasMoreElements())  //like isNext()
			{
				ctrlname=(String)e.nextElement();//go to file
				fileobj=mpt.getFile(ctrlname);//get reference of file
				filename=fileobj.getName();//get the name
				System.out.println("\n--->fileobj="+fileobj+"<----\n");
				System.out.println("\n---->filename="+filename+"<-----\n");
				System.out.println("\n----->control name="+ctrlname+"<----\n");
			}
			
		}
		
		//<----DATE HANDLING
		
		java.util.Date jdate=null;   //java date 
		java.sql.Date sdate=null;   //sql date   both are different
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  //mm for minutes
		try
		{
			jdate=sdf.parse(date);  //date from jsp parse into sdf and store into jdate 
		}
		catch(ParseException e1)
		{
			e1.printStackTrace();
		}
		
		sdate=new java.sql.Date(jdate.getTime());
		System.out.println("\n--->date="+sdate+"<-----\n");
		
		//<------updating table
		Connection con=null;
		PreparedStatement ps=null;
		con=CrudOperation.createConnection();
		try
		{
			//(1) String str="insert into profilepic values(?,?,?,?)";
			String str="update signup set picname=?, date=?, picdesc=? where id=?";
			ps=con.prepareStatement(str);
			ps.setString(1, filename);
			ps.setDate(2, sdate);
			ps.setString(3, desc);
			ps.setString(4, uid);
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				System.out.println("--->row added in profilepic table<-----");
				response.sendRedirect("/esportsclub/jsp/member.jsp");
			}
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
		System.out.println("#######################  Execution of upload.java ENDS here  ################################");
	}
}
