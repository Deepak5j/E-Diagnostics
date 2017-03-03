<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>compose</title>
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
<link rel="stylesheet" type="text/css" href="/esportsclub/css/log.css">
<script type="text/javascript">
function back(tmp)
{
	if(tmp=="member")
	window.location.href="/esportsclub/jsp/member.jsp";
	if(tmp=="admin")
		window.location.href="/esportsclub/jsp/admin.jsp";
	if(tmp=="coach")
		window.location.href="/esportsclub/jsp/coach.jsp";
	if(tmp=="manager")
		window.location.href="/esportsclub/jsp/manager.jsp";
}
</script>
</head>
<body class="im">
<%

response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

	System.out.println("#######################  senditem.jsp execution STARTS #######################");
	HttpSession hs=request.getSession(false);
	System.out.println(hs);
	
	String uid=(String)hs.getAttribute("uinfo");
	String utype=(String)hs.getAttribute("uinfotype");
	if(uid==null||hs.isNew())
	{
		request.setAttribute("msg", "unauthorise access!");
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
		<br/>Compose Messages
	</p>
<div style="margin-left:37%">
	<form method="post" action="/esportsclub/Compose">
		<table style="border-spacing:20px; border-style:inset;">
  			<tr>
    			<th>Receiver</th>
    			<th><input type="text" name="receiver" id="receiver" placeholder="registered user id" required="required" ></th>
  			</tr>
  			<tr>
    			<th>Subject</th>
    			<th><input type="text" name="subject" id="subject" placeholder="subject here" required="required"></th>
  			</tr>
  			<!-- tr>
    			<th>Message</th>
    			<th><input type="text" name="message" id="message" placeholder="message here" required="required"></th>
  			</tr-->  
  			<tr>
    			<th>Message</th>
    			<td>
    				<textarea rows="6" cols="21" name="message" id="message" placeholder="message here" required="required">
    				</textarea>
    			</td>
  			</tr>			
  			<tr>
  				<th colspan="2"><button type="submit" >send</button></th>
  			</tr>
		</table>	
	</form>
</div>
	<form style="color:red; padding-top:20px" align="center"><center>
			<input style="border-size:10px;border:40px;border-color:green;font-size:20px ;color:rgb(145,55,25); background-color: rgb(255,255,2); size:20px" type="button" value="back" onClick="back('<%=utype%>')">
		</center>
		</form>
</div><%} %>
</body>
</html>