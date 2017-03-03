<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ page import="java.sql.*,esports.dbinfo.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/esportsclub/css/bg-link.css">
<title>inbox</title>
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
<style type="text/css" media="screen">
table th 
{
	border: 2px solid #ff0000;
	text-align: center;
	padding:9px;
}
table td
{
	border: 2px solid black;
	text-align: center;
	padding:5px;
}
</style>
</head>
<body class="im">
<%

response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);


	System.out.println("#######################  index.jsp execution STARTS #######################");
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
	<div style="width:100%;height:60px;background-color:#00aa00;color:#ff0000;
	border-radius:32px;font-size: 26px;font-variant: capatelise;padding-top:20px">
		<span style="padding-left: 22px;"></span>Hello!<span style="padding-right: 22px;"></span><%=uid%>
		<span style="padding-top:0px;float:right;margin-right: 30px;">
			<%=new java.util.Date() %> <span style="padding-right: 12px"></span>
			<a style="padding:3px;margin-right:0px;border:2px solid #ff0000;border-style:inset;" href="/esportsclub/Logout">
				Logout
			</a>
		</span>	
	</div>
	<div style="width:100%;height:100%;background-color:#0000aa;color:#00ffff;
			margin-top:10px;border-radius:32px;font-size: 26px;text-align: left;
			font-family: cursive;padding-bottom:40px;">

		<div style="padding-top:30px;color:#aaffaa;text-align:center;padding-bottom:30px;">List of Messages Received</div> 	
		<div>
			<form method="post" action="/esportsclub/DeleteMessage">
				<table  align="center" style="font-size: 20px;font-family: serif;
					border-collapse:collapse;border:1px solid #ff0000">
					<tr>
						<th>S.No.</th>
						<th>Select</th>
   						<th>Sender ID</th>
   						<th>Date</th>
   						<th>Subject</th>
  					</tr>
  					<%  			
  						String strsql="select * from message where receiverid=? and receiverstatus='1'";

  						ResultSet rs=CrudOperation.getData(strsql,uid);
  						System.out.println("\n===receiverid:==="+uid+"=======\n");
  						int i=0;
  						while(rs.next())
  						{i++;%>
  					<tr>
  						<td><%=i %></td>
  						<td ><input type="checkbox" name="chkbox" value="<%=rs.getInt("msgid")%>"></td>
  						<td><%=rs.getString("senderid")%></td>
  						<td><%=rs.getDate("date")%></td><!-- from table column -->
  						<td><a href="/esportsclub/jsp/viewmessage.jsp?msid=<%=rs.getInt("msgid") %>&flag=<%=1%>"><%=rs.getString("subject")%></a></td>
  					</tr>
  					<%} %>
  					<!--sapn style="padding-top:100px;">Total accounts: <%=i %></sapn-->
  					<tr>
    					<th colspan=5><button type="submit">delete</button></th>
  					</tr>
				</table>
				<input type="hidden" name="choice" value="inbox">
			</form>
		</div>
		<form style="color:red; padding-top:20px" align="center"><center>
			<input style="border-size:10px;border:40px;border-color:green;font-size:20px ;color:rgb(145,55,25); background-color: rgb(255,255,2); size:20px" type="button" value="back" onClick="back('<%=utype%>')">
		</center>
		</form>
	</div><%}System.out.println("#######################  index.jsp execution ENDS #######################");%>
</body>
</html>