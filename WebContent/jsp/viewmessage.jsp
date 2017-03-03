<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="esports.dbinfo.CrudOperation,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view message</title>
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
<script type="text/javascript">
function back(tmp)
{
	if(tmp==0)
		window.location.href="/esportsclub/jsp/senditem.jsp";
	if(tmp==1)
		window.location.href="/esportsclub/jsp/inbox.jsp";
	
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
	System.out.println(hs);
	
	String uid=(String)hs.getAttribute("uinfo");
	if(uid==null||hs.isNew())
	{
		request.setAttribute("msg", "unauthorise access!");
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
		rd.forward(request, response);		
	}
	else{
%>
<div style="width:100%;position:relative;height: 100%;padding-bottom:100px;background-color:blue;color:#00ffff;border-radius:32px;font-family: sans-serif;
		font-size: 20px;">
	<br>		<span style="padding-left: 22px;"></span>Hello!<span style="padding-right: 22px;"></span><%=uid%>
		<span style="padding-top:0px;float:right;margin-right: 30px;">
			<%=new java.util.Date() %> <span style="padding-right: 12px"></span>
			<a style="padding:3px;margin-right:0px;border:2px solid #ff0000;border-style:inset;" href="/esportsclub/Logout">
				Logout
			</a>
		</span><br>
	<p style="width: 90%;height: 40px;background-color:#005500;color: #ff0000;padding:15px;padding-left:30px;padding-right:30px
	;margin-left:2.5%;margin-right:2.5%;
	border-radius:32px;font-family: cursive;font-size: 26px;font-variant: capatelise;text-align: center;">
		MESSAGE
	</p>
	<div style="width: 90%;position:relative;height: 100%;padding-bottom:50px;background-color:#005500;color: #ffff00;padding-left:30px;padding-right:30px;
	margin-right:2.5%;margin-left:2.5%;border-radius:32px;font-size: 28px;font-family: Agency FB;">

	<%
		String mid=request.getParameter("msid");
		int flag=Integer.parseInt(request.getParameter("flag"));

		System.out.println("\n=======mid=\n"+request.getParameter("msid"));
		int id=Integer.parseInt(mid);
		String strsql="select * from message where msgid=?";
		ResultSet rs=CrudOperation.getData(strsql,id);
		if(rs.next())
		{
			%>
				<div style="padding-top:30px;border-color: red">
					<span style="padding-left:25px;color:red">
						Subject:
					</span>
					<table style="margin-left:110px;position:relative;width: 82%;height: 100%;">
						<tr><td><%=rs.getString("subject") %></td></tr>
					</table>
				</div>
				<div style="padding-top:30px;position:relative;width: 90%;height: 100%;">
					<span style="padding-left:25px;color:red;">
						Message:
					</span>
					<table style="margin-left:110px;position:relative;width: 90%;height: 100%;">
					<%
						String mes=rs.getString("msgtext");
						for(String i: mes.split("\n"))
						{
					%>
							<tr><td><%=i %></td></tr>
							<%
						}
							%>	
					</table>
	<%}%>
	</div>
	<br/>
	<form style="color:red" align="center"><center>
		<input style="border-size:10px;border:40px;border-color:green;font-size:20px ;color:rgb(145,55,25); background-color: rgb(255,255,2); size:20px" type="button" value="back" onClick="back('<%=flag%>')">
	</center>
	</form>
</div><%}%>
</body>
</html>