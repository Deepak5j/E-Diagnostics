<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Coach</title>
</head>
<body class="im">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);



	HttpSession hs=request.getSession(false);
	System.out.println(hs);
	String uid=(String)hs.getAttribute("uinfo");
	//String utype=(String)hs.getAttribute("uinfotype");
	if(uid==null||hs.isNew()/*||utype!="coach"*/)
	{
		request.setAttribute("msg","you are not coach");
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
		rd.forward(request,response);
	}
	else
	{%>
		<div style="width:100%;position:relative;height: 100%;padding-bottom:30px;background-color:blue;color:#00ffff;border-radius:32px;font-family: sans-serif;font-size: 20px;">
	&nbsp
	<p style="width: 21%;height: 40px;background-color:#00aa00;color: #ff0000;margin-left:40%;border-radius:32px;font-family: cursive;
	font-size: 26px;font-variant: capatelise;text-align: center;">
		Coach
	</p>
	
	<div style="width: 90%;position:relative;height: 100%;padding-bottom:30px;background-color:#00aa00;color: #ffff00;padding-left:30px;padding-right:30px;margin-right:2.5%;
		margin-left:2.5%;border-radius:32px;font-size: 28px;font-family: Agency FB;">
	
			<br/>


		<span style="padding-left:25px">Messaging</span></a>
		<br/><br/>
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