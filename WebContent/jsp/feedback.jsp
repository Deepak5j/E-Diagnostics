<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback</title>
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
<link rel="stylesheet" type="text/css" href="/esportsclub/css/log.css">
</head>
<body class="im">
<%

response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

	HttpSession hs=request.getSession(false);
	System.out.println();
	String uid=(String)hs.getAttribute("uinfo");
	if(uid==null||hs.isNew())
	{
		request.setAttribute("msg","Please login to give feedback!");
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
		rd.forward(request,response);
	}
	else
	{%>
	<div id="fullpage">
	<br>
			<span style="padding-left: 22px;"></span>Hello!<span style="padding-right: 22px;"></span><%=uid%>
		<span style="padding-top:0px;float:right;margin-right: 30px;">
			<%=new java.util.Date() %> <span style="padding-right: 12px"></span>
			<a style="padding:3px;margin-right:0px;border:2px solid #ff0000;border-style:inset;" href="/esportsclub/Logout">
				Logout
			</a>
		</span>
		<br>
	<p class="content">
		Feedback Form
	</p>
<div style="margin-left:37%">
	<form method="post" action="/esportsclub/Feedback">
		<table style="border-spacing:20px; border-style:inset;">
  			<tr>
    			<td>User name</td>
    			<td><input type="text" name="txtname" id="txtname" placeholder="registered user name" required="required" ></td>
  			</tr>
  			<tr>
    			<td>Phone no.</td>
    			<td><input type="number" name="txtph" id="txtph" placeholder="your mobile no." required="required"></td>
  			</tr>
  			<tr>
  				<td>Feedback</td>
  				<td><textarea rows="5" cols="21" name="feedback" id="feedback" placeholder="your feedback here"></textarea></td>
  			</tr>
  			<tr>
  				<th colspan="2"><button type="submit">submit</button></th>
  			</tr>
		</table>	
	</form>
</div>
</div>
	
	<%}
%>
</body>
</html>