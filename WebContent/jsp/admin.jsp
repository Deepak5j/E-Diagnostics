<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
</head>
<body class="im">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);


	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	HttpSession hs=request.getSession(false);
	System.out.println(hs);
	String uid=(String)hs.getAttribute("uinfo");
	//String utype=(String)hs.getAttribute("uinfo2");
	//String utype=(String)hs.getAttribute("uinfo");
	if(uid==null||hs.isNew()/*||utype=="admin"*/)
	{
		request.setAttribute("msg", "Unauthorised access!");
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
		rd.forward(request, response);
	}
	else{
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
		
		<table style="border-spacing:20px; border-style:grove;margin-left:2%;padding-top:2%">
  			<tr>
    			<td><a href="/esportsclub/jsp/account.jsp"><center>Create Account</center></a></td>
			</tr>
			<tr>
    			<td><a href="/esportsclub/jsp/adminview.jsp"><center>View Account</center></a></td>
			</tr>
			<tr>
    			<td><a href="/esportsclub/jsp/admindelete.jsp"><center>Delete Account</center></a></td>
			</tr>
			<tr>
    			<td><a href="/esportsclub/jsp/adminprodelete.jsp"><center>Delete Member Data</center></a></td>
			</tr>
			<tr></tr><tr></tr><tr></tr>
			<tr>
    			<td><a href="/esportsclub/jsp/compose.jsp"><center>Compose</center></a></td>
			</tr>
			<tr>
    			<td><a href="/esportsclub/jsp/inbox.jsp"><center>Inbox</center></a></td>
			</tr>
			<tr>
    			<td><a href="/esportsclub/jsp/senditem.jsp"><center>Senditems</center></a></td>
			</tr>
			
		</table>
	</div>
<%}
%>
</body>
</html>