<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Account</title>
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
	System.out.println(hs);
	String uid=(String)hs.getAttribute("uinfo");
	//String utype=(String)hs.getAttribute("uinfo2");
	if(uid==null||hs.isNew())
	{
		request.setAttribute("msg","Unauthorise access");
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
		rd.forward(request,response);
	}
	else
	{%>
		<div id="fullpage">
	&nbsp
	<p class="content">
		<br/>Create Account
	</p>
<div style="margin-left:37%">
	<form method="post" action="/esportsclub/Account">
		<table style="border-spacing:20px; border-style:inset;">
  			<tr>
    			<td>User ID</td>
    			<th><input type="text" name="id" id="ID" placeholder="yourmail@mail.com" required="required" ></th>
  			</tr>
  			<tr>
    			<td>Password</td>
    			<td><input type="password" name="pass" id="pass" placeholder="password" required="required"></td>
  			</tr>
  			<tr>
  				<td>Type</td>
  				<td>
    				<select name="type">
    					<option value="select-type">Select type</option>
    					<option value="coach" >Coach</option>
    					<option value="manager">Manager</option>
    				</select>
    				<input type="text" name="city" id="city" style="display:none"  >
  				</td>
  			</tr>
  			<tr>
  				<th colspan="2"><button type="submit" >submit</button></th>
  			</tr>
		</table>	
	</form>
</div>
</div>
	
	<%
		
	}

%>

</body>
</html>