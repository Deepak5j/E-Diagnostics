<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Profile Images</title>
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
<link rel="stylesheet" type="text/css" href="/esportsclub/css/log.css">
<script type="text/javascript">
	function dis(val)
	{
		if(val=="other")
			document.getElementById("city").style.display="block";
		else
			document.getElementById("city").style.display="none";
	}
</script>
</head>
<body class="im">
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("uinfo");
if(uid==null||hs.isNew())
{
	request.setAttribute("msg", "Unauthorised access");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response);
}
else{
%>
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
		<br/>Upload Profile Images
	</p>
	<div style="margin-left:32%">
		<form method="post" action="/esportsclub/Upload" enctype="multipart/form-data"> <!-- enctype -->
			<table style="border-spacing:20px; border-style:inset;">
			<tr>
    			<td>Browse Picture</td>
    			<td><input type="file" name="photo" id="photo"></td>
  			</tr>
  			<tr>
    			<td>Picture Description</td>
    			<td><input type="text" name="description" id="name" placeholder="description" required="required" ></td>
  			</tr>
  			<tr>
    			<td>Date of Birth</td>
    			<td><input type="Date" name="dob" id="dob" required="required"></td>
  			</tr>
  			<tr>
    			<th><button type="reset" >reset</button></th>
   				<th><button type="submit" >submit</button></th>
  				</tr>
			</table>
		</form>
	</div>
</div><%} %>
</body>
</html>