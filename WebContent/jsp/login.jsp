<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
<link rel="stylesheet" type="text/css" href="/esportsclub/css/log.css">
</head>
<body class="im">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

%>
<div id="fullpage">
	&nbsp
	<p class="content">
		Sign In
	</p>
<div style="margin-left:37%">
	<form method="post" action="/esportsclub/Login">
		<table style="border-spacing:20px; border-style:inset;">
  			<tr>
    			<th>ID</th>
    			<th><input type="text" name="txtid" id="ID" placeholder="yourmail@gmail.com" required="required" ></th>
  			</tr>
  			<tr>
    			<th>Password</th>
    			<th><input type="password" name="txtpass" id="pass" placeholder="password" required="required"></th>
  			</tr>
  			<tr>
  				<th colspan="2"><button type="submit" >submit</button></th>
  			</tr>
  			<tr>
  				<!-- receiving message for unauthorise access -->
  				<%
  					String message=(String)request.getAttribute("msg");
  					if(message!=null)
  					{
  				%>
  					<center><td colspan="2" style="color:#ff0000"><%=message%></td></center>
  				<%		
  					}
  				%>
  				<!-- for unauthorise access -->
  			</tr>
		</table>	
	</form>
</div>
</div>
</body>
</html>