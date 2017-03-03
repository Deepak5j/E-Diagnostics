<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="esports.dbinfo.CrudOperation,java.sql.ResultSet,java.util.Enumeration,java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Member</title>
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
</head>
<body class="im">
<%

	
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	//getting path upto the server store
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	System.out.println("\n============================================\n");
	System.out.println("\n---->scheme="+request.getScheme()+"<----\n");
	System.out.println("\n---->server name="+request.getServerName()+"<----\n");
	System.out.println("\n---->server name 2="+request.getServerName()+"<----\n");
	System.out.println("\n---->path="+path+"<----\n");
	System.out.println("\n---->basepath="+basePath+"<----\n");	
	//got path
	
	HttpSession hs=request.getSession(false);
	System.out.println("\n---->Session="+hs+"<-----\n");
	String uid=(String)hs.getAttribute("uinfo");
	if(uid==null||hs.isNew())
	{
		request.setAttribute("msg", "Unauthorised access");
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
		rd.forward(request, response);
	}
	else
	{
		//now getting into the user folder
		String newpath=basePath+uid;
		System.out.println("\n---->newpath="+newpath+"<----\n");
		//now getting pic name from dB
		String picname="";
		String imgsource=null;
		String strsql="select * from signup where id=?";
		ResultSet rs=CrudOperation.getData(strsql,uid);
		if(rs.next())
		{
			picname=rs.getString("picname");
		}
		if(picname!=null)
		{
			imgsource=newpath+"/"+picname;
			System.out.println("\n---->image name="+picname+"<----\n");	
			System.out.println("\n---->image source="+imgsource+"<----\n");			
		}
		else
		{	System.out.println("\n-------default image selected-------\n");
			imgsource="/esportsclub/images/defpropic.jpg";
		}		
%>
	<div style="width:100%;height:60px;background-color:#00aa00;color:#ff0000;border-radius:32px;font-size: 26px;
		font-variant: capatelise;padding-top:20px">
		<span style="padding-left: 22px;"></span>Hello!<span style="padding-right: 22px;"></span><%=uid%>
		<span style="padding-top:0px;float:right;margin-right: 30px;">
			<%=new java.util.Date() %> <span style="padding-right: 12px"></span>
			<a style="padding:3px;margin-right:0px;border:2px solid #ff0000;border-style:inset;" href="/esportsclub/Logout">
				Logout
			</a>
		</span>		
	</div>
	<div style="width:100%;height:550px;background-color:#0000aa;color:#00ffff;margin-top:10px;border-radius:32px;
		font-size: 26px;text-align: left;font-family: cursive;">
		<span style="float:right;padding-top:50px;padding-right:50px">
			<img src="<%=imgsource %>" style="width:200px;height:200px">   <!-- Expression -->
		</span>
		<!-- img src="/esportsclub/images/defpropic.jpg" style="width:200px;height:200px";-->
		<br/>
		<a href="/esportsclub/jsp/viewprofile.jsp">
			<span style="padding-left:25px">View </span></a>your profile
		<br/><br/>
		<a href="/esportsclub/jsp/editprofile.jsp">
			<span style="padding-left:25px">Edit </span></a>your profile
			<br/><br/>
		<a href="/esportsclub/jsp/upload.jsp">
			<span style="padding-left:25px">Upload </span></a>your profile pics
			<br/><br/>

		<span style="padding-left:25px">Messaging </span></a>
		<br/>
		<a href="/esportsclub/jsp/compose.jsp">
			<span style="padding-left:25px">Compose </span></a>
			<br/>
		<a href="/esportsclub/jsp/inbox.jsp">
			<span style="padding-left:25px">Inbox </span></a>
			<br/>
		<a href="/esportsclub/jsp/senditem.jsp">
			<span style="padding-left:25px">SendItems </span></a>

	</div>
	<%}
	%>
</body>
</html>